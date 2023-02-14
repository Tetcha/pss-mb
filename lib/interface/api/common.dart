class FilterResponse<T> {
  final int count;
  final List<T> data;

  FilterResponse({required this.count, required this.data});
}
