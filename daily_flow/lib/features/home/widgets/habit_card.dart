import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HabitCard extends StatefulWidget {
  const HabitCard({super.key});

  @override
  State<HabitCard> createState() => _HabitCardState();
}

class _HabitCardState extends State<HabitCard> {
  final Set<DateTime> _completedDays = {};

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2, 
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Beber 2 litros de água",
                  style: TextStyle(
                    color: Colors.black, 
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                  ),
                ),
                Icon(Icons.delete_outline, color: Colors.black),
              ],
            ),
            SizedBox(height: 5,),
            TableCalendar(
              calendarFormat: CalendarFormat.week,
              focusedDay: DateTime.now(), 
              firstDay: DateTime.now().subtract(Duration(days: 365)), 
              lastDay: DateTime.now().add(Duration(days: 365)), 
              startingDayOfWeek: StartingDayOfWeek.monday,
              // essa lógica vai para o bloc
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  print(selectedDay);
                  if (_completedDays.contains(selectedDay)) {
                    _completedDays.remove(selectedDay); 
                  } else {
                    _completedDays.add(selectedDay);   
                  }
                });
              },
              headerVisible: false,
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  return _buildSimpleCircle(day);
                },
                todayBuilder: (context, day, focusedDay) {
                  return _buildSimpleCircle(day, isToday: true);
                },
                outsideBuilder: (context, day, focusedDay) => Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildSimpleCircle(DateTime day, {bool isToday = false}) {
    final isCompleted = _completedDays.contains(day); 
    
    return Container(
      margin: EdgeInsets.all(4),
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isCompleted ? Colors.green : null,
        border: Border.all(
          color: isToday ? Colors.blue : 
                isCompleted ? Colors.green : Colors.grey,
          width: 2,
        ),
        shape: BoxShape.circle,
      ),
      child: isCompleted 
        ? Icon(Icons.check, size: 16, color: Colors.white)
        : SizedBox(),
    );
  }

}

