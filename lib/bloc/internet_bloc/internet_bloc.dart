// ignore_for_file: empty_constructor_bodies, prefer_final_fields, unused_field

import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:learning_bloc/bloc/internet_bloc/internet_event.dart';
import 'package:learning_bloc/bloc/internet_bloc/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {

  //Initializing connectivity to use it further
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;
  //Here super means i am initializing the extended class and when we initialize the bloc state we need to give an initial state
  InternetBloc() : super(InternetInitialState()) {
    //the "on" function emits a state according to the event it gets
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));

    //.listen(Type-StreamSubcription) will tell us upon all the changes that happen on the connection and store it in result
    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      //if the device is connected to mobile or wifi , it adds an event IneternetGainedEvent
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      }//else it adds the event InternetLostEvent 
      else {
        add(InternetLostEvent());
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
