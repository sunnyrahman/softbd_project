import 'package:flutter/material.dart';
import '../../../../global/constants/images.dart';
import '../../../global/widget/global_sizedbox.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

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
        centerTitle: true,
        title: const Text('সময়রেখা', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),),
        actions: [
          Image.asset(Images.bell),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            sizeBoxH(10),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('আজ, ১২ জুলাই',
                    style: TextStyle(
                        color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),),
                  // SizedBox(width: 20),
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color(0xff86B560),
                        Color(0xff336F4A),
                      ]
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 6, bottom: 8, left: 12, right: 12),
                      child: Text('নতুন যোগ করুন',
                        style: TextStyle(
                            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),),
                    ),)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
