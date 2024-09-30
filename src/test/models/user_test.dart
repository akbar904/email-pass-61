
// test/models/user_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:your_package_name/models/user.dart';

void main() {
	group('User Model', () {
		test('should create a User instance with given email and token', () {
			// Arrange
			const email = 'test@example.com';
			const token = '12345';

			// Act
			final user = User(email: email, token: token);

			// Assert
			expect(user.email, email);
			expect(user.token, token);
		});

		test('should correctly serialize to JSON', () {
			// Arrange
			const email = 'test@example.com';
			const token = '12345';
			final user = User(email: email, token: token);

			// Act
			final json = user.toJson();

			// Assert
			expect(json, {'email': email, 'token': token});
		});

		test('should correctly deserialize from JSON', () {
			// Arrange
			const email = 'test@example.com';
			const token = '12345';
			final json = {'email': email, 'token': token};

			// Act
			final user = User.fromJson(json);

			// Assert
			expect(user.email, email);
			expect(user.token, token);
		});
	});
}
