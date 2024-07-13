import 'package:flutter/material.dart';
import '../../../../../global/constants/images.dart';
import '../../../../../global/widget/global_sizedbox.dart';


class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 25, right: 20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 5),
          child: Row(
            children: [
              Image.asset(Images.user, height: 80, width: 80),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'মোঃ মোহাইমেনুল রেজা',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'সফটবিডি লিমিটেড',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  sizeBoxH(3),
                  Row(
                    children: [
                      Image.asset(Images.location),
                      sizeBoxW(5),
                      const Text(
                        'ঢাকা',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
