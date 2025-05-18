import 'package:fpdart/fpdart.dart';
import 'package:iot_app/feature/reminder/domain/entities/medicine.dart';

abstract interface class MedicineRepository {
  List<Medicine> getMedicines();
  void addMedicine(Medicine medicine);
  void removeMedicine(Medicine medicine);

  Future<Either<Exception, Medicine>> uploadMedicine({
    required String name,
    required String time,
  });
}
