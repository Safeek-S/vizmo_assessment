// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EventsScreenModel on _EventsScreenModel, Store {
  late final _$eventsAtom =
      Atom(name: '_EventsScreenModel.events', context: context);

  @override
  List<Event> get events {
    _$eventsAtom.reportRead();
    return super.events;
  }

  @override
  set events(List<Event> value) {
    _$eventsAtom.reportWrite(value, super.events, () {
      super.events = value;
    });
  }

  late final _$chosenEventsAtom =
      Atom(name: '_EventsScreenModel.chosenEvents', context: context);

  @override
  List<Event> get chosenEvents {
    _$chosenEventsAtom.reportRead();
    return super.chosenEvents;
  }

  @override
  set chosenEvents(List<Event> value) {
    _$chosenEventsAtom.reportWrite(value, super.chosenEvents, () {
      super.chosenEvents = value;
    });
  }

  late final _$selectedDateAtom =
      Atom(name: '_EventsScreenModel.selectedDate', context: context);

  @override
  DateTime get selectedDate {
    _$selectedDateAtom.reportRead();
    return super.selectedDate;
  }

  @override
  set selectedDate(DateTime value) {
    _$selectedDateAtom.reportWrite(value, super.selectedDate, () {
      super.selectedDate = value;
    });
  }

  late final _$_EventsScreenModelActionController =
      ActionController(name: '_EventsScreenModel', context: context);

  @override
  void setSelectedDate(DateTime selectedDate) {
    final _$actionInfo = _$_EventsScreenModelActionController.startAction(
        name: '_EventsScreenModel.setSelectedDate');
    try {
      return super.setSelectedDate(selectedDate);
    } finally {
      _$_EventsScreenModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setListOfEvents(List<Event> events) {
    final _$actionInfo = _$_EventsScreenModelActionController.startAction(
        name: '_EventsScreenModel.setListOfEvents');
    try {
      return super.setListOfEvents(events);
    } finally {
      _$_EventsScreenModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setChosenEvents(List<Event> events) {
    final _$actionInfo = _$_EventsScreenModelActionController.startAction(
        name: '_EventsScreenModel.setChosenEvents');
    try {
      return super.setChosenEvents(events);
    } finally {
      _$_EventsScreenModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
events: ${events},
chosenEvents: ${chosenEvents},
selectedDate: ${selectedDate}
    ''';
  }
}
