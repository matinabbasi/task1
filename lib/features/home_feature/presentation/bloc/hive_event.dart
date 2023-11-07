part of 'hive_bloc.dart';

abstract class HiveEvent{}

class CreateEvent extends HiveEvent {
  MyText text ;
  CreateEvent({required this.text});
}

class DeleteEvent extends HiveEvent {
  int index ;
  DeleteEvent({required this.index});
}

class ReadEvent extends HiveEvent{
  int index ;
  ReadEvent({required this.index});
}

class UpdateEvent extends HiveEvent {
  int index ;
  MyText? text ;
  UpdateEvent({required this.index,required this.text});
}

class ReadAllEvent extends HiveEvent {}

class DeleteAllEvent extends HiveEvent {
  DeleteAllEvent();
}