import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constants/images.dart';
import '../../../data/controller/today_curriculum_controller/curriculum_controller.dart';
import '../../../global/constants/date_time_formatter.dart';
import '../../../global/widget/global_sizedbox.dart';
import '../../base_widget/ProgressHUD.dart';
import '../screen_3/screen_3.dart';
import 'package:intl/intl.dart';
import 'widget/calender_widget.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => TodayCurriculumController.current.getTodayCurriculumList(DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodayCurriculumController>(
        builder: (curriculumController) {
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
            body:  ProgressHUD(
              inAsyncCall: curriculumController.isLoading,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    sizeBoxH(10),
                    /// 1st Box
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 25, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('আজ, ১২ জুলাই',
                            style: TextStyle(
                                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),),
                          // SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              Get.to(const Screen3());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Color(0xff86B560),
                                  Color(0xff336F4A),
                                ]
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
                                child: Text('নতুন যোগ করুন',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),),
                              ),),
                          )
                        ],
                      ),
                    ),
                    /// 2nd Box
                    CalenderWidget(
                      onSelect: (date){
                        curriculumController.getTodayCurriculumList(date);
                      },
                    ),

                    sizeBoxH(15),
                    /// 3rd Box
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 25, right: 20, bottom: 20),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 25, right: 25),
                          child:  Column(
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('আজকের কার্যক্রম',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),),
                                ],
                              ),
                              sizeBoxH(20),

                              /// Curriculum List
                              curriculumController.curriculumDataList.isEmpty ? const SizedBox( height: 300, child: Center(child: Text("কার্যক্রম নেই", style: TextStyle(color: Colors.red),))) :
                              Stack(
                                children: [
                                  curriculumController.curriculumDataList.isEmpty
                                      ? const SizedBox(
                                    height: 300,
                                    child: Center(
                                      child: Text(
                                        "কার্যক্রম নেই",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  )
                                      : ListView.builder(
                                    itemCount: curriculumController.curriculumDataList.length,
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      String serverTime = curriculumController.curriculumDataList[index].date ?? "0";
                                      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(serverTime) * 1000);
                                      String banglaFormattedTime = DateTimeFormatter.convertToBengaliTime(dateTime);
                                      String formattedTime = DateFormat('hh:mm a').format(dateTime);
                                      String banglaFormattedTime1 = DateTimeFormatter.convertToBengaliNumerals(formattedTime);
                                      List<Color> gradientColors = index % 2 == 0
                                          ? [const Color(0xff86B560), const Color(0xff336F4A)]
                                          : [const Color(0xff202020), const Color(0xff202020)];
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              banglaFormattedTime,
                                              style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
                                            ),
                                            sizeBoxW(40),
                                            Container(
                                              height: 150,
                                              width: 207,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: gradientColors,
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ),
                                                borderRadius: BorderRadius.circular(8.72),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 10, bottom: 8, left: 16, right: 16),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Image.asset(Images.clock2, color: const Color(0xffFDFDFD)),
                                                        sizeBoxW(5),
                                                        Text(
                                                          banglaFormattedTime1,
                                                          style: const TextStyle(
                                                              color: Color(0xffFDFDFD), fontSize: 12, fontWeight: FontWeight.w500),
                                                        ),
                                                      ],
                                                    ),
                                                    sizeBoxH(5),
                                                    Text(
                                                      curriculumController.curriculumDataList[index].name ?? "",
                                                      maxLines: 4,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: const TextStyle(color: Color(0xffFDFDFD), fontSize: 14, fontWeight: FontWeight.w600),
                                                    ),
                                                    sizeBoxH(5),
                                                    Text(
                                                      curriculumController.curriculumDataList[index].category ?? "",
                                                      style: const TextStyle(color: Color(0xffFDFDFD), fontSize: 12, fontWeight: FontWeight.w500),
                                                    ),
                                                    sizeBoxH(3),
                                                    Row(
                                                      children: [
                                                        Image.asset(Images.locationWhite),
                                                        sizeBoxW(5),
                                                        Text(
                                                          curriculumController.curriculumDataList[index].location ?? "",
                                                          style: const TextStyle(color: Color(0xffFDFDFD), fontSize: 12, fontWeight: FontWeight.w500),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  if (curriculumController.isLoading)
                                    const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    sizeBoxH(25),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
