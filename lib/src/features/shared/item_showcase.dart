import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/styles.dart';
import '../menu/presentation/widgets/menu_dashboard_card.dart';
import '../store/presentation/widgets/store_card.dart';

class ItemShowcase extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Styles.font.blg,
            ),
            InkWell(
              onTap: () {
                context.push(route);
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
        items.isEmpty
            ? const Center(
                child: Text('Item belum tersedia'),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if (title == 'Warung') {
                    return WarungCard(
                      warung: items[index],
                    );
                  } else {
                    return MenuDashboardCard(
                      menu: items[index],
                    );
                  }
                },
              ),
      ],
    );
  }
}
