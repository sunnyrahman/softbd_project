import 'package:flutter/material.dart';
import '../../../../global/constants/images.dart';
import '../../../global/widget/global_sizedbox.dart';
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


        ],
      ),
    );
  }
}
