import 'package:flutter/material.dart';
import '../../../../global/constants/images.dart';
import '../screen_1/screen_1.dart';
import '../screen_2/screen_2.dart';

class DashBordScreen extends StatefulWidget {
  const DashBordScreen({super.key});

  @override
  State<DashBordScreen> createState() => _DashBordScreenState();
}

class _DashBordScreenState extends State<DashBordScreen> {

  int currentTab = 0;
  final List<Widget> screens =
  [
    const FirstScreen(),
    const SecondScreen(),
    const Text(""),
    const Text(""),
    const Text(""),
    ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const FirstScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffFFFFFF),
      body: PageStorage(bucket: bucket, child: currentScreen,),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff4E8551),
        onPressed: (){},
        child: Image.asset(Images.camera, height: 35, color: Colors.white,),
      ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        // color: Colors.grey,
        // color: Color(0xffFDFDFD),
        shape: const CircularNotchedRectangle(),
        notchMargin: 4,
        elevation: 3,
        child: Container(
          decoration: const BoxDecoration(
              // color: Color(0xffFDFDFD),
              borderRadius: BorderRadius.only( topLeft: Radius.circular(30), topRight: Radius.circular(30)),),
          height: 75,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: MaterialButton(
                        minWidth: 70,
                        onPressed: (){
                          setState(() {
                            currentScreen = const FirstScreen();
                            currentTab = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(Images.home, height: 25, color: currentTab == 0 ? const Color(0xff202020) : const Color(0xff202020),),
                            //Icon(Icons.home, size: 25, color: currentTab == 0 ? Color(0xff202020) : Color(0xff202020),),
                            SizedBox(
                              height: 15,
                                // color: Colors.purple,
                                child: Text("•", textAlign: TextAlign.start, style: TextStyle( fontSize: 20, color: currentTab == 0 ? const Color(0xff508752) : Colors.transparent),)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: MaterialButton(
                        minWidth: 70,
                        onPressed: (){
                          setState(() {
                            currentScreen = const SecondScreen();
                            currentTab = 1;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(Images.date, height: 25, color: currentTab == 1 ? const Color(0xff202020) : const Color(0xff202020),),
                            SizedBox(
                                height: 15,
                                child: Text("•", textAlign: TextAlign.start, style: TextStyle( fontSize: 20, color: currentTab == 1 ? const Color(0xff508752) : Colors.transparent),)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // right side tab bar
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: MaterialButton(
                        minWidth: 70,
                        onPressed: (){
                          setState(() {
                            currentScreen = const Center(child: Text("Third Nav Screen"));
                            currentTab = 2;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(Images.clock, height: 25, color: currentTab == 2 ? const Color(0xff202020) : const Color(0xff202020),),
                            SizedBox(
                                height: 15,
                                child: Text("•", textAlign: TextAlign.start, style: TextStyle( fontSize: 20, color: currentTab == 2 ? const Color(0xff508752) : Colors.transparent),)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: MaterialButton(
                        minWidth: 70,
                        onPressed: (){
                          setState(() {
                            currentScreen = const Center(child: Text("Four Nav Screen"));
                            currentTab = 3;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(Images.profile, height: 25, color: currentTab == 3 ? const Color(0xff202020) : const Color(0xff202020),),
                            SizedBox(
                                height: 15,
                                child: Text("•", textAlign: TextAlign.start, style: TextStyle( fontSize: 20, color: currentTab == 3 ? const Color(0xff508752) : Colors.transparent),)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
