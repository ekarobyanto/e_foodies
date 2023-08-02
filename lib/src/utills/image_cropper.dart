import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

import '../constants/styles.dart';

cropImage(String imagePath) async {
  final croppedFile = await ImageCropper().cropImage(
    sourcePath: imagePath,
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Sesuaikan Gambar',
        toolbarColor: Styles.color.primary,
        toolbarWidgetColor: const Color(0xFF000000),
        activeControlsWidgetColor: Styles.color.darkGreen,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      )
    ],
  );
  return croppedFile;
}
