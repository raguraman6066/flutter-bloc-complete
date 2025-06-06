import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc1/bloc/counter_bloc.dart';
import 'package:flutter_bloc1/cubit/counter_cubit.dart';
import 'package:flutter_bloc1/incre_decre.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterBloc, int>(builder: (context, counter) {
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }),
              // BlocBuilder<CounterCubit, int>(builder: (context, counter) {
              //   return Text(
              //     '$counter',
              //     style: Theme.of(context).textTheme.headlineMedium,
              //   );
              // }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => IncreDecreCounter(),
            ));
          },
          child: Text('Next Page'),
        ));
  }
}
