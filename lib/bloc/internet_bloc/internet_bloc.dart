// ignore_for_file: empty_constructor_bodies

import 'package:learning_bloc/bloc/internet_bloc/internet_event.dart';
import 'package:learning_bloc/bloc/internet_bloc/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState>{
  //Here super means i am initializing the extended class and when we initialize the bloc state we need to give an initial state                                     
  InternetBloc():super(InternetInitialState()){

    //the "on" function emits a state according to the event it gets
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));
  }
} 