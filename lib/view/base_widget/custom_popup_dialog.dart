import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global/constants/colors_resources.dart';
import '../../global/constants/images.dart';
import '../../global/widget/global_sizedbox.dart';

class CustomAlertDialogForPermission extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final bool isError;
  final Function() buttonTap;
  const CustomAlertDialogForPermission({Key? key, required this.title, required this.buttonTap, required this.buttonText, this.description=" ",  this.isError=false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      insetPadding: const EdgeInsets.all(30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SizedBox(
        height: 286,
        width: 327,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            sizeBoxH(30),
            Image.asset(Images.confirm) ,
            sizeBoxH(25),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Text(title,textAlign:TextAlign.center,style: const TextStyle(color: Color(0xff202020),fontSize: 16, fontWeight: FontWeight.w700))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Text(description,textAlign:TextAlign.center,style: const TextStyle(color: Color(0xff6A6A6A),fontSize: 14, fontWeight: FontWeight.w400))),
                ],
              ),
            ),
            sizeBoxH(18),
            Container(
              height: 46,
              width: 207,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xff4E8551),
              ),
              padding: const EdgeInsets.all(0),
              child: InkWell(
                onTap: buttonTap,
                child: Container(
                    padding: const EdgeInsets.all(5),
                    width: Get.width,
                    child: Center(
                      child: Text(buttonText,
                        style: const TextStyle(fontSize: 18,
                            color: ColorRes.white,fontWeight: FontWeight.w600),),
                    )),),
            ),
          ],
        ),
      ),
    );
  }
}
