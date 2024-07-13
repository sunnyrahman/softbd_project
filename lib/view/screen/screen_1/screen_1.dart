import 'package:flutter/material.dart';
import '../../../../global/constants/images.dart';
import '../../../global/widget/global_sizedbox.dart';
import 'widget/circle_widget.dart';
import 'widget/day_month_year_widget.dart';
import 'widget/grid_widget.dart';
import 'widget/profile_card_widget.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: const Color(0xffFFFFFF),
        // backgroundColor: Colors.amber,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Image.asset(Images.menu),
        ),
        title: Row(
          children: [
            Image.asset(Images.demo),
            const SizedBox(width: 10),
            const Text('Flutter Task', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700)),
          ],
        ),
        actions: [
          Image.asset(Images.bell),
        ],
      ),
      body: Column(
        children: [
          // sizeBoxH(10),
          /// 1st Card
          const ProfileInfo(),
          sizeBoxH(25),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10, bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleWidget(),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizeBoxH(10),
                    const Text(
                      'মেয়াদকাল',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    sizeBoxH(5),
                    Row(
                      children: [
                        Image.asset(Images.time),
                        sizeBoxW(5),
                        const Text(
                          '১ই জানুয়ারি ২০২৪ - ৩১ই জানুয়ারি ২০৩০',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'আরও বাকি',
                      style: TextStyle(
                          color: Color(0xffFF737A),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    sizeBoxH(5),
                    const DayMonthYearWidget(),
                  ],
                ),
              ],
            ),
          ),
          sizeBoxH(30),
          const Expanded(
            child: GridWidget(),
          ),
        ],
      ),
    );
  }
}
