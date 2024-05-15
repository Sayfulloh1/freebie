import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:map_flutter/repository/repository.dart';
import 'package:geolocator/geolocator.dart';

class RepositoryImpl extends Repository {
  @override
  Future<Either<Exception, double>> getDistance(
      String latitude, String longitude, String token) async {
    String url = 'https://quiz.4fun.uz/get_distance/';
    Map<String, String> body = {
      "latitude": latitude,
      "longitude": longitude,
    };

    Dio dio = Dio();
    final response = await dio.post(
      url,
      data: body,
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );

    if (response.statusCode == 200) {
      try {
        final data = response.data as Map<String, dynamic>;
        print(data['message']);
        return Right(data['message'] as double);
      } on DioException catch (e) {
        // Handle specific HTTP exceptions (e.g., 401, 404)
        return Left(Exception(e.message));
      } catch (e) {
        // Handle other unexpected errors
        return Left(Exception("Unexpected error: ${e.toString()}"));
      }
    } else {
      return Left(
          Exception("Error occurred, status code: ${response.statusCode}"));
    }
  }

  @override
  @override
  Future<Either<Exception, String>> getToken(
      String username, String password) async {
    String url = 'https://quiz.4fun.uz/token/';
    Dio dio = Dio();
    Map<String, String> body = {
      "username": username,
      "password": password,
    };
    final response = await dio.post(
      url,
      data: body,
    );

    if (response.statusCode == 200) {
      try {
        final data = response.data as Map<String, dynamic>;
        return Right(data['access'] as String);
      } catch (e) {
        // Handle any exception during response processing
        return Left(Exception("Error occurred: ${e.toString()}"));
      }
    } else {
      return Left(Exception("Error occurred, status code: ${response.statusCode}"));
    }
  }



  @override
  Future<Map<String, double>> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return {
      'latitude': position.latitude,
      'longitude': position.longitude,
    };
  }


}
