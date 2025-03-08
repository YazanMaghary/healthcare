import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:healthcare/datasource/doctors_data_source.dart';
import 'package:healthcare/model/category_model.dart';
import 'package:healthcare/model/doctors_model.dart';
import 'package:healthcare/view/components/bottomsheet.dart';
import 'package:get/get.dart';

class DoctorsController extends GetxController {
  final doctorsDataSource = DoctorsDataSource();
  List<Doctors> doctorsList = [];
  List<Category> categoriesList = [];
  bool isDoctorsLoading = true;
  bool isCategoriesLoading = true;
  List<Doctors> doctorsListFilter = [];
  @override
  void onInit() async {
    // TODO: implement onInit
    await getCategories();
    await GetDoctors();
    print("initGetDoctors");
    update();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose

    super.onClose();
  }

  Future<void> refreshDoctorsData() async {
    // TODO: implement onClose
    doctorsList.clear();
    await GetDoctors();
    update();
  }

  void handleSearch(String input) {
    doctorsListFilter.clear();
    print("object");
    for (var i = 0; i < doctorsList.length; i++) {
      if (doctorsList[i]
          .user!
          .name!
          .toLowerCase()
          .contains(input.toLowerCase())) {
        doctorsListFilter.add(doctorsList[i]);
        print("TestTEst");
      }
    }
    update();
  }

  Future<void> GetDoctors() async {
    final result = await doctorsDataSource.GetDoctors();
    result.fold((failure) {
      failureWidget("Error", failure);
    }, (doctors) {
      isDoctorsLoading = false;
      doctorsList = doctors.data!;
      print("doctorsList.toString()");
      doctorsList.forEach(
        (element) {
          print(element.user?.name);
        },
      );
      print("doctorsList.toString()");
    });
    update();
  }

  Future<void> getCategories() async {
    final result = await doctorsDataSource.getDoctorsSpecality();
    result.fold((failure) {
      failureWidget("Error", failure);
    }, (categories) {
      isCategoriesLoading = false;
      categoriesList = categories.data!;
      print("Categories");

      categoriesList.forEach((element) {
        print(element.name);
      });
      print("Categories");
    });
    update();
  }
}



//  if (doctorsList[i].specialization!.name == "test") {
//         print("Test");
//         print(doctorsList[i]);
//         print("Test");
//       } else