import 'package:task1/features/home_feature/data/my_task_entity.dart';

abstract class ReadAllStatus {}
class ReadAllInitial extends ReadAllStatus {}
class ReadAllComplete extends ReadAllStatus {
  List<MyText>?textsList ;
  ReadAllComplete({required this.textsList});
}