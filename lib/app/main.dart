import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_w1/features/home/cubit/home_cubit.dart';
import 'package:flutter_w1/features/login/cubit/login_cubit.dart';
import 'package:flutter_w1/features/login/login.dart';
import 'package:flutter_w1/app/navigate.dart';
import 'package:flutter_w1/features/signup/cubit/signup_cubit.dart';
import 'package:flutter_w1/features/signup/signup.dart';
import 'package:flutter_w1/features/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => LoginCubit())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: {
          '/login':
              (context) => BlocProvider(
                create: (context) => LoginCubit()..disableButton(),
                child: const LoginPage(),
              ),
          '/signup':
              (context) => BlocProvider(
                create: (context) => SignupCubit()..disableButton(),
                child: const SignupPage(),
              ),

          '/navigate':
              (context) => BlocProvider(
                create: (context) => HomeCubit()..fetchProducts(),
                child: const NavigateBottom(),
              ),
        },
        theme: ThemeData(
          fontFamily: 'Roboto',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 51, 255, 33),
          ),
        ),
        home: BlocProvider(
          create: (context) => LoginCubit(),
          child: const LoginPage(),
        ),
      ),
    );
  }
}
