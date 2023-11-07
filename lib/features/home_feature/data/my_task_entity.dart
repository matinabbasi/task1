import 'package:hive/hive.dart';
part 'my_task_entity.g.dart';

@HiveType(typeId: 0)
class MyText extends HiveObject {
  @HiveField(0)
  String name;
  MyText({required this.name});

  MyText copyWith({String? newName}) {
    return MyText(
        name: newName ?? name,
       );
  }
}


