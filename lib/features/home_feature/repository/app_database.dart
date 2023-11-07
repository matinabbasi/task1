import 'dart:developer';
import 'package:hive/hive.dart';
import 'package:task1/common/utils/app_strings.dart';
import 'package:task1/features/home_feature/repository/dbAdaptor.dart';

import '../data/my_task_entity.dart';


class AppDatabase implements DBAdaptor {
  AppDatabase._();

  static final _shared = AppDatabase._();
  factory AppDatabase.instance() => _shared;

  @override
  Future<bool> create({required MyText text}) async {
    try {
      await Hive.box<MyText>(AppStrings.boxName).add(text);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  Future<bool> delete({required int index}) async {

    try {
      await Hive.box<MyText>(AppStrings.boxName).deleteAt(index);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
  
  @override
  Future<bool> deleteAll() async {

    try {
      await Hive.box<MyText>(AppStrings.boxName).clear();
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  Future<List<MyText>?> getAll() async {
    try {
      List<MyText>? texts =  Hive.box<MyText>(AppStrings.boxName).values.toList();
      return texts;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<MyText?> read({required int index}) async {
    try {
      MyText? texts =  Hive.box<MyText>(AppStrings.boxName).getAt(index);
      return texts;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<bool> update(
      {required int index,required MyText? texts}) async {
    try {
      await Hive.box<MyText>(AppStrings.boxName).putAt(index,texts!);
return true ;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
