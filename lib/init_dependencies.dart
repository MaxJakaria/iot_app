import 'package:get_it/get_it.dart';
import 'package:iot_app/feature/reminder/data/repositories/medicine_repository_impl.dart';
import 'package:iot_app/feature/reminder/domain/repositories/medicine_repository.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  serviceLocator
    ..registerLazySingleton<MedicineRepositoryImpl>(
      () => MedicineRepositoryImpl(),
    )
    ..registerLazySingleton<MedicineRepository>(() => MedicineRepositoryImpl());
}
