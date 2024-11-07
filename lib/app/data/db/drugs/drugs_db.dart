class DrugsDB {
  final String name;
  final num price;
  final String unit;
  final num? amountUnit;
  final num stock;

  DrugsDB({
    required this.name,
    required this.price,
    required this.unit,
    this.amountUnit,
    required this.stock,
  });

  // copyWith
  DrugsDB copyWith({
    final String? name,
    final num? price,
    final String? unit,
    final num? amountUnit,
    final num? stock,
  }) {
    return DrugsDB(
      name: name ?? this.name,
      price: price ?? this.price,
      unit: unit ?? this.unit,
      amountUnit: amountUnit ?? this.amountUnit,
      stock: stock ?? this.stock,
    );
  }
}
