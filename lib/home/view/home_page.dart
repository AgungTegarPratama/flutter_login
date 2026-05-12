import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/authentication/authentication.dart';
import 'package:flutter_login/authentication/bloc/authentication_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center, // tambahan
          children: [
            _UserId(),
            SizedBox(height: 20),
            _LogoutButton(),
          ],
        ),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Logout'),
      onPressed: () {
        context.read<AuthenticationBloc>().add(
          AuthenticationLogoutPressed(),
        );
      },
    );
  }
}

class _UserId extends StatelessWidget {
  const _UserId();

  @override
  Widget build(BuildContext context) {
    final userId = context.select(
      (AuthenticationBloc bloc) => bloc.state.user.id,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        'UserID: $userId',
        textAlign: TextAlign.center, // tambahan
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}