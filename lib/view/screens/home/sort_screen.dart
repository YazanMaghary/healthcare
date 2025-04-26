import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare/controller/doctors_controller.dart';
import 'package:healthcare/core/utils/app_constanses.dart';

class SortScreen extends StatefulWidget {
  final void Function() onPressed;
  const SortScreen({super.key, required this.onPressed});

  @override
  State<SortScreen> createState() => _SortScreenState();
}

class _SortScreenState extends State<SortScreen> {
  DoctorsController doctorsController = Get.find<DoctorsController>();
  final List<String> specialities = [
    'General',
    'ENT',
    'Pediatric',
    'Urologist',
    'Dentistry',
    'Intestine',
    'Histologist',
    'Hepatology',
    'Cardiologist',
    'Neurologic',
    'Pulmonary',
    'Optometry',
  ];

  int _isSelectedSpeciality = 0;
  int _isSelectedRating = 0;

  int indexItem = 6;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          largeSpace,
          Center(
            child: Text(
              'SortBy',
              style: semiBoldBlack18,
            ),
          ),
          const Spacer(),
          const Divider(
            color: Colors.grey,
            height: 1,
          ),
          const Spacer(),
          Text(
            'Speciality',
            style: semiBoldBlack16,
          ),
          const Spacer(),
          SizedBox(
            height: 50,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return mediumSpace20;
              },
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: doctorsController.categoriesList.length + 1,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      //Filter Here need Get from Post Man for Better Searching Filtter
                      _isSelectedSpeciality = index;
                      if (_isSelectedSpeciality - 1 < 0) {
                        doctorsController.categoriesFilter("ALL");
                      } else {
                        doctorsController.categoriesFilter(
                            doctorsController.categoriesList[index - 1].name!);
                      }
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: _isSelectedSpeciality != index
                            ? greyBackground
                            : primaryColor,
                        borderRadius: BorderRadius.circular(25)),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 32,
                    ),
                    child: Text(
                      index == 0
                          ? 'All'
                          : doctorsController.categoriesList[index - 1].name!,
                      style: _isSelectedSpeciality != index
                          ? semiBoldGrey
                          : semiBoldWhite16,
                    ),
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          Text('Rating', style: semiBoldBlack16),
          const Spacer(),
          SizedBox(
            height: 50,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return mediumSpace20;
              },
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSelectedRating = index;

                      if (_isSelectedRating - 1 < 0) {
                        doctorsController.ratingFilter(-1);
                      } else {
                        doctorsController.ratingFilter(indexItem - index);
                      }
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: _isSelectedRating != index
                            ? greyBackground
                            : primaryColor,
                        borderRadius: BorderRadius.circular(25)),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 32,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: _isSelectedRating != index
                              ? const Color(0xffC2C2C2)
                              : Colors.white,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          index == 0 ? 'All' : '${indexItem - index}',
                          style: _isSelectedRating != index
                              ? semiBoldGrey
                              : semiBoldWhite16,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: MaterialButton(
                onPressed: widget.onPressed,
                color: const Color(0xff247CFF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: const Text(
                  'Done',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
