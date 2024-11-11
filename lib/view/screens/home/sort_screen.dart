import 'package:flutter/material.dart';
import 'package:healthcare/core/utils/app_constanses.dart';

class SortScreen extends StatefulWidget {
  final void Function() onPressed;
  const SortScreen({super.key, required this.onPressed});

  @override
  State<SortScreen> createState() => _SortScreenState();
}

class _SortScreenState extends State<SortScreen> {
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
  int _isSelectedRaring = 0;

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
              style: semiBold2,
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
            style: semiBold3,
          ),
          const Spacer(),
          SizedBox(
            height: 50,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return mediumSpace;
              },
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: specialities.length + 1,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSelectedSpeciality = index;
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
                      index == 0 ? 'All' : specialities[index - 1],
                      style: _isSelectedSpeciality != index
                          ? semiBold4
                          : semiBold5,
                    ),
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          Text('Rating', style: semiBold3),
          const Spacer(),
          SizedBox(
            height: 50,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return mediumSpace;
              },
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSelectedRaring = index;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: _isSelectedRaring != index
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
                          color: _isSelectedRaring != index
                              ? Color(0xffC2C2C2)
                              : Colors.white,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          index == 0 ? 'All' : '${indexItem - index}',
                          style: _isSelectedRaring != index
                              ? semiBold4
                              : semiBold5,
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
