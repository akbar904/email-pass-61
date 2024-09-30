
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_cubit_app/main.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('main.dart', () {
		testWidgets('renders MyApp widget', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.byType(MyApp), findsOneWidget);
		});

		testWidgets('MyApp contains MaterialApp', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.byType(MaterialApp), findsOneWidget);
		});

		testWidgets('MyApp initializes with LoginScreen', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.byType(LoginScreen), findsOneWidget);
		});
	});
}
