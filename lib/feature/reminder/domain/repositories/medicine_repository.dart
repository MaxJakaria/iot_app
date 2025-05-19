import 'package:fpdart/fpdart.dart';
import 'package:iot_app/feature/reminder/domain/entities/medicine.dart';

abstract interface class MedicineRepository {
  Future<Either<Exception, Medicine>> uploadMedicine({
    required String name,
    required String time,
  });

  Stream<List<Medicine>> watchMedicines();

  Future<Either<Exception, void>> removeMedicine({required String name});
}
