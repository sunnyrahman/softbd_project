import 'package:flutter/material.dart';

class DashBardScreen extends StatefulWidget {
  const DashBardScreen({super.key});

  @override
  State<DashBardScreen> createState() => _DashBardScreenState();
}

class _DashBardScreenState extends State<DashBardScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Welcome Project Setup And Dashboard Screen"),
    );
  }
}
