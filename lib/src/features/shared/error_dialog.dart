/// The `ErrorDialog` class is a Flutter widget that displays an error dialog with a title and an action
/// button.
import 'package:flutter/material.dart';

import '../../constants/styles.dart';

// ignore: must_be_immutable
class ErrorDialog extends StatelessWidget {
  ErrorDialog({
    super.key,
    required this.title,
    required this.action,
    this.actionText,
  });

  final String title;
  final VoidCallback action;
  String? actionText;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: SizedBox(
        height: 325,
        width: 300,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              child: Center(
                child: Container(
                  width: 300,
                  height: 175,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 75,
                          child: Text(
                            title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: Styles.font.base,
                          ),
                        ),
                        TextButton(
                          onPressed: action,
                          child: Text(
                            actionText ?? "OK",
                            style: Styles.font.bold.copyWith(
                              color: Styles.color.primary,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(
                      Icons.dangerous_rounded,
                      color: Styles.color.danger,
                      size: 100,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
