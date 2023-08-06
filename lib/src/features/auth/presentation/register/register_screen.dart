import 'package:e_foodies/src/constants/styles.dart';
import 'package:flutter/material.dart';

import '../../../shared/background.dart';
import 'widgets/register_content.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
          backgroundColor: Styles.color.darkGreen,
        ),
        body: SingleChildScrollView(
          child: Background(
            child: RegisterContent(
                nameCtrl: _nameCtrl,
                emailCtrl: _emailCtrl,
                passwordCtrl: _passwordCtrl),
          ),
        ),
      ),
    );
  }
}
