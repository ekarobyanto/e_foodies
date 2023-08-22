import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../menu/domain/menu/menu.dart';

part 'order_form.freezed.dart';

@freezed
class OrderForm with _$OrderForm {
  factory OrderForm({
    required Menu menu,
    required int quantity,
    String? note,
  }) = _OrderForm;
}
