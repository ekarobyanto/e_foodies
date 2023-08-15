part of 'image_bloc.dart';

@freezed
class ImageEvent with _$ImageEvent {
  const factory ImageEvent.started() = _Started;
  const factory ImageEvent.pickImage(ImageSource source) = _PickImage;
}
