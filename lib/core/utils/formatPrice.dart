String formatPrice(double price) {

  String stringPrice = price.toString();
  List<String> priceList = stringPrice.split(".");
  if (priceList[1].length <= 2) {
    return price.toString();
  } else {
    String temp = priceList[1].substring(0, 2);

    if (int.parse(priceList[1][3]) >= 5) {
      temp = priceList[1][0] + (int.parse(priceList[1][1]) + 1).toString() ;
    }

    return priceList[0] + "." + temp;
  }

  return "";
}