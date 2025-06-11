void main() {

  Map<String, List<String>> selectedItems = {};
  selectedItems.putIfAbsent("1", () => []).add("1");
  selectedItems.putIfAbsent("1", () => []).add("12");

  selectedItems.forEach(
    (key, value) {
      print(key);
      print(value);
    }
  );


}