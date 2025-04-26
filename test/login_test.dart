import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_test/flutter_test.dart';
import 'package:healthcare/core/network/api_constances.dart';
import 'package:healthcare/datasource/auth_data_source.dart';
import 'package:mockito/mockito.dart';
import 'login_test.mocks.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([dio.Dio])
void main() {
  group(
    "Test Start Authintication",
    () {
      test('LogIn Successfully Testing', () async {
        final mockDio = MockDio();
        final authDataSource = AuthDataSource(dio: dio.Dio());
        const email = "zezo2.5.37.11.2@gmail.com";
        const password = "Zezo@2002";
        
        when(mockDio.post(
          ApiConstances.loginUrl,
          data: {"email": email, "password": password},
        )).thenAnswer((_) async => dio.Response(
              statusCode: 200,
              requestOptions: dio.RequestOptions(path: ApiConstances.loginUrl),
            ));
        final result =
            await authDataSource.login({"email": email, "password": password});
        expect(result, isA<Right>());
        result.fold((failure) {
          fail("Login Testing Failed to success");
        }, (success) {
          expect(success.user?.name, "yazanm");
        });
      });
      test('LogIn Failed Testing', () async {
        final mockDio = MockDio();
        final authDataSource = AuthDataSource(dio: dio.Dio());
        const email = "invalid.email@example.com";
        const password = "Zezo@2002";

        when(mockDio.post(
          ApiConstances.loginUrl,
          data: {"email": email, "password": password},
        )).thenAnswer((_) async => dio.Response(
              statusCode: 400,
              data: {
                "message": "Email or password is incorrect",
                "error":
                    "ApiError: Email or password is incorrect\n    at AuthService.login (/root/healthcare_back/dist/services/AuthService.js:46:19)\n    at async value (/root/healthcare_back/dist/controllers/AuthController.js:65:45)"
              },
              requestOptions: dio.RequestOptions(path: ApiConstances.loginUrl),
            ));
        final result =
            await authDataSource.login({"email": email, "password": password});
        expect(result, isA<Left>());
        result.fold(
          (failure) => expect(failure, "Email or password is incorrect"),
          (success) => fail("Login should not succeed"),
        );
      });
    },
  );
}
