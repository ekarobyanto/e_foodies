import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/styles.dart';
import '../../core/bloc/image/image_bloc.dart';

class PickImageFromDialog extends StatelessWidget {
  PickImageFromDialog({
    super.key,
    required this.imageBloc,
  });

  ImageBloc imageBloc;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Gambar dari...',
        style: Styles.font.bold,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () {
              imageBloc.add(
                const ImageEvent.pickImage(ImageSource.camera),
              );
              Navigator.pop(context);
            },
            leading: const Icon(Icons.camera),
            title: Text(
              'Kamera',
              style: Styles.font.base,
            ),
          ),
          ListTile(
            onTap: () {
              imageBloc.add(const ImageEvent.pickImage(ImageSource.gallery));
              Navigator.pop(context);
            },
            leading: const Icon(Icons.photo_library),
            title: Text(
              'Galeri',
              style: Styles.font.base,
            ),
          ),
        ],
      ),
    );
  }
}
