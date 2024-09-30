
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.example.simple_cubit_app/screens/login_screen.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('LoginScreen Widget Tests', () {
		testWidgets('LoginScreen displays email and password fields', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider(
						create: (_) => MockAuthCubit(),
						child: LoginScreen(),
					),
				),
			);

			// Act & Assert
			expect(find.byType(TextField), findsNWidgets(2));
			expect(find.widgetWithText(TextField, 'Email'), findsOneWidget);
			expect(find.widgetWithText(TextField, 'Password'), findsOneWidget);
		});

		testWidgets('LoginScreen displays login button', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider(
						create: (_) => MockAuthCubit(),
						child: LoginScreen(),
					),
				),
			);

			// Act & Assert
			expect(find.byType(ElevatedButton), findsOneWidget);
			expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
		});

		testWidgets('Login button invokes login method', (WidgetTester tester) async {
			// Arrange
			final authCubit = MockAuthCubit();
			when(() => authCubit.login(any(), any())).thenAnswer((_) async {});

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider(
						create: (_) => authCubit,
						child: LoginScreen(),
					),
				),
			);

			// Act
			await tester.enterText(find.widgetWithText(TextField, 'Email'), 'test@example.com');
			await tester.enterText(find.widgetWithText(TextField, 'Password'), 'password');
			await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
			await tester.pump();

			// Assert
			verify(() => authCubit.login('test@example.com', 'password')).called(1);
		});
	});
}
