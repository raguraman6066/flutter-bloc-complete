import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc1/bloc/counter_bloc.dart';
import 'package:flutter_bloc1/cubit/counter_cubit.dart';

class IncreDecreCounter extends StatelessWidget {
  const IncreDecreCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      body: Column(
        children: [
          FloatingActionButton(
            onPressed: () {
              //  counterCubit.increment();
              counterBloc.add(CounterIncrement());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              // counterCubit.decrement();
              counterBloc.add(CounterDecrement());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
