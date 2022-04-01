
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PizzaBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      print("event :------ $event");
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print("error :------ $error");
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      print("change :------ $change");
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print("transition :------ $transition");
    }
  }
}