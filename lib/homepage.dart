import 'package:flutter/material.dart';
import 'package:streak_calendar/streak_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<DateTime> streakDates = [];

  @override
  void initState() {
    super.initState();
    _loadStreakDates();
  }

  Future<void> _saveStreakDates() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> dateStrings =
        streakDates.map((date) => date.toIso8601String()).toList();
    await prefs.setStringList('streakDates', dateStrings);
  }

  Future<void> _loadStreakDates() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? dateStrings = prefs.getStringList('streakDates');
    if (dateStrings != null) {
      setState(() {
        streakDates = dateStrings.map((str) => DateTime.parse(str)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Streaky")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CleanCalendar(
            datesForStreaks: streakDates,
            currentDateOfCalendar: DateTime.now(),
            generalDatesProperties: DatesProperties(
              datesDecoration: DatesDecoration(
                datesBackgroundColor: Colors.red,
                datesBorderColor: Colors.blue.shade100,
                datesTextColor: Colors.black,
              ),
            ),
            currentDateProperties: DatesProperties(
              datesDecoration: DatesDecoration(
                datesBorderRadius: 1000,
                datesBackgroundColor: Colors.lightGreen.shade100,
                datesBorderColor: Colors.green,
                datesTextColor: Colors.black,
              ),
            ),
            enableDenseViewForDates: true,
            enableDenseSplashForDates: true,
            streakDatesProperties: DatesProperties(
              datesDecoration: DatesDecoration(
                datesBorderRadius: 1000,
                datesBackgroundColor: Colors.green,
                datesBorderColor: Colors.blue,
                datesTextColor: Colors.white,
              ),
            ),
            dateSelectionMode: DatePickerSelectionMode.singleOrMultiple,
            onSelectedDates: (List<DateTime> selectedDates) async {
              // Called every time dates are selected or deselected.
              if (streakDates.contains(selectedDates[0])) {
                setState(() {
                  streakDates.remove(selectedDates[0]);
                });
              } else {
                setState(() {
                  streakDates.add(selectedDates[0]);
                });
              }
              await _saveStreakDates();
            },
          ),
        ],
      ),
    );
  }
}
