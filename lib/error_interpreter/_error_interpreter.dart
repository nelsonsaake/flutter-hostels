import 'package:dio/dio.dart';

import 'dio_error_interpreter.dart';

class ErrorInterpreter {
  // for handling unknown exceptions

  static String interpretException(Exception e) {
    return "error 234: please contact developer: \n$e";
  }

  // decide how the error should be interpreted

  static String interpret(e) {
    print(e);
    switch (e.runtimeType) {
      case String:
        return e;
      case DioException:
        return DioExceptionInterpreter().interpret(e);
      case Exception:
        return interpretException(e);
      default:
        return "unknown error: $e";
    }
  }
}
