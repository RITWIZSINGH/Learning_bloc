// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learning_bloc/bloc/internet_bloc/internet_bloc.dart';
import 'screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //BlocProvider is set as a parent to materialApp cause it can  give data to its children 
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
