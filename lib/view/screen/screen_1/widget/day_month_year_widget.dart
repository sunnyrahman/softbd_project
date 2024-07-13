import 'package:flutter/material.dart';
import '../../../../../global/widget/global_sizedbox.dart';


class DayMonthYearWidget extends StatefulWidget {
  const DayMonthYearWidget({super.key});

  @override
  State<DayMonthYearWidget> createState() => _DayMonthYearWidgetState();
}

class _DayMonthYearWidgetState extends State<DayMonthYearWidget> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF6F6F6),
                    border: Border.all(
                        color: const Color(0xffFF737A), width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  height: 24,
                  width: 24,
                  child: const Center(
                    child: Text(
                      "০",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                sizeBoxW(4),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF6F6F6),
                    border: Border.all(
                        color: const Color(0xffFF737A), width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  height: 24,
                  width: 24,
                  child: const Center(
                    child: Text(
                      "৫",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
            sizeBoxH(6),
            const Text(
              'বছর',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        sizeBoxW(17),
        Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF6F6F6),
                    border: Border.all(
                        color: const Color(0xffFF737A), width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  height: 24,
                  width: 24,
                  child: const Center(
                    child: Text(
                      "০",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                sizeBoxW(4),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF6F6F6),
                    border: Border.all(
                        color: const Color(0xffFF737A), width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  height: 24,
                  width: 24,
                  child: const Center(
                    child: Text(
                      "৬",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
            sizeBoxH(6),
            const Text(
              'মাস',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        sizeBoxW(17),
        Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF6F6F6),
                    border: Border.all(
                        color: const Color(0xffFF737A), width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  height: 24,
                  width: 24,
                  child: const Center(
                    child: Text(
                      "১",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                sizeBoxW(4),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF6F6F6),
                    border: Border.all(
                        color: const Color(0xffFF737A), width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  height: 24,
                  width: 24,
                  child: const Center(
                    child: Text(
                      "২",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
            sizeBoxH(6),
            const Text(
              'দিন',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
