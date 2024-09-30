
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_cubit_app/cubits/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
	@override
	_LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
	final _emailController = TextEditingController();
	final _passwordController = TextEditingController();
	String _errorMessage;

	@override
	void dispose() {
		_emailController.dispose();
		_passwordController.dispose();
		super.dispose();
	}

	void _login() {
		final email = _emailController.text;
		final password = _passwordController.text;
		context.read<AuthCubit>().login(email, password);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Login'),
			),
			body: BlocListener<AuthCubit, AuthState>(
				listener: (context, state) {
					if (state is AuthError) {
						setState(() {
							_errorMessage = state.message;
						});
					}
				},
				child: Padding(
					padding: const EdgeInsets.all(16.0),
					child: Column(
						children: [
							if (_errorMessage != null)
								Text(
									_errorMessage,
									style: TextStyle(color: Colors.red),
								),
							TextField(
								controller: _emailController,
								decoration: InputDecoration(
									labelText: 'Email',
								),
							),
							TextField(
								controller: _passwordController,
								decoration: InputDecoration(
									labelText: 'Password',
								),
								obscureText: true,
							),
							SizedBox(height: 16.0),
							ElevatedButton(
								onPressed: _login,
								child: Text('Login'),
							),
						],
					),
				),
			),
		);
	}
}
