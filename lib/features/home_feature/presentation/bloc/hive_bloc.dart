import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:task1/common/utils/app_strings.dart';
import 'package:task1/features/home_feature/data/my_task_entity.dart';
import 'package:task1/features/home_feature/presentation/bloc/status/create_status.dart';
import 'package:task1/features/home_feature/presentation/bloc/status/delete_all_status.dart';
import 'package:task1/features/home_feature/presentation/bloc/status/delete_status.dart';
import 'package:task1/features/home_feature/presentation/bloc/status/read_all_status.dart';
import 'package:task1/features/home_feature/presentation/bloc/status/read_status.dart';
import 'package:task1/features/home_feature/presentation/bloc/status/update_status.dart';
import 'package:task1/features/home_feature/repository/app_database.dart';
part 'hive_state.dart';
part 'hive_event.dart';

class HiveBloc extends Bloc<HiveEvent, HiveState> {
  AppDatabase appDatabase = AppDatabase.instance();
  HiveBloc()
      : super(HiveState(
            createStatus: CreateInitial(),
            readStatus: ReadInitial(),
            readAllStatus: ReadAllInitial(),
            updateStatus: UpdateInitial(),
            deleteStatus: DeleteInitial(),
            deleteAllStatus: DeleteAllInitial())) {



    on<CreateEvent>((event, emit) async {
      bool isCreated = await appDatabase.create(text: event.text);
      if (isCreated) {
        List<MyText>? textsList =  Hive.box<MyText>(AppStrings.boxName).values.toList() ;
        emit(state.copyWith(newReadAllStatus: ReadAllComplete(textsList: textsList)));
      } 
    });

    on<ReadEvent>((event, emit) async {
      MyText? text = await appDatabase.read(index: event.index);
      emit(state.copyWith(newReadStatus: ReadComplete(index: event.index, text: text)));
    });
    on<ReadAllEvent>((event, emit) async {
      List<MyText>? textsList = await appDatabase.getAll();
      emit(state.copyWith(newReadAllStatus: ReadAllComplete(textsList: textsList)));
    });

    on<UpdateEvent>((event, emit) async {
  
      await appDatabase.update(index: event.index,texts: event.text);
            List<MyText>? textsList = await appDatabase.getAll();
      emit(state.copyWith(newReadAllStatus: ReadAllComplete(textsList: textsList)));
    });

    on<DeleteEvent>((event, emit) async {
      bool isDeletet = await appDatabase.delete(index: event.index);
      if (isDeletet) {
           List<MyText>? textsList =  Hive.box<MyText>(AppStrings.boxName).values.toList() ;
        emit(state.copyWith(newReadAllStatus: ReadAllComplete(textsList: textsList)));
      }
    });

    on<DeleteAllEvent>((event, emit) async {
      bool isDeletetedAll = await appDatabase.deleteAll();
      if (isDeletetedAll) {
        List<MyText>? textsList =  Hive.box<MyText>(AppStrings.boxName).values.toList() ;
        emit(state.copyWith(newReadAllStatus: ReadAllComplete(textsList: textsList)));
      }
    });
  }
}
