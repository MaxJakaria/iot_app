import 'package:iot_app/feature/reminder/domain/entities/medicine.dart';

class MedicineModel extends Medicine {
  MedicineModel({required super.name, required super.time});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'name': name, 'time': time};
  }

  factory MedicineModel.fromJson(Map<String, dynamic> map) {
    return MedicineModel(
      name: map['name'] as String,
      time: map['time'] as String,
    );
  }
}
