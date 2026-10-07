class FareDetailsModel {
  final String currency;
  final String baseFare;
  final String tax;
  final int decimalPoint;
  final String total;

  FareDetailsModel({
    required this.currency,
    required this.baseFare,
    required this.tax,
    required this.decimalPoint,
    required this.total,
  });

  factory FareDetailsModel.fromJson(Map<String, dynamic> json) {
    return FareDetailsModel(
      currency: json['Currency'] ?? '',
      baseFare: json['BaseFare'] ?? '0',
      tax: json['Tax'] ?? '0',
      decimalPoint: json['DecimalPoint'] ?? 0,
      total: json['Total'] ?? '0',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Currency': currency,
      'BaseFare': baseFare,
      'Tax': tax,
      'DecimalPoint': decimalPoint,
      'Total': total,
    };
  }
}
