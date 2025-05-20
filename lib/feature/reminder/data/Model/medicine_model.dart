import 'package:iot_app/feature/reminder/domain/entities/medicine.dart';

class MedicineModel extends Medicine {
  MedicineModel({required super.name, required super.time, required super.day});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'name': name, 'time': time, 'day': day};
  }

  factory MedicineModel.fromJson(Map<String, dynamic> map) {
    return MedicineModel(
      name: map['name']?.toString() ?? '',
      time: map['time']?.toString() ?? '',
      day: map['day']?.toString() ?? '',
    );
  }

  MedicineModel copyWith({String? name, String? time, String? day}) {
    return MedicineModel(
      name: name ?? this.name,
      time: time ?? this.time,
      day: day ?? this.day,
    );
  }
}
