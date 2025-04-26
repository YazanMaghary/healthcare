import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/datasource/appoinment_data_source.dart';
import 'package:healthcare/model/appoinment_model.dart';
import 'package:healthcare/view/components/bottomsheet.dart';
import 'package:intl/intl.dart';

class AppoinmentController extends GetxController {
  @override
  void onInit() {

    fetchAppoinments();
    super.onInit();
  }

  int selectedIndex = 1;
  int selectedDay = 0;
  int selectedTimes = 1;
  final ScrollController scrollController = ScrollController();
  List<String> availableTimes = [];
  String typeSelected = "IN_PERSON";
  List<String> type = ["IN_PERSON", "VIDEO_CALL", "CHAT"];
  List<DateTime> allweekDays = [];
  List<String> weekDays = [];
  List<int> weekDaysDate = [];

  var isButtonEnabled = true;
  final AppoinmentDataSource _appoinmentDataSource = AppoinmentDataSource();
  Appoinment _appoinment = Appoinment();
  AppoinmentDataSource get getAppoinmentDataSource => _appoinmentDataSource;
  final RxList<Appoinment> _upComingList = <Appoinment>[].obs;
  RxList<Appoinment> get getUpComingList => _upComingList;
  Appoinment get getAppoinment => _appoinment;
  set setUpComingList(value) {
    _upComingList.value = value;
  }

  final RxList<Appoinment> _completedList = <Appoinment>[].obs;
  RxList<Appoinment> get getCompletedList => _completedList;
  set setCompletedList(value) {
    _completedList.value = value;
  }

  final RxList<Appoinment> _cancelledList = <Appoinment>[].obs;
  RxList<Appoinment> get getCancelledList => _cancelledList;
  set setCancelledList(value) {
    _cancelledList.value = value;
  }

  void availableDate() {
    final dateFormat = DateFormat("EE");
    final baseDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

    allweekDays = List.generate(
      7,
      (index) {
        return baseDate.add(Duration(days: index + 1));
      },
    );
    weekDays = List.generate(
      7,
      (index) {
        return dateFormat.format(baseDate.add(Duration(days: index + 1)));
      },
    );
    weekDaysDate = List.generate(
      7,
      (index) {
        return DateTime.now().day + (index + 1);
      },
    );
  }

  void availableTime(String startTime) {
    // String endTime = "16:30";

    // Convert to DateTime
    DateTime start = DateFormat("HH:mm").parse(startTime);
    // DateTime end = DateFormat("HH:mm").parse(endTime);

    // List to store available times
    if (availableTimes.length <= 3) {
      for (var i = 0; i < 6; i++) {
        String formatted = DateFormat.jm().format(start);
        availableTimes.add(formatted);
        start = start.add(const Duration(hours: 1));
      }
    }


  }

  void scrolLeft() {
    // date.date().;
    if (selectedDay > 0) {
      selectedDay--;

      _scrollToIndex(selectedDay);
      update();
    }
  }

  void scrolRight() {
    if (selectedDay < weekDays.length - 1) {
      selectedDay++;
      update();
      _scrollToIndex(selectedDay);
    }
  }

  void sellectTime(int index) {
    selectedTimes = index;
    update();
  }

  void _scrollToIndex(int index) {
    scrollController.animateTo(
      index * 80.0, // Adjust based on item width
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void changeCancelledButtonState() {
    if (isButtonEnabled == false) {
      isButtonEnabled = true;
    } else {
      isButtonEnabled = false;
    }
    update();
  }

  Future<void> fetchAppoinments() async {
    _upComingList.clear();
    _completedList.clear();
    _cancelledList.clear();
    final result = await getAppoinmentDataSource.fetchAppoinmentDataSource();
    result.fold((failure) {
      failureWidget("Error", failure);
    }, (appoinments) {
      if (appoinments.data != null) {
        for (var element in appoinments.data!) {
          if (element.status == "upcoming".toUpperCase()) {
            _upComingList.add(element);
          } else if (element.status == "completed".toUpperCase()) {
            _completedList.add(element);
          } else if (element.status == "cancelled".toUpperCase()) {
            _cancelledList.add(element);
          } else {
           
          }
        }
      } else {
     
      }
    });
    update();
  }

  Future<void> changeAppointmentStatus(String id, String newStatus) async {
    final result = await getAppoinmentDataSource
        .changeAppoinmentStatusDataSource(id, newStatus);
    result.fold((failure) {
      failureWidget("Error", failure);
    }, (appointment) {});
  }

  Future<void> rescheduleAppointment(
      String id, String dateTime, String time, String type) async {
    final result = await getAppoinmentDataSource
        .rescheduleAppointmentDataSource(id, dateTime, time, type);
    result.fold((failure) {
      failureWidget("Error", failure);
    }, (appointment) {
      _appoinment = appointment;
   
    });
  }

  Future<void> makeAnAppointment({
    required String doctorId,
    required String dateTime,
    required String time,
    required String type,
    required String paymentMethod,
    required int subTotal,
    required int tax,
    required int total,
    required String paymentId,
  }) async {
    // "2025-06-25T10:00:00Z"

    final result = await getAppoinmentDataSource.makeAnAppointmentDataSource(
      doctorId: doctorId,
      dateTime: dateTime,
      time: time,
      type: type,
      paymentMethod: paymentMethod,
      subTotal: subTotal,
      tax: tax,
      total: total,
      paymentId: paymentId,
    );
    result.fold((failure) {
      failureWidget("Error", failure);
    }, (appointment) {
      _appoinment = appointment;
    });
  }
}
