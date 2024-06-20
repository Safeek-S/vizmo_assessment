// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashScreenModel on _SplashScreenModel, Store {
  late final _$eventsAtom =
      Atom(name: '_SplashScreenModel.events', context: context);

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

  late final _$_SplashScreenModelActionController =
      ActionController(name: '_SplashScreenModel', context: context);

  @override
  void setListOfEvents(List<Event> events) {
    final _$actionInfo = _$_SplashScreenModelActionController.startAction(
        name: '_SplashScreenModel.setListOfEvents');
    try {
      return super.setListOfEvents(events);
    } finally {
      _$_SplashScreenModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
events: ${events}
    ''';
  }
}
