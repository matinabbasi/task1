
import 'package:task1/features/home_feature/data/my_task_entity.dart';

abstract class DBAdaptor {
  ///create
  Future<bool> create({required MyText text});

  ///read
  Future<List<MyText>?> getAll();
  Future<MyText?> read({required int index});

  ///update
  Future<bool> update(
      {required int index , required MyText? texts});

  ///delete
  Future<bool> delete({required int index});
  Future<bool> deleteAll() ;
}
