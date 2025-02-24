import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_bank/bank_home.dart';
import 'package:voice_bank/blocs/home/home_cubit.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'voicebank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0.0,
        ),
      ),
      routes: {
        '/': (context) {
          return BlocProvider(
            create: (_) => HomeCubit(),
            child: BankApp(),
          );
        }
      },
    );
  }
}