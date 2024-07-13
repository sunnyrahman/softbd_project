import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constants/images.dart';
import '../../../../global/utils/show_toast.dart';
import '../../../global/widget/global_sizedbox.dart';
import '../../base_widget/custom_popup_dialog.dart';
import '../../base_widget/custom_text_field.dart';
import '../../base_widget/global_button.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  TextEditingController nameCtr = TextEditingController();
  TextEditingController subCtr = TextEditingController();
  TextEditingController dateCtr = TextEditingController();
  TextEditingController locationCtr = TextEditingController();
  TextEditingController descriptionCtr = TextEditingController();

  FocusNode nameFcs = FocusNode();
  FocusNode subFcs = FocusNode();
  FocusNode dateFcs = FocusNode();
  FocusNode locationFcs = FocusNode();
  FocusNode descriptionFcs = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: const Color(0xffFFFFFF),
        leading: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset(Images.arrow_back, height: 24)),
        ),
        centerTitle: true,
        title: const Text(
          'নতুন যোগ করুন',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              sizeBoxH(20),
              CustomTextField(
                  height: 45,
                  controller: nameCtr,
                  isRequired: true,
                  focusNode: subFcs,
                  title: "অনুচ্ছেদ",
                  hintText: "অনুচ্ছেদ লিখুন",
                  wardCount: '৪৫ শব্দ',
                  hintTextColor: Colors.black54),
              sizeBoxH(25),
              CustomTextField(
                  height: 45,
                  controller: subCtr,
                  isRequired: true,
                  focusNode: dateFcs,
                  title: "অনুচ্ছেদের বিভাগ",
                  hintText: "অনুচ্ছেদের বিভাগ নির্বাচন করুন",
                  suffixIcon: Images.arrow,
                  wardCount: "",
                  hintTextColor: Colors.black54),
              sizeBoxH(25),
              CustomTextField(
                  height: 45,
                  controller: dateCtr,
                  isRequired: true,
                  focusNode: locationFcs,
                  title: "তারিখ ও সময়",
                  hintText: "নির্বাচন করুন",
                  suffixIcon: Images.arrow,
                  prefixIcon: Images.date,
                  wardCount: "",
                  hintTextColor: Colors.black54),
              sizeBoxH(25),
              CustomTextField(
                  height: 45,
                  controller: locationCtr,
                  isRequired: true,
                  focusNode: descriptionFcs,
                  title: "স্থান",
                  hintText: "নির্বাচন করুন",
                  suffixIcon: Images.arrow,
                  prefixIcon: Images.location,
                  wardCount: "",
                  hintTextColor: Colors.black54),
              sizeBoxH(25),
              CustomTextField(
                  height: 195,
                  controller: descriptionCtr,
                  isRequired: true,
                  focusNode: FocusNode(),
                  minLines: 7,
                  maxLines: 9,
                  title: "অনুচ্ছেদের বিবরণ",
                  hintText: "কার্যক্রমের বিবরণ লিখুন",
                  wardCount: '১২০ শব্দ',
                  hintTextColor: Colors.black54),
              sizeBoxH(10),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: GlobalButtonWidget(
                buttomColor: const Color(0xff336F4A),
                str: 'সংরক্ষন করুন',
                height: 45,
                radius: 12,
                onTap: () async {
                  if (nameCtr.text.isNotEmpty) {
                    if (subCtr.text.isNotEmpty) {
                      if (dateCtr.text.isNotEmpty) {
                        if (locationCtr.text.isNotEmpty) {
                          if (descriptionCtr.text.isNotEmpty) {
                            Get.dialog(CustomAlertDialogForPermission(
                              title: 'নতুন অনুচ্ছেদ সংরক্ষন',
                              description: 'আপনার সময়রেখাতে নতুন অনুচ্ছেদ সংরক্ষণ সম্পুর্ন হয়েছে',
                              buttonTap: () {
                                Navigator.pop(context);
                                nameCtr.clear();
                                subCtr.clear();
                                dateCtr.clear();
                                locationCtr.clear();
                                descriptionCtr.clear();
                              },
                              buttonText: "আরও যোগ করুন",
                            ));
                          } else {
                            showCustomSnackBar("কার্যক্রমের বিবরণ লিখুন");
                          }
                        } else {
                          showCustomSnackBar("স্থান নির্বাচন করুন");
                        }
                      } else {
                        showCustomSnackBar("তারিখ ও সময় নির্বাচন করুন");
                      }
                    } else {
                      showCustomSnackBar("অনুচ্ছেদের বিভাগ নির্বাচন করুন");
                    }
                  } else {
                    showCustomSnackBar("অনুচ্ছেদ লিখুন");
                  }
                }),
          ),
        ),
      ),
    );
  }
}

