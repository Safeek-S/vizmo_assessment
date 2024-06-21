import 'package:assessment/constants/app_constants.dart';
import 'package:assessment/screens/events_screen/events_screen_vm.dart';
import 'package:assessment/screens/widgets/ticket_widget.dart';
import 'package:assessment/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../app_navigations/navigation_helper.dart';
import '../../models/event_model/event_model.dart';

class EventsScreen extends StatefulWidget {
  final List<Event> events;
  EventsScreen({super.key, required this.events});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {

  EventsScreenViewModel vm = EventsScreenViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.fetchEventsFromPreviousScreen(widget.events);
      vm.getEventsForDate(vm.selectedDate);
    });

    vm.navigationStream.listen((event) {
      switch (event.navigationType) {
        case NavigationType.push:
          Navigator.pushNamed(context, event.appRoute!.name,
              arguments: event.data);

          break;
        case NavigationType.pop:
          Navigator.pop(context);
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xffF5F5F5),
        automaticallyImplyLeading: false,
        title:  Text(
          'Your Events',
          style: TextStyle(fontSize: AppFonts.bigText, fontWeight: AppFonts.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Observer(builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Observer(builder: (context) {
                  return TableCalendar(
                    onDaySelected: (selectedDay, focusedDay) {
                      vm.setSelectedDate(selectedDay);
                      vm.getEventsForDate(vm.selectedDate);
                    },
                    selectedDayPredicate: (selectedDay) {
                      return (isSameDay(vm.selectedDate, selectedDay));
                    },
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: vm.selectedDate,

                    headerStyle: const HeaderStyle(
                        titleCentered: true, formatButtonVisible: false),
                    
                    calendarFormat: CalendarFormat.week,
                    calendarStyle: const CalendarStyle(
                        selectedDecoration: BoxDecoration(
                            color: Colors.blueAccent, shape: BoxShape.circle)),
                  );
                }),
                SizedBox(
                  height: height * 0.03,
                ),
                vm.chosenEvents.isNotEmpty
                    ? SizedBox(
                        height: height * 0.8,
                        width: width * 0.95,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                vm.navigateToEventInfoScreen(vm.chosenEvents[index]);
                              },
                              child: DynamicTicketWidget(
                                // ticketBorderColor: Colors.black,
                                ticketBgColor:  Colors.white,
                                event: vm.chosenEvents[index],
                                ticketInfoWidget: Text(
                                  vm.chosenEvents[index].title!.capitalize(),
                                  style:  TextStyle(
                                    fontSize: AppFonts.bigText,
                                    color: Colors.black,
                                    fontWeight: AppFonts.medium,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: vm.chosenEvents.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.2,
                          ),
                          Center(
                              child: Image.asset(
                            AppConstants.emptyEventsImagePath,
                            width: 100,
                            height: 100,
                          )),
                           Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child:  Text(
                              'No Events Found!',
                              style: TextStyle(fontSize: AppFonts.mediumText,fontWeight: AppFonts.medium),
                            ),
                          ),
                        ],
                      )
              ],
            ),
          );
        }),
      ),
    );
  }
}
