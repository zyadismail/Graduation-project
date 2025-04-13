import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:camera/camera.dart';
import 'package:graduation_project/cubit/app/app_cubit.dart';
import 'package:graduation_project/main.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isRecording = false;
  Timer? _recordingTimer;
  String? _recordedPath;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      cameras[0],
      ResolutionPreset.max,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _recordingTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  Future<void> _startRecording() async {
    if (!_isRecording) {
      await _controller.startVideoRecording();
      setState(() {
        _isRecording = true;
      });
    }
    _recordingTimer = Timer(const Duration(seconds: 5), () async {
      if (_isRecording) {
        await _stopRecording(context);
      }
    });
  }

  Future<void> _stopRecording(BuildContext context) async {
    if (_isRecording) {
      final video = await _controller.stopVideoRecording();
      setState(() {
        _isRecording = false;
        _recordedPath = video.path;
      });

      context.read<AppCubit>().uploadVideo(video.path);
    }
  }

  void _handleRecordingToggle(BuildContext context) async {
    try {
      await _initializeControllerFuture;
      if (_isRecording) {
        await _stopRecording(context);
      } else {
        await _startRecording();
      }
    } catch (e) {
      print('Recording error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: Colors.transparent,
      //   title: const Text('Camera', style: TextStyle(color: Colors.white),),
      // ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          return Stack(
            children: [
              SizedBox(
                  height: double.infinity, child: CameraPreview(_controller)),
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Center(
                  child: BlocConsumer<AppCubit, AppState>(
                    listener: (context, state) {
                      if (state is VideoUploadSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Video uploaded successfully!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.pop(context, _recordedPath);
                      } else if (state is VideoUploadFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Upload failed: ${state.error}'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      final isUploading = state is VideoUploadInProgress;
                      return FloatingActionButton(
                        backgroundColor:
                            _isRecording ? Colors.red : Colors.black,
                        onPressed: isUploading
                            ? null
                            : () => _handleRecordingToggle(context),
                        child: isUploading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Icon(
                                _isRecording ? Icons.stop : Icons.videocam,
                                color: Colors.white,
                              ),
                      );
                    },
                  ),
                ),
              ),
              if (_isRecording)
                Positioned(
                  top: 20,
                  right: 20,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.fiber_manual_record,
                            color: Colors.red, size: 16),
                        SizedBox(width: 4),
                        Text(
                          'Recording',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              BlocBuilder<AppCubit, AppState>(
                builder: (context, state) {
                  if (state is VideoUploadInProgress) {
                    return Container(
                      color: Colors.black54,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 200,
                              child: LinearProgressIndicator(
                                value: state.progress / 100,
                                backgroundColor: Colors.grey[700],
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Colors.white),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Uploading: ${state.progress.toStringAsFixed(1)}%',
                              style: const TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}



