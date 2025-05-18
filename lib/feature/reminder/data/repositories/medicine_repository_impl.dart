import 'package:fpdart/fpdart.dart';
import 'package:iot_app/feature/reminder/data/Model/medicine_model.dart';
import 'package:iot_app/feature/reminder/data/datasource/medicine_remote_data_source.dart';
import 'package:iot_app/feature/reminder/domain/entities/medicine.dart';
import 'package:iot_app/feature/reminder/domain/repositories/medicine_repository.dart';

class MedicineRepositoryImpl implements MedicineRepository {
  final List<Medicine> _medicines = [];
  final MedicineRemoteDataSource remoteDataSource;

  MedicineRepositoryImpl({required this.remoteDataSource});

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

  @override
  Future<Either<Exception, Medicine>> uploadMedicine({
    required String name,
    required String time,
  }) async {
    try {
      final model = MedicineModel(name: name, time: time);
      final uploaded = await remoteDataSource.medicineUpload(model);
      return right(uploaded);
    } catch (e) {
      return left(Exception(e.toString()));
    }
  }
}
