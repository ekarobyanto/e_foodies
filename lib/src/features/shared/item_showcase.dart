import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/styles.dart';
import '../menu/presentation/widgets/menu_showcase_card.dart';
import '../store/presentation/widgets/store_card.dart';

class ItemShowcase extends StatefulWidget {
  ItemShowcase({
    super.key,
    required this.title,
    required this.route,
    required this.items,
  });

  List items;
  String title;
  String route;

  @override
  State<ItemShowcase> createState() => _ItemShowcaseState();
}

class _ItemShowcaseState extends State<ItemShowcase> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: Styles.font.blg,
            ),
            InkWell(
              onTap: () {
                context.push(widget.route);
              },
              child: Text(
                'Lihat semua',
                style: Styles.font.sm.copyWith(
                  color: Styles.color.darkGreen,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        widget.items.isEmpty
            ? const Center(
                child: Text('Item belum tersedia'),
              )
            : ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: widget.items.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if (widget.title == 'Warung') {
                    return WarungCard(
                      warung: widget.items[index],
                    );
                  } else {
                    return MenuShowcase(
                      menu: widget.items[index],
                    );
                  }
                },
              ),
      ],
    );
  }
}
