import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_mart/app/app.dart';
import 'package:mini_mart/features/cart/cart.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartBloc()),
      ],
      child: const MiniMartApp(),
    ),
  );
}
