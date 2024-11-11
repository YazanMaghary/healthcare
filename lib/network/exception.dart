import 'package:healthcare/model/error_model.dart';

class ServerExceptions implements Exception {
  final ErrorModel errorModel;
  ServerExceptions({required this.errorModel});
}
