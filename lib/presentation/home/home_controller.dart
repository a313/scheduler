import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/usecase/data_state.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/domain/usecases/class_room_usecases.dart';
import 'package:scheduler/domain/usecases/student_usecases.dart';

class HomeController extends BaseController
    with GetSingleTickerProviderStateMixin {
  StudentUseCases studentUseCases = Get.find();
  ClassRoomUseCases classRoomUseCases = Get.find();

  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: 5, vsync: this);
    super.onInit();
    getData();
  }

  void getData() {
    getStudents();
    getClassRooms();
  }

  Future<void> getClassRooms() async {
    final value = await classRoomUseCases.getAllClassRoom();
    if (value is DataSuccess<List<ClassRoom>>) {
      allClassRoom = value.data;
    }
  }

  Future<void> getStudents() async {
    final value = await studentUseCases.getAllStudent();
    if (value is DataSuccess<List<Student>>) {
      allStudent = value.data;
    }
  }

  void onChangedTab(int p1) {
    tabController.animateTo(p1);
    update();
  }
}
