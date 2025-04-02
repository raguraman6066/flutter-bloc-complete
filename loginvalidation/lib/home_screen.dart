import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginvalidation/bloc/auth_bloc.dart';
import 'package:loginvalidation/login_screen.dart';
import 'package:loginvalidation/widgets/gradient_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            children: [
              Center(
                child: Text((state as AuthSuccess).uid),
              ),
              GradientButton(onPressed: () {
                context.read<AuthBloc>().add(AuthLogoutRequest());
              })
            ],
          );
        },
      ),
    );
  }
}
