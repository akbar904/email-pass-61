
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cubit_app/screens/home_screen.dart';
import 'package:simple_cubit_app/cubits/auth_cubit.dart';

class MockAuthCubit extends Mock implements AuthCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = MockAuthCubit();
		});

		testWidgets('displays a Logout button', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AuthCubit>(
						create: (_) => authCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('Logout'), findsOneWidget);
		});

		testWidgets('Logout button triggers logout event', (WidgetTester tester) async {
			when(() => authCubit.logout()).thenReturn(null);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AuthCubit>(
						create: (_) => authCubit,
						child: HomeScreen(),
					),
				),
			);

			await tester.tap(find.text('Logout'));
			await tester.pumpAndSettle();

			verify(() => authCubit.logout()).called(1);
		});
	});
}
