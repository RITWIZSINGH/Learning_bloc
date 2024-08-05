// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/bloc/internet_bloc/internet_bloc.dart';
import 'package:learning_bloc/bloc/internet_bloc/internet_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          //It makes the UI according to the context and state provided to it 
          //whereas BlocListener can be used to show dialogue boxes , navigate to different pages
          child: BlocBuilder<InternetBloc, InternetState>(
            builder: (context, state) {
              
              if (state is InternetGainedState){
                return Text("Connected!");
              }
              else if(state is InternetLostState){
                return Text("Not Connected!");
              }else {
                return Text("Loading...");
              }
            },
          ),
        ),
      ),
    );
  }
}
