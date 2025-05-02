// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

class VideoService {
  static const String baseUrl =
      'https://7c85-197-37-157-78.ngrok-free.app/api/upload/';

  Future<Response?> postVideo(String videoPath,
      {Function(double)? onProgress}) async {
    try {
      final file = File(videoPath);
      if (!await file.exists()) throw Exception('File does not exist');

      final fileName = basename(videoPath);
      final formData = FormData.fromMap({
        'video_file': await MultipartFile.fromFile(
          videoPath,
          filename: fileName,
          contentType: MediaType('video', 'mp4'),
        ),
      });

      final dio = Dio();
      final response = await dio.post(
        baseUrl,
        data: formData,
        options: Options(
          headers: {
            'Accept': '*/*',
            'Connection': 'keep-alive',
            'Content-Type': 'multipart/form-data',
          },
        ),
        onSendProgress: (sent, total) {
          if (onProgress != null && total > 0) {
            onProgress(sent / total);
          }
        },
      );
      return response;
    } catch (e) {
      print('Video upload failed: $e');
      return null;
    }
  }


  Future<Response> getReport({
    // required int id,
    Map<String, dynamic>? query,
  }) async {
    final dio = Dio();
    dio.options.headers = {
      'lang': 'en',
      'Content-Type': 'application/json',
      'Connection': 'keep-alive',
    };
    return await dio.get(
      "https://7c85-197-37-157-78.ngrok-free.app/api/report/detail/1/",
      queryParameters: query,
    );
  }
}



