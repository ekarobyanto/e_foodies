import 'package:intl/intl.dart';

String convertCurrency(int price) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: 0,
  ).format(price);
}
