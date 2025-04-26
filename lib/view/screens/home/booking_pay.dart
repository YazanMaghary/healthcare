import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/booking_stage.dart';
import 'package:healthcare/view/components/bottomsheet.dart';
import 'package:healthcare/view/components/primary_button.dart';

class BookingPay extends StatefulWidget {
  const BookingPay({super.key});

  @override
  State<BookingPay> createState() => _BookingPayState();
}

class _BookingPayState extends State<BookingPay> {
  String _selectedOption = '';
  bool _isCardExpanded = false;
  bool _isPayPalExpanded = false;
  bool _isBankTransferExpanded = false;
  ExpansionTileController cardController = ExpansionTileController();
  ExpansionTileController bankTransfeerController = ExpansionTileController();
  ExpansionTileController paybalController = ExpansionTileController();
  CardFormEditController cardFormEditController = CardFormEditController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        surfaceTintColor: const Color(0xFFFFFFFF),
        elevation: 0,
        leading: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () {
                Get.offAndToNamed("/MainAppScreen");
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                ),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        title: const Text(
          'Book Appointment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PrimaryButton(
          buttonText: 'Continue',
          onPressed: () {
            final details = cardFormEditController.details;
            String? last4Digits = details.last4;
           
            if (details.complete) {
              Get.toNamed('/BookingSummary', arguments: {
                "doctorId":Get.arguments["doctorId"],
                "dateTime": Get.arguments["dateTime"] ,
                "time": Get.arguments["time"],
                "type": Get.arguments["type"],
                "paymentMethod": _selectedOption,
                "last4":last4Digits 
              });
            } else {
              failureWidget("Error", "Unkown");
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: mainPagePading,
          child: Column(
            children: [
              mediumSpace20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20.h,
                  ),
                  BookingStage(
                    stageName: 'Date & Time',
                    stageNum: '1',
                    style: smallNormalGrey,
                    backgroundColor: greyColor2,
                  ),
                  SizedBox(
                    width: 5.h,
                  ),
                  Container(
                    color: const Color(0xffE0E0E0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 1.h),
                  ),
                  SizedBox(
                    width: 5.h,
                  ),
                  BookingStage(
                    stageName: 'Payment',
                    stageNum: '2',
                    style: smallNormal,
                    backgroundColor: primaryColor,
                  ),
                  SizedBox(
                    width: 5.h,
                  ),
                  Container(
                    color: const Color(0xffE0E0E0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 1.h),
                  ),
                  SizedBox(
                    width: 5.h,
                  ),
                  BookingStage(
                    stageName: 'Summary',
                    stageNum: '3',
                    style: smallNormalGrey,
                    backgroundColor: greyColor2,
                  ),
                  SizedBox(
                    width: 20.h,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.w),
                child: ListView(shrinkWrap: true, children: [
                  Text(
                    "Payment Option",
                    style: semiBoldBlack16,
                  ),
                  mediumSpace20,
                  ExpansionTile(
                    controller: cardController,
                    tilePadding: const EdgeInsets.symmetric(horizontal: 0),
                    shape: Border.all(width: 0),
                    onExpansionChanged: (value) {
                      _isCardExpanded = value;
                      _isPayPalExpanded = false;
                      _isBankTransferExpanded = false;
                      bankTransfeerController.collapse();

                      paybalController.collapse();
                      if (value) {
                        _selectedOption = "CARD";
                      } else {
                        _selectedOption = "";
                      }
                      setState(() {});
                    },
                    title: Text(
                      "Credit Card",
                      style: semiBoldBlack14,
                    ),
                    leading: Radio(
                      value: "CARD",
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        _selectedOption = value!;
                        _isCardExpanded = true;
                        _isPayPalExpanded = false;
                        _isBankTransferExpanded = false;
                        setState(() {});
                      },
                    ),
                    children: [
                      CardFormField(controller: cardFormEditController)
                    ],
                  ),
                  largeSpace,
                  ExpansionTile(
                    controller: bankTransfeerController,
                    shape: Border.all(width: 0),
                    tilePadding: const EdgeInsets.symmetric(horizontal: 0),
                    onExpansionChanged: (value) {
                      _isPayPalExpanded = value;
                      _isPayPalExpanded = false;
                      _isCardExpanded = false;
                      cardController.collapse();
                      paybalController.collapse();

                      if (value) {
                        _selectedOption = "CASH";
                      } else {
                        _selectedOption = "";
                      }
                      setState(() {});
                    },
                    title: Text(
                      "Bank Transfer",
                      style: semiBoldBlack14,
                    ),
                    leading: Radio(
                      value: "BankTransfer",
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        _selectedOption = value!;
                        _isPayPalExpanded = false;
                        _isCardExpanded = false;
                        _isBankTransferExpanded = true;
                        setState(() {});
                      },
                    ),
                    children: const [
                      Text(
                          "Bank Transfer will be available in the future updates")
                    ],
                  ),
                  largeSpace,
                  ExpansionTile(
                    controller: paybalController,
                    shape: Border.all(width: 0),
                    tilePadding: const EdgeInsets.symmetric(horizontal: 0),
                    onExpansionChanged: (value) {
                      _isPayPalExpanded = value;
                      _isCardExpanded = false;
                      _isBankTransferExpanded = false;
                      bankTransfeerController.collapse();
                      cardController.collapse();
                      if (value) {
                        _selectedOption = "PAYPAL";
                      } else {
                        _selectedOption = "";
                      }
                      setState(() {});
                    },
                    title: Text(
                      "PayPal",
                      style: semiBoldBlack14,
                    ),
                    leading: Radio(
                      value: "PayPal",
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        _selectedOption = value!;
                        _isPayPalExpanded = true;
                        _isCardExpanded = false;
                        _isBankTransferExpanded = false;
                        setState(() {});
                      },
                    ),
                    children: const [
                      Text("PayPal will be available in the future updates")
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
