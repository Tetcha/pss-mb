class IRadioData<T> {
  String label;
  T value;
  bool selected;

  IRadioData({required this.label, required this.value, this.selected = false});
}
