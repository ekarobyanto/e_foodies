import 'package:flutter/material.dart';

import '../../../constants/styles.dart';

class EditMenu extends StatelessWidget {
  const EditMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Styles.color.darkGreen,
      ),
    );
  }
}
