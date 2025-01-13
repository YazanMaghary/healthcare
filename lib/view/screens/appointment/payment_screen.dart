import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:healthcare/core/utils/app_constanses.dart';
import 'package:healthcare/view/components/appBar.dart';
import 'package:healthcare/view/components/appbar_button.dart';
import 'package:healthcare/view/components/primary_button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedOption = '';
  bool _isCardExpanded = false;
  bool _isPayPalExpanded = false;
  bool _isBankTransferExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: "Payment",
        foregroundColor: Colors.black,
        leadingWidget: AppBarButton(
            onTap: () {
              Get.offAllNamed("/myMain", arguments: 3);
            },
            icon: Icons.chevron_left,
            margin: EdgeInsets.only(left: 16.w)),
        actions: [
          AppBarButton(
              onTap: () {},
              icon: Icons.qr_code_scanner_sharp,
              margin: EdgeInsets.only(right: 16.w))
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.w),
          height: ScreenUtil().screenHeight - 100.w,
          child: ListView(shrinkWrap: true, children: [
            Text(
              "Payment Option",
              style: semiBoldBlack16,
            ),
            mediumSpace,
            ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(horizontal: 0),
              shape: Border.all(width: 0),
              onExpansionChanged: (value) {
                _isCardExpanded = value;
                if (value) {
                  _selectedOption = "card";
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
                value: "card",
                groupValue: _selectedOption,
                onChanged: (value) {
                  _selectedOption = value!;
                  _isCardExpanded = true;
                  _isPayPalExpanded = false;
                  _isBankTransferExpanded = false;
                  setState(() {});
                },
              ),
              children: [CardFormField()],
            ),
            largeSpace,
            ExpansionTile(      shape: Border.all(width: 0),
              tilePadding: const EdgeInsets.symmetric(horizontal: 0),
              onExpansionChanged: (value) {
                _isPayPalExpanded = value;
                if (value) {
                  _selectedOption = "BankTransfer";
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
              children: [
                Text("Bank Transfer will be available in the future updates")
              ],
            ),
            largeSpace,
            ExpansionTile(      shape: Border.all(width: 0),
              tilePadding: const EdgeInsets.symmetric(horizontal: 0),
              onExpansionChanged: (value) {
                _isPayPalExpanded = value;
                if (value) {
                  _selectedOption = "PayPal";
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
              children: [
                Text("PayPal will be available in the future updates")
              ],
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.w),
        child: PrimaryButton(
          buttonText: "Continue",
          onPressed: () {},
        ),
      ),
    );
  }
}
