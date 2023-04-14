class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    required this.time,
    this.isExpanded = false,
  });

  String expandedValue;
  String time;
  String headerValue;
  bool isExpanded;

  static List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
      time: '$index:30',
    );
  });
}
}