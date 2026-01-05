import 'package:flutter/material.dart';

class TimeSlots extends StatelessWidget {
  final String hourStart;
  //final String hourEnd;

  const TimeSlots({super.key, required this.hourStart});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: 82,
      height: 35,
      decoration: BoxDecoration(
        color: Color(0xFF203D3F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(hourStart, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

/// Here, only the business start time will be obtained.
/// Based on the time the establishment opens, the schedules will be
/// calculated, and this will only be done on the front end.
/// The schedules selected by the user will be saved.
