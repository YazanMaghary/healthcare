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
        }
      }
    }

    update();
  }

  void handleSearch(String input) {
    doctorsListFilter.clear();

    for (var i = 0; i < doctorsList.length; i++) {
      if (doctorsList[i]
          .user!
          .name!
          .toLowerCase()
          .contains(input.toLowerCase())) {
        doctorsListFilter.add(doctorsList[i]);
      } else {}
    }
    update();
  }

  void handleSearch2(String input) {
    doctorsListFilter2.clear();

    for (var i = 0; i < doctorsList.length; i++) {
      if (doctorsList[i]
          .user!
          .name!
          .toLowerCase()
          .contains(input.toLowerCase())) {
        doctorsListFilter2.add(doctorsList[i]);
      } else {}
    }
    update();
  }

  Future<void> getDoctors() async {
    doctorsListFilter2.clear();
    doctorsListFilter.clear();

    final result = await doctorsDataSource.GetDoctors();
    result.fold((failure) {
      failureWidget("Error", failure);
    }, (doctors) {
      isDoctorsLoading = false;
      doctorsList = doctors.data!;
      doctorsListFilter.addAll(doctorsList);
      doctorsListFilter2.addAll(doctorsList);
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
    });
    update();
  }
}
