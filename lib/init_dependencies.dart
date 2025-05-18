import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:iot_app/feature/reminder/data/datasource/medicine_remote_data_source.dart';
import 'package:iot_app/feature/reminder/data/repositories/medicine_repository_impl.dart';
import 'package:iot_app/feature/reminder/domain/repositories/medicine_repository.dart';
import 'package:iot_app/feature/reminder/presentation/bloc/reminder_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // Register FirebaseFireStore
  serviceLocator.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );
  // Register remote data source
  serviceLocator.registerLazySingleton<MedicineRemoteDataSource>(
    () => MedicineRemoteDataSourceImpl(
      firebase: serviceLocator<FirebaseFirestore>(),
    ),
  );
  // Register repository
  serviceLocator.registerLazySingleton<MedicineRepository>(
    () => MedicineRepositoryImpl(
      remoteDataSource: serviceLocator<MedicineRemoteDataSource>(),
    ),
  );
  // Register bloc
  serviceLocator.registerFactory<ReminderBloc>(
    () => ReminderBloc(serviceLocator<MedicineRepository>()),
  );
}
