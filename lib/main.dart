import 'package:assessment/app_navigations/app_routes.dart';
import 'package:assessment/screens/event_info_screen/event_info_screen.dart';
import 'package:assessment/screens/events_screen/events_screen.dart';
import 'package:assessment/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'animations/slide_transition_animation.dart';
import 'models/event_model/event_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       pageTransitionsTheme:  const PageTransitionsTheme(
          builders: {
           TargetPlatform.android: SlideRightPageTransition(),
            TargetPlatform.iOS: SlideRightPageTransition(),
          },
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoute.splashScreen.toString(),
       onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case 'splashScreen':
            return MaterialPageRoute(builder: (context) => const SplashScreen());
          case 'eventsScreen':
            final List<Event> events = settings.arguments as List<Event>;
            return MaterialPageRoute(
              builder: (context) => EventsScreen(events: events),
            );
            case 'eventInfoScreen': 
              final Event event= settings.arguments as Event;
            return MaterialPageRoute(builder: (context) => EventInfoScreen(eventDetail: event));
       
        }
        return null;
      },
      
    );
  }
}


