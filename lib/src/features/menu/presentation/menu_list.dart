import 'package:e_foodies/src/features/menu/presentation/widgets/menu_showcase_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:e_foodies/src/features/menu/domain/menu/menu.dart';
import 'package:e_foodies/src/features/shared/loading_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/styles.dart';
import '../../../core/data/storage/storage_repository.dart';
import '../../../core/domain/failure.dart';
import '../../../core/domain/pagination.dart';
import '../../auth/data/auth_repository.dart';
import '../../shared/background.dart';
import '../../shared/error_screen.dart';
import '../data/menu_repository.dart';
import 'bloc/menu_bloc.dart';

class MenuList extends StatefulWidget {
  const MenuList({super.key});

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuBloc(
        authRepository: context.read<AuthRepository>(),
        storageRepository: context.read<StorageRepository>(),
        menuRepository: MenuRepository(),
      )..add(const MenuEvent.started(1, 5)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Styles.color.darkGreen,
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: BlocBuilder<MenuBloc, MenuState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Background(
                child: state.maybeWhen(
                  initial: () {
                    return SizedBox(
                      height: 1.sh,
                      width: 1.sw,
                      child: const LoadingScreen(),
                    );
                  },
                  success: (menus) {
                    return MenuItems(
                      menus: menus,
                    );
                  },
                  error: (e) {
                    return SizedBox(
                      height: 1.sh,
                      width: 1.sw,
                      child: ErrorScreen(
                        error: e,
                        onRetry: () {
                          context
                              .read<MenuBloc>()
                              .add(const MenuEvent.started(1, 5));
                        },
                      ),
                    );
                  },
                  orElse: () => const SizedBox.shrink(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MenuItems extends StatefulWidget {
  MenuItems({super.key, required this.menus});

  Pagination<Menu> menus;

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  static const _pageSize = 5;

  final PagingController<int, Menu> _pagingController =
      PagingController(firstPageKey: 2);

  @override
  void initState() {
    if (widget.menus.next == null) {
      _pagingController.appendLastPage(widget.menus.results);
    } else {
      _pagingController.addPageRequestListener((pageKey) {
        _fetchPage(pageKey);
      });
    }
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final Pagination<Menu> newItems = await MenuRepository().allMenu(
        await StorageRepository().read(key: 'access'),
        pageKey,
        _pageSize,
      );
      final isLastPage = newItems.next == null;
      if (isLastPage || _pagingController.itemList!.length < _pageSize) {
        _pagingController.appendLastPage(newItems.results);
      } else {
        final nextPageKey = pageKey + newItems.results.length;
        _pagingController.appendPage(newItems.results, nextPageKey);
      }
    } on Failure catch (e) {
      if (e.message == 'Token Expired') {
        try {
          final token = await context.read<AuthRepository>().refreshToken(
                await context.read<StorageRepository>().read(key: 'refresh'),
              );
          await Future.any(
            [
              context.read<StorageRepository>().write(
                    key: 'access',
                    value: token['access'],
                  ),
              context.read<StorageRepository>().write(
                    key: 'refresh',
                    value: token['refresh'],
                  ),
            ],
          );
          _fetchPage(pageKey);
        } on Failure catch (e) {
          _pagingController.error = e.message;
        }
      } else {
        _pagingController.error = e.message;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60.h,
          ),
          Text(
            'Menu',
            style: Styles.font.bxl6,
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            'Lihat menu yang tersedia pada warung mitra',
            style: Styles.font.sm,
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Styles.color.darkGreen,
            thickness: 2,
          ),
          PagedListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: 10.h,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Menu>(
              itemBuilder: (context, item, index) {
                return MenuShowcase(
                  menu: item,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
