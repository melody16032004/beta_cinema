import 'package:flutter/material.dart';

class TheaterSchedule extends StatefulWidget {
  const TheaterSchedule({super.key});

  @override
  State<TheaterSchedule> createState() => _TheaterScheduleState();
}

class _TheaterScheduleState extends State<TheaterSchedule> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const Text('Lịch chiếu theo rạp...'),
      ),
    );
  }
}
