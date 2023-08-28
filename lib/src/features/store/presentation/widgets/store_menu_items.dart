// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_foodies/src/features/store/presentation/cubit/order_menu_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/styles.dart';
import '../../../../utills/currency_formatter.dart';
import '../../../menu/domain/menu/menu.dart';
import '../../../shared/rounded_container.dart';
import '../../../shared/shrink_property.dart';
import '../../domain/order-form/order_form.dart';

class StoreMenuItems extends StatelessWidget {
  StoreMenuItems({super.key, required this.menu, required this.cubit});

  Menu menu;
  OrderMenuCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: ShrinkProperty(
        onTap: () {
          showStoreMenuInfo(context,
              menu: menu, cubit: context.read<OrderMenuCubit>());
        },
        child: RoundedContainer(
          radius: 20,
          border: Border.all(
            width: 2,
            color: Styles.color.primary,
          ),
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoundedContainer(
                heightWidth: Size(100.h, 100.h),
                radius: 20,
                gradient: LinearGradient(
                  colors: [
                    Styles.color.primary,
                    Styles.color.darkGreen.withOpacity(0.5),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                child: Image.network(
                  menu.img,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.error,
                      size: 30,
                      color: Styles.color.danger,
                    );
                  },
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                height: 100.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          menu.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Komposisi : ',
                          style: Styles.font.xsm,
                        ),
                        SizedBox(
                          width: 1.sw * 0.5,
                          child: Text(
                            menu.ingredients.map((e) => e.name).join(', '),
                            style: Styles.font.xsm.copyWith(color: Colors.grey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          '${menu.price != null ? convertCurrency(menu.price!) : 0}',
                          style: Styles.font.lg
                              .copyWith(color: Styles.color.darkGreen),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showStoreMenuInfo(BuildContext context,
      {required Menu menu, required OrderMenuCubit cubit}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: Colors.grey[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      builder: (context) => BlocProvider.value(
        value: cubit,
        child: Builder(builder: (context) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                8, 8, 8, MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () => context.pop(),
                          icon: const Icon(Icons.close)),
                    ],
                  ),
                  Center(
                    child: CachedNetworkImage(
                      imageUrl: menu.img,
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        color: Styles.color.danger,
                        size: 50,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(menu.name, style: Styles.font.bxl2),
                          Text(
                            menu.desc == ''
                                ? 'Deskripsi Menu ${menu.name}'
                                : menu.desc,
                            style: Styles.font.sm,
                          ),
                        ],
                      ),
                      Text(
                        '${menu.price != null ? convertCurrency(menu.price!) : 0}',
                        style: Styles.font.lg
                            .copyWith(color: Styles.color.darkGreen),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Komposisi : ',
                    style: Styles.font.base,
                  ),
                  SizedBox(
                    width: 1.sw,
                    child: Text(
                      menu.ingredients.map((e) => e.name).join(', '),
                      style: Styles.font.base
                          .copyWith(color: Styles.color.darkGreen),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Column(
                    children: [
                      FormOrder(
                        menu: menu,
                        form: context.read<OrderMenuCubit>().orders.firstWhere(
                              (element) => element.menu.id == menu.id,
                              orElse: () =>
                                  OrderForm(menu: menu, quantity: 1, note: ''),
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class FormOrder extends StatefulWidget {
  FormOrder({
    super.key,
    required this.menu,
    required this.form,
  });

  Menu menu;
  OrderForm form;

  @override
  State<FormOrder> createState() => _FormOrderState();
}

class _FormOrderState extends State<FormOrder> {
  final TextEditingController noteController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  @override
  void initState() {
    noteController.text = widget.form.note ?? '';
    quantityController.text = widget.form.quantity.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Jumlah : ',
              style: Styles.font.base,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (int.parse(quantityController.text) > 1) {
                      quantityController.text =
                          (int.parse(quantityController.text) - 1).toString();
                    }
                  },
                  icon: const Icon(Icons.remove),
                ),
                SizedBox(
                  width: 25.w,
                  child: TextField(
                    maxLength: 2,
                    textAlign: TextAlign.center,
                    controller: quantityController,
                    keyboardType: TextInputType.number,
                    cursorColor: Styles.color.darkGreen,
                    decoration: InputDecoration(
                      counterText: '',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Styles.color.darkGreen,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    quantityController.text =
                        (int.parse(quantityController.text) + 1).toString();
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Catatan',
            style: Styles.font.base,
          ),
        ),
        TextField(
          controller: noteController,
          cursorColor: Styles.color.darkGreen,
          decoration: InputDecoration(
            counterText: '',
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Styles.color.darkGreen,
                width: 2,
              ),
            ),
          ),
          keyboardType: TextInputType.multiline,
          minLines: 1,
          maxLines: 3,
        ),
        SizedBox(
          height: 10.h,
        ),
        ShrinkProperty(
          onTap: () {
            context.read<OrderMenuCubit>().updateOrder(
                  form: OrderForm(
                    menu: widget.menu,
                    quantity: int.parse(quantityController.text),
                    note: noteController.text,
                  ),
                );
            context.pop();
          },
          child: RoundedContainer(
            radius: 10.r,
            alignment: Alignment.center,
            color: Styles.color.primary,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  size: 20,
                  color: Colors.white,
                ),
                Text(
                  'Tambahkan ke keranjang',
                  style: Styles.font.base.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
