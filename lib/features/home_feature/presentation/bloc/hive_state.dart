part of 'hive_bloc.dart';

class HiveState {
  CreateStatus? createStatus;
  ReadStatus? readStatus;
  ReadAllStatus? readAllStatus;
  UpdateStatus? updateStatus;
  DeleteStatus? deleteStatus;
DeleteAllStatus?deleteAllStatus ;
  HiveState({
    required this.createStatus,
    required this.readStatus,
    required this.readAllStatus,
    required this.updateStatus,
    required this.deleteStatus,
    required this.deleteAllStatus
  });

  HiveState copyWith(
      {CreateStatus? newCreateStatus,
      ReadStatus? newReadStatus,
      ReadAllStatus? newReadAllStatus,
      UpdateStatus? newUpdateStatus,
      DeleteStatus? newDeleteStatus,
      DeleteAllStatus ? newDeleteAllStatus
      }) {
    return HiveState(
        createStatus: newCreateStatus ?? createStatus,
        readStatus: newReadStatus ?? readStatus,
        readAllStatus: newReadAllStatus ?? readAllStatus,
        updateStatus: newUpdateStatus ?? updateStatus,
        deleteStatus: newDeleteStatus ?? deleteStatus,
        deleteAllStatus: newDeleteAllStatus?? deleteAllStatus
        );
  }
}
