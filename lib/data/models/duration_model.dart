class DurationModel {
  final int days;
  final int hours;
  final int minutes;

  DurationModel({
    required this.days,
    required this.hours,
    required this.minutes,
  });

  factory DurationModel.fromJson(Map<String, dynamic> json) {
    return DurationModel(
      days: json['Days'] ?? 0,
      hours: json['Hours'] ?? 0,
      minutes: json['Minutes'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'Days': days, 'Hours': hours, 'Minutes': minutes};
  }
}
