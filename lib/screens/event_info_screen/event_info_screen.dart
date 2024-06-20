import 'package:assessment/constants/app_constants.dart';
import 'package:assessment/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../models/event_model/event_model.dart';

class EventInfoScreen extends StatelessWidget {
  final Event eventDetail;
  const EventInfoScreen({super.key, required this.eventDetail});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(

      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xffF5F5F5),
        title: Text(
          'Event Details',
          style:
              TextStyle(fontSize: AppFonts.bigText, fontWeight: AppFonts.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  eventDetail.title!.capitalize(),
                  style: TextStyle(
                      fontSize: AppFonts.bigText, fontWeight: AppFonts.bold),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  color: eventDetail.status!.name == 'cancelled'
                      ? Colors.red
                      : Colors.green,
                  child: Text(
                    eventDetail.status!.name,
                    style: TextStyle(
                      fontWeight: AppFonts.semiBold,
                      fontSize: AppFonts.smallText,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Time',
                  style: TextStyle(
                    fontSize: AppFonts.mediumText,
                    color: Colors.black,
                    fontWeight: AppFonts.semiBold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                eventDetail.getTimeRange(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppFonts.mediumText,
                  color: Colors.black,
                  fontWeight: AppFonts.medium,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'About',
                    style: TextStyle(
                        fontSize: AppFonts.extraMedium,
                        fontWeight: AppFonts.semiBold),
                  )),
            ),
            Text(
              eventDetail.description!,
              style: TextStyle(
                  fontSize: AppFonts.mediumText, fontWeight: AppFonts.regular),
            ),
          ],
        ),
      ),
    );
  }
}
