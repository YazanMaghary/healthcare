import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:healthcare/datasource/doctors_data_source.dart';
import 'package:healthcare/model/category_model.dart';
import 'package:healthcare/model/doctors_model.dart';
import 'package:healthcare/view/components/bottomsheet.dart';

class DoctorsController extends GetxController {
  final doctorsDataSource = DoctorsDataSource();
  List<Doctor> doctorsList = [];
  List<Category> categoriesList = [];
  bool isDoctorsLoading = true;
  bool isCategoriesLoading = true;
  List<Doctor> doctorsListFilter = [];
  List<Doctor> doctorsListFilter2 = [];
  Doctor? doctor;
  @override
  void onInit() async {
    // TODO: implement onInit
    await getCategories();
    await getDoctors();
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
    await getDoctors();
    update();
  }

  void categoriesFilter(String input) {
    doctorsListFilter.clear();
    if (input.toLowerCase().contains("all".toLowerCase())) {
      doctorsListFilter.addAll(doctorsList);
    } else {
      for (var i = 0; i < doctorsList.length; i++) {
        if (doctorsList[i]
            .specialization!
            .name!
            .toLowerCase()
            .contains(input.toLowerCase())) {
          doctorsListFilter.add(doctorsList[i]);
        }
      }
    }
    update();
  }

  void ratingFilter(int rating) {
    doctorsListFilter.clear();
    if (rating < 0) {
      doctorsListFilter.addAll(doctorsList);
    } else {
      for (var i = 0; i < doctorsList.length; i++) {
        if (doctorsList[i].rating!.averageRating!.round() == rating) {
          doctorsListFilter.add(doctorsList[i]);
          print(doctorsListFilter.length);
        }
      }
    }

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
      } else {
        // doctorsListFilter.clear();
      }
    }
    update();
  }

  void handleSearch2(String input) {
    doctorsListFilter2.clear();
    print("object");
    for (var i = 0; i < doctorsList.length; i++) {
      if (doctorsList[i]
          .user!
          .name!
          .toLowerCase()
          .contains(input.toLowerCase())) {
        doctorsListFilter2.add(doctorsList[i]);
        print("TestTEst");
      } else {
        // doctorsListFilter.clear();
      }
    }
    update();
  }

  Future<void> getDoctors() async {
    final result = await doctorsDataSource.GetDoctors();
    result.fold((failure) {
      failureWidget("Error", failure);
    }, (doctors) {
      isDoctorsLoading = false;
      doctorsList = doctors.data!;
      doctorsListFilter.addAll(doctorsList);
      doctorsListFilter2.addAll(doctorsList);
      print("doctorsList.toString()");
      for (var element in doctorsList) {
        print(element.user?.name);
      }
      print("doctorsList.toString()");
    });
    update();
  }

  Future<void> getDoctorById(String id) async {
    final result = await doctorsDataSource.getDoctorById(id);
    result.fold((failure) {
      failureWidget("Error", failure);
    }, (doctorById) {
      isDoctorsLoading = false;
      doctor = doctorById;
      print("doctor name by get doctorID:\t${doctorById.user?.name}");
      print("doctor name by get doctorID:\t${doctorById.id}");
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

      for (var element in categoriesList) {
        print(element.name);
      }
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