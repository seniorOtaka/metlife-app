import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'helper/bloc/app_cubit.dart';

import 'helper/bloc/bloc_opserves.dart';

import 'modules/splash/splash_screen.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bezzie',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}