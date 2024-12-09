class Info {
  String type;
  int count;
  bool pinned;

  Info({
    required this.type,
    required this.count,
    required this.pinned,
  });

  @override
  String toString() {
    // TODO: implement toString
    return 'type: $type, count: $count, pinned: $pinned';
  }
}
