import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure(
          dioError.response!.data['message'].contains("(")
              ? dioError.response!.data['message']
                  .substring(0, dioError.response!.data['message'].indexOf("("))
              : dioError.response!.data['message'],
        );
      // return ServerFailure.fromResponse(
      //     dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');

      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }

  // factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
  //   print("response: $response");
  //   if (statusCode == 404) {
  //     return ServerFailure('Your request not found, Please try later!');
  //   } else if (statusCode == 500) {
  //     return ServerFailure('Internal Server error, Please try later');
  //   } else {
  //     return ServerFailure(
  //       response['message'].contains("(")
  //           ? response['message'].substring(0, response['message'].indexOf("("))
  //           : response['message'],
  //     );
  //   }
  // }
}
