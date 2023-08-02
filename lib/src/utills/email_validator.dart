import 'package:email_validator/email_validator.dart';

validateEmail(String email) {
  return EmailValidator.validate(email);
}
