import 'package:task1/features/home_feature/data/my_task_entity.dart';

abstract class ReadStatus {}
class ReadInitial extends ReadStatus {}
class ReadComplete extends ReadStatus{
  int index ;
  MyText? text ;
  ReadComplete({required this.text,required this.index});
}