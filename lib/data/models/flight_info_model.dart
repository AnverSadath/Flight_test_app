class FlightInfoModel {
  final String nameEn;
  final String nameAr;
  final String code;
  final String number;
  final String cabinClass;
  final String equipmentNumber;

  FlightInfoModel({
    required this.nameEn,
    required this.nameAr,
    required this.code,
    required this.number,
    required this.cabinClass,
    required this.equipmentNumber,
  });

  factory FlightInfoModel.fromJson(Map<String, dynamic> json) {
    final name = json['Name'] ?? {};

    return FlightInfoModel(
      nameEn: name['en'] ?? '',
      nameAr: name['ar'] ?? '',
      code: json['Code'] ?? '',
      number: json['Number'] ?? '',
      cabinClass: json['CabinClass'] ?? '',
      equipmentNumber: json['EquipmentNumber'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': {'en': nameEn, 'ar': nameAr},
      'Code': code,
      'Number': number,
      'CabinClass': cabinClass,
      'EquipmentNumber': equipmentNumber,
    };
  }
}
