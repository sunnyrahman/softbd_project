import 'package:flutter/material.dart';
import '../../../../../global/widget/global_sizedbox.dart';
import '../../../../global/constants/constants.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({super.key});

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: image1.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 20
          ),
          itemBuilder: (BuildContext context, int index){
            return Column(
              children: [
                Image.asset("${image1[index]}"),
                sizeBoxH(10),
                Text( title1[index], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
              ],
            );
          },
        ));
  }
}
