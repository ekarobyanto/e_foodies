import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final _picker = ImagePicker();
  final pickedFile = await _picker.pickImage(source: source);
  return pickedFile;
}
