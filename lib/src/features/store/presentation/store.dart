// ignore_for_file: must_be_immutable
import 'dart:developer';

import 'package:e_foodies/src/core/bloc/account/account_bloc.dart';
import 'package:e_foodies/src/core/data/storage/storage_repository.dart';
import 'package:e_foodies/src/features/shared/background.dart';
import 'package:e_foodies/src/features/shared/circle_net_pic.dart';
import 'package:e_foodies/src/features/shared/error_screen.dart';
import 'package:e_foodies/src/features/shared/loading_screen.dart';
import 'package:e_foodies/src/features/shared/shrink_property.dart';
import 'package:e_foodies/src/features/store/presentation/widgets/store_menu_items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../constants/styles.dart';
import '../../../utills/currency_formatter.dart';
import '../../auth/data/auth_repository.dart';
import '../../shared/rounded_container.dart';
import '../data/store_repository.dart';
import '../domain/order-form/order_form.dart';
import 'bloc/open_store_bloc.dart';
import 'cubit/order_menu_cubit.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({super.key, required this.storeId, this.menuId});

  final String storeId;
  String? menuId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OpenStoreBloc(
            storageRepository: context.read<StorageRepository>(),
            authRepository: context.read<AuthRepository>(),
            storeRepository: context.read<StoreRepository>(),
          )..add(OpenStoreEvent.viewStore(storeId)),
        ),
        BlocProvider(
          create: (context) => OrderMenuCubit(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Styles.color.darkGreen,
          toolbarHeight: 0,
        ),
        bottomSheet: Builder(builder: (context) {
          return BlocBuilder<OrderMenuCubit, OrderMenuState>(
            builder: (context, state) {
              return state.maybeWhen(
                orderUpdated: (orders) {
                  OrderMenuCubit cubit = context.read<OrderMenuCubit>();
                  OpenStoreBloc bloc = context.read<OpenStoreBloc>();
                  return orders.isEmpty
                      ? const SizedBox()
                      : InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              showDragHandle: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                  topRight: Radius.circular(20.r),
                                ),
                              ),
                              builder: (_) {
                                return MultiBlocProvider(
                                  providers: [
                                    BlocProvider.value(
                                      value: cubit,
                                    ),
                                    BlocProvider.value(
                                      value: bloc,
                                    ),
                                  ],
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Menu',
                                              style: Styles.font.base,
                                            ),
                                            Text(
                                              'Total Harga',
                                              style: Styles.font.base,
                                            )
                                          ],
                                        ),
                                        Divider(
                                          color: Styles.color.darkGreen,
                                          thickness: 2,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        BlocBuilder<OrderMenuCubit,
                                            OrderMenuState>(
                                          builder: (context, state) {
                                            return state.maybeWhen(
                                              orElse: () => const SizedBox(),
                                              orderUpdated: (orderss) => Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: orderss
                                                    .map((order) =>
                                                        OrderList(order: order))
                                                    .toList(),
                                              ),
                                            );
                                          },
                                        ),
                                        Text(
                                          'Total : ${convertCurrency(
                                            orders.fold(
                                              0,
                                              (previousValue, element) =>
                                                  previousValue +
                                                  element.menu.price! *
                                                      element.quantity,
                                            ),
                                          )}',
                                          style: Styles.font.bold,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        BlocBuilder<OpenStoreBloc,
                                            OpenStoreState>(
                                          builder: (context, state) {
                                            return state.maybeWhen(
                                              orElse: () => const SizedBox(),
                                              storeLoaded: (store) =>
                                                  ShrinkProperty(
                                                onTap: () async {
                                                  Uri url = Uri.parse(
                                                      "whatsapp://send?phone=${store.phone.replaceFirst('0', '+62')}&text=Halo, saya ingin memesan : \n${orders.map((e) => '${e.menu.name} ${e.quantity}x\nCatatan : ${e.note}').toList().join('\n')}\nTotal : ${convertCurrency(orders.fold(0, (previousValue, element) => previousValue + element.menu.price! * element.quantity))}\nAtas nama : ${context.read<AccountBloc>().state.maybeWhen(
                                                            orElse: () => '',
                                                            succes: (account) =>
                                                                account
                                                                    .username,
                                                          )}\nAlamat : ${context.read<AccountBloc>().state.maybeWhen(
                                                            orElse: () => '',
                                                            succes: (account) =>
                                                                account.address,
                                                          )}");

                                                  log('launching wa ${store.phone}');
                                                  await launchUrl(url);
                                                },
                                                child: RoundedContainer(
                                                  radius: 20.r,
                                                  alignment: Alignment.center,
                                                  color: Styles.color.primary,
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10,
                                                      horizontal: 20),
                                                  child: Text(
                                                    'Pesan via WhatsApp',
                                                    style: Styles.font.base
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.all(5),
                            child: RoundedContainer(
                              padding: const EdgeInsets.all(10),
                              radius: 30,
                              color: Styles.color.primary,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${orders.length} Pesanan',
                                    style: Styles.font.bold.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Total : ${convertCurrency(
                                      orders.fold(
                                        0,
                                        (previousValue, element) =>
                                            previousValue +
                                            element.menu.price! *
                                                element.quantity,
                                      ),
                                    )}',
                                    style: Styles.font.bold.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                },
                orElse: () => const SizedBox(),
              );
            },
          );
        }),
        body: SingleChildScrollView(
          child: Background(
            child: SizedBox(
              width: 1.sw,
              child: BlocBuilder<OpenStoreBloc, OpenStoreState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    storeLoaded: (store) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 0.1.sh,
                          ),
                          Center(
                            child: CircleNetPic(
                              src: store.img ?? '',
                              height: 150.h,
                              width: 150.h,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.store,
                                    color: Styles.color.darkGreen,
                                  ),
                                  Text(
                                    store.name,
                                    style: Styles.font.bxl2,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Styles.color.darkGreen,
                                  ),
                                  Text(
                                    store.address,
                                    style: Styles.font.sm,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: Styles.color.darkGreen,
                                  ),
                                  Text(
                                    ' ${store.openTime} - ${store.closeTime}',
                                    style: Styles.font.sm,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            'Menu',
                            style: Styles.font.bxl2,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          BlocBuilder<OrderMenuCubit, OrderMenuState>(
                            builder: (context, state) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: store.recipes.length,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    height: 10.h,
                                  ),
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return StoreMenuItems(
                                      menu: store.recipes[index],
                                      cubit: context.read<OrderMenuCubit>(),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 100.h,
                          )
                        ],
                      ),
                    ),
                    orElse: () => const Center(child: LoadingScreen()),
                    error: (e) => ErrorScreen(
                      error: e,
                      onRetry: () {
                        context
                            .read<OpenStoreBloc>()
                            .add(OpenStoreEvent.viewStore(storeId));
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OrderList extends StatelessWidget {
  const OrderList({
    super.key,
    required this.order,
  });

  final OrderForm order;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleNetPic(src: order.menu.img, height: 40.h, width: 40.h),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          order.menu.name,
                          style: Styles.font.base,
                        ),
                        Text(
                          ' ${order.quantity}x',
                          style: Styles.font.bold,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        context.read<OrderMenuCubit>().removeOrder(form: order);
                        if (context.read<OrderMenuCubit>().orders.isEmpty) {
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        'Hapus Pesanan',
                        style: Styles.font.sm.copyWith(
                          color: Styles.color.danger,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              convertCurrency(order.menu.price! * order.quantity),
              style: Styles.font.bold,
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        if (order.note != '')
          Row(
            children: [
              Text(
                'Catatan : ',
                style: Styles.font.base,
              ),
              Text(
                order.note!,
                style: Styles.font.base,
              ),
            ],
          ),
      ],
    );
  }
}
