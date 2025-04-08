// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

class VideoService {
  static const String baseUrl =
      'https://1986-41-35-179-202.ngrok-free.app/api/upload/';

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
}
