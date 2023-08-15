import 'package:bloc/bloc.dart';
import 'package:e_foodies/src/utills/image_cropper.dart';
import 'package:e_foodies/src/utills/image_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'image_event.dart';
part 'image_state.dart';
part 'image_bloc.freezed.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(const _Initial()) {
    on<ImageEvent>((event, emit) async {
      await event.when(
        started: () {},
        pickImage: (source) async {
          final image = await pickImage(source);
          if (image != null) {
            final croppedImage = await cropImage(image.path);
            if (croppedImage != null) {
              emit(_ImageUpdated(croppedImage.path));
            }
          }
        },
      );
    });
  }
}
