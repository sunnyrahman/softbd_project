import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class CalenderWidget extends StatefulWidget {
  final Function(DateTime) onSelect;

  const CalenderWidget({super.key, required this.onSelect});
  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {

  DateTime selectedDate=DateTime.now();
  DateTime today=DateTime.now();
  @override
  Widget build(BuildContext context) {

    final List<DateTime> dates = List.generate(15, (index) => today.subtract(Duration(days: 7 - index)));
    final List<String> daysInBangla = ["রবি", "সোম", "মঙ্গল", "বুধ", "বৃহঃ", "শুক্র", "শনি"];

    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 25, right: 20),
      child: Card(
        color: const Color(0xffFDFDFD),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: dates.map((date) {
                bool isToday = date.day == selectedDate.day && date.month == selectedDate.month && date.year == selectedDate.year;
                return InkWell(
                  onTap: (){
                    selectedDate=date;
                    widget.onSelect(selectedDate);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 62.69 + 3,
                        width: 35 + 3,
                        decoration: isToday
                            ? BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xff86B560), Color(0xff336F4A)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        )
                            : null,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6, right: 6),
                        child: Container(
                          height: 62.69,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                daysInBangla[date.weekday % 7],
                                style: const TextStyle(
                                  color: Color(0xff6A6A6A),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                DateFormat('dd', 'bn').format(date),
                                style: const TextStyle(
                                  color: Color(0xff202020),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

