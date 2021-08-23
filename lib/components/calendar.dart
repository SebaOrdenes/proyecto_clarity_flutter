import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class Calendar extends StatefulWidget {
  final DateTime firstDay;
  final DateTime lastDay;
  final CalendarFormat format;
  final DateTime selectedDay;
  final DateTime focusDay;
  final Function getSelectDay;

  const Calendar({
    Key key,
    this.firstDay,
    this.lastDay,
    this.format = CalendarFormat.week,
    this.selectedDay,
    this.focusDay,
    this.getSelectDay,
  }) : super(key: key);
  @override
  _Calendar createState() => _Calendar();
}

class _Calendar extends State<Calendar> {
  CalendarFormat formatAux;
  DateTime selectedDayAux;
  DateTime focusDayAux;

  void initState() {
    super.initState();
    this.formatAux = widget.format;
    this.selectedDayAux = widget.selectedDay;
    this.focusDayAux = widget.focusDay;
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: focusDayAux,
      firstDay: widget.firstDay,
      lastDay: widget.lastDay,
      calendarFormat: formatAux,
      onFormatChanged: (CalendarFormat _format) {
        setState(
          () {
            formatAux = _format;
          },
        );
      },
      startingDayOfWeek: StartingDayOfWeek.monday,
      daysOfWeekVisible: true,
      onDaySelected: (DateTime selectDay, DateTime focusDay) {
        setState(
          () {
            selectedDayAux = selectDay;
            focusDayAux = focusDay;
            widget.getSelectDay(
                selectedDayAux); //Envía fecha seleccionada a vista padre
          },
        );
      },
      selectedDayPredicate: (DateTime date) {
        return isSameDay(selectedDayAux, date);
      },

      //Estilo del calendario
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        selectedDecoration: BoxDecoration(
          color: kSecondaryColor,
          shape: BoxShape.circle,
        ),
        selectedTextStyle: TextStyle(color: Colors.white),
        todayDecoration: BoxDecoration(
          color: kPrimaryColor,
          shape: BoxShape.circle,
        ),
      ),

      //Estilo cabecera calendario
      headerStyle: HeaderStyle(
        formatButtonShowsNext: false,
        formatButtonDecoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        formatButtonTextStyle: TextStyle(color: Colors.white),
      ),
      locale: 'es',
    );
  }
}
