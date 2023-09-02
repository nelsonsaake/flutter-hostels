String? formatPriceAmount(val) {
  return double.tryParse('$val')?.toStringAsFixed(2) ?? "";
}

String formatPrice(val) {
  return "GHS ${formatPriceAmount(val)}";
}
