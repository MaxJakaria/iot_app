import 'package:iot_app/feature/reminder/domain/entities/medicine.dart';
import 'package:iot_app/feature/reminder/domain/repositories/medicine_repository.dart';

class MedicineRepositoryImpl implements MedicineRepository {
  final List<Medicine> _medicines = [];

  @override
  List<Medicine> getMedicines() => List.unmodifiable(_medicines);

  @override
  void addMedicine(Medicine medicine) {
    _medicines.add(medicine);
  }

  @override
  void removeMedicine(Medicine medicine) {
    _medicines.remove(medicine);
  }
}
