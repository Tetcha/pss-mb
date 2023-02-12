enum OrderType { asc, desc }

class ISelectItem {
  String label;
  dynamic value;

  ISelectItem({
    this.label = '',
    this.value = '',
  });
}
