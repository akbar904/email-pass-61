
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/models/user.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
	final User user;

	Authenticated(this.user);
}

class AuthError extends AuthState {
	final String message;

	AuthError(this.message);
}

class Unauthenticated extends AuthState {}

class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(AuthInitial());

	void login(String email, String password) async {
		emit(AuthLoading());
		// Simulating network request
		await Future.delayed(Duration(seconds: 1));
		if (email == 'test@example.com' && password == 'password') {
			final user = User(email: email, token: 'dummy_token');
			emit(Authenticated(user));
		} else {
			emit(AuthError('Invalid credentials'));
		}
	}

	void logout() {
		emit(Unauthenticated());
	}
}
