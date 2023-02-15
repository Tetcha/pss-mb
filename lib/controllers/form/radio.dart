import 'package:get/get.dart';
import 'package:pss_m/interface/form/radio/radio_data.dart';

class RadioController<T> extends GetxController {
  final String label;
  final List<IRadioData<T>> options;
  Function(T value)? onInputChange;
  final T? defaultValue;
  String name;

  var radioValue = Rx<T?>(null);

  RadioController({
    required this.label,
    required this.options,
    required this.onInputChange,
    required this.defaultValue,
    required this.name,
  });

  void handleRadioValueChange(T? newValue) {
    onInputChange!(newValue!);
    radioValue.value = newValue;
    update();
  }
}
