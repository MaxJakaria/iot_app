import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:iot_app/feature/reminder/data/Model/medicine_model.dart';

abstract class MedicineRemoteDataSource {
  Future<MedicineModel> medicineUpload(MedicineModel medicine);
  Stream<List<MedicineModel>> watchMedicines();
  Future<void> removeMedicine(String name);
}

class MedicineRemoteDataSourceImpl implements MedicineRemoteDataSource {
  final FirebaseFirestore firebase;

  MedicineRemoteDataSourceImpl({required this.firebase});
  @override
  Future<MedicineModel> medicineUpload(MedicineModel medicine) async {
    try {
      await firebase
          .collection('Medicines')
          .doc(medicine.name)
          .set(medicine.toJson());

      return medicine;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Stream<List<MedicineModel>> watchMedicines() {
    return firebase
        .collection('Medicines')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map((doc) => MedicineModel.fromJson(doc.data()))
                  .toList(),
        );
  }

  @override
  Future<void> removeMedicine(String name) async {
    await firebase.collection('Medicines').doc(name).delete();
  }
}
