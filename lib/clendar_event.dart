import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:googleapis/calendar/v3.dart' as googleAPI;

class GoogleDataSource extends CalendarDataSource {
  GoogleDataSource({required List<googleAPI.Event> events}) {
    this.appointments = events;
  }

  @override
  DateTime getStartTime(int index) {
    final googleAPI.Event event = appointments![index];
    return event.start?.date ?? event.start!.dateTime!.toLocal();
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].start.date != null;
  }

  @override
  DateTime getEndTime(int index) {
    //&& event.endTimeUnspecified?
    final googleAPI.Event event = appointments![index];
    return event.endTimeUnspecified != null
        ? (event.start!.date ?? event.start!.dateTime!.toLocal())
        : (event.end!.date != null
            ? event.end!.date!.add(Duration(days: -1))
            : event.end!.dateTime!.toLocal());
  }

  @override
  String getLocation(int index) {
    return appointments![index].location;
  }

  @override
  String getNotes(int index) {
    return appointments![index].description;
  }

  @override
  String getSubject(int index) {
    final googleAPI.Event event = appointments![index];
    return "";
    // return event.summary == null || event.summary!.isEmpty
    //     ? 'No Title'
    //     : event.summary;
  }
}
