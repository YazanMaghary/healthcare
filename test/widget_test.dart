import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare/view/components/appointment_status_card.dart';

void main() {
  testWidgets('AppointmentStatusCard renders correctly',
      (WidgetTester tester) async {
    // Setup ScreenUtil
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => child!,
        child: const MaterialApp(
          home: Scaffold(
            body: AppointmentStatusCard(
              appointmentStatues: "Confirmed",
              doctorName: "Dr. John Doe",
              specializationName: "Cardiologist",
              date: "Wed, 17 May",
              time: "08:30 AM",
              image: "assets/images/defaultProfile.png",
              review: "20",
              rating: "4.8",
              statusColor: TextStyle(color: Colors.green),
            ),
          ),
        ),
      ),
    );
    // Check if Appointment Status is shown
    expect(find.text("Confirmed"), findsOneWidget);
    // Check if Doctor Name is shown
    expect(find.text("Dr. John Doe"), findsOneWidget);
    // Check if Specialization is shown
    expect(find.text("Cardiologist"), findsOneWidget);
    // Check if Rating is shown
    expect(find.text("4.8"), findsOneWidget);
    // Check if Review is shown
    expect(find.text("(20 reviews)"), findsOneWidget);
    // Check if Star Icon exists
    expect(find.byIcon(Icons.star), findsOneWidget);
    // Check if More Options Icon exists
    expect(find.byIcon(Icons.more_vert), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(5));
  });
}
