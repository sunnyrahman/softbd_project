import 'package:flutter/material.dart';
import '../../../../../global/constants/images.dart';
import '../../../../../global/widget/global_sizedbox.dart';


class CircleWidget extends StatefulWidget {
  const CircleWidget({super.key});

  @override
  State<CircleWidget> createState() => _CircleWidgetState();
}

class _CircleWidgetState extends State<CircleWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(Images.frame, height: 108, width: 108),
            const Positioned(
              top: 50,
              left: 20,
              child: Center(
                child: Text(
                  "৬ মাস ৬ দিন",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
        sizeBoxH(10),
        const Text(
          'সময় অতিবাহিত',
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
