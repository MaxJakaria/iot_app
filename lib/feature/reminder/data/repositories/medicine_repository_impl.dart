import 'package:fpdart/fpdart.dart';
import 'package:iot_app/feature/reminder/data/Model/medicine_model.dart';
import 'package:iot_app/feature/reminder/data/datasource/medicine_remote_data_source.dart';
import 'package:iot_app/feature/reminder/domain/entities/medicine.dart';
import 'package:iot_app/feature/reminder/domain/repositories/medicine_repository.dart';

class MedicineRepositoryImpl implements MedicineRepository {
  final MedicineRemoteDataSource remoteDataSource;

  MedicineRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Exception, Medicine>> uploadMedicine({
    required String name,
    required String time,
    required String day,
  }) async {
    try {
      final model = MedicineModel(name: name, time: time, day: day);
      final uploaded = await remoteDataSource.medicineUpload(model);
      return right(uploaded);
    } catch (e) {
      return left(Exception(e.toString()));
    }
  }

  @override
  Stream<List<Medicine>> watchMedicines() {
    return remoteDataSource.watchMedicines().map(
      (medicines) =>
          medicines
              .map(
                (medicine) => Medicine(
                  name: medicine.name,
                  time: medicine.time,
                  day: medicine.day,
                ),
              )
              .toList(),
    );
  }

  @override
  Future<Either<Exception, void>> removeMedicine({required String name}) async {
    try {
      await remoteDataSource.removeMedicine(name);
      return right(null);
    } catch (e) {
      return left(Exception(e.toString()));
    }
  }
}
