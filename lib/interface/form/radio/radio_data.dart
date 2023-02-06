class RadioData<T> {
  String label;
  T value;
  bool selected;

  RadioData({required this.label, required this.value, this.selected = false});
}
