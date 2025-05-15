import 'package:iot_app/feature/reminder/domain/entities/medicine.dart';

abstract class MedicineRepository {
  List<Medicine> getMedicines();
  void addMedicine(Medicine medicine);
  void removeMedicine(Medicine medicine);
}
