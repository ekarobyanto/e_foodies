import 'package:e_foodies/src/features/shared/circle_net_pic.dart';
import 'package:e_foodies/src/features/shared/loading_screen.dart';
import 'package:e_foodies/src/features/shared/rounded_container.dart';
import 'package:e_foodies/src/features/store/domain/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../constants/styles.dart';
import '../../../core/data/storage/storage_repository.dart';
import '../../../core/domain/failure.dart';
import '../../../core/domain/pagination.dart';
import '../../auth/data/auth_repository.dart';
import '../data/search_repository.dart';
import 'cubit/search_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static const _pageSize = 5;
  final TextEditingController _queryController = TextEditingController();

  final PagingController<int, Store> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {});
    super.initState();
  }

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey, String query) async {
    _pagingController.refresh();
    try {
      final Pagination<Store> newItems = await SearchRepository().search(
        query: query,
        token: await StorageRepository().read(key: 'access'),
        pageKey: pageKey,
        pageSize: _pageSize,
      );
      final isLastPage = newItems.next == null;
      if (isLastPage || _pagingController.itemList!.length < _pageSize) {
        _pagingController.appendLastPage(newItems.results);
      } else {
        final nextPageKey = pageKey + 1;
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
          _fetchPage(pageKey, query);
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
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BlocProvider(
        create: (context) => SearchCubit(),
        child: Builder(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              toolbarHeight: 0,
              backgroundColor: Styles.color.darkGreen,
            ),
            body: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: SizedBox(
                height: 1.sh,
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: RoundedContainer(
                        radius: 20,
                        alignment: Alignment.center,
                        child: TextField(
                          autofocus: true,
                          onSubmitted: (v) {
                            if (v != '') {
                              context.read<SearchCubit>().startSearch();
                              _fetchPage(1, v);
                            }
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            icon: IconButton(
                              iconSize: 24,
                              alignment: Alignment.center,
                              splashRadius: 30,
                              onPressed: () => context.pop(),
                              icon: const Icon(
                                Icons.arrow_back_outlined,
                                color: Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Styles.color.primary),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: 'Cari menu atau warung...',
                            hintStyle:
                                Styles.font.sm.copyWith(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () => const SizedBox(),
                          searching: () {
                            return SizedBox(
                              height: 0.85.sh,
                              child: PagedListView(
                                shrinkWrap: true,
                                pagingController: _pagingController,
                                builderDelegate:
                                    PagedChildBuilderDelegate<Store>(
                                  firstPageProgressIndicatorBuilder:
                                      (context) => const LoadingScreen(),
                                  noItemsFoundIndicatorBuilder: (context) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Tidak ada hasil',
                                          style: Styles.font.base,
                                        ),
                                      ],
                                    );
                                  },
                                  itemBuilder: (context, item, index) {
                                    return ListTile(
                                      onTap: () {
                                        context.push('/store/${item.id}');
                                      },
                                      leading: CircleNetPic(
                                        height: 60.h,
                                        width: 55.h,
                                        src: item.img ?? '',
                                      ),
                                      title: Text(item.name),
                                      subtitle: Text(item.address),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
