class ReportModel {
  final int id;
  final String videoFile;
  final String submittedAt;
  final bool processed;
  final bool processingStarted;
  final String? taskId;
  final String? deviceId;
  final bool harassmentDetected;
  final int faceContactCount;
  final int bodyContactCount;
  final int bodyToBodyContactCount;
  final double drowsinessTime;
  final int yawnCount;
  final int totalHarassmentEvents;
  final double processingTime;
  final double videoDuration;
  final dynamic user;

  ReportModel({
    required this.id,
    required this.videoFile,
    required this.submittedAt,
    required this.processed,
    required this.processingStarted,
    this.taskId,
    this.deviceId,
    required this.harassmentDetected,
    required this.faceContactCount,
    required this.bodyContactCount,
    required this.bodyToBodyContactCount,
    required this.drowsinessTime,
    required this.yawnCount,
    required this.totalHarassmentEvents,
    required this.processingTime,
    required this.videoDuration,
    this.user,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      id: json['id'],
      videoFile: json['video_file'],
      submittedAt: json['submitted_at'],
      processed: json['processed'],
      processingStarted: json['processing_started'],
      taskId: json['task_id'],
      deviceId: json['device_id'],
      harassmentDetected: json['harassment_detected'],
      faceContactCount: json['face_contact_count'],
      bodyContactCount: json['body_contact_count'],
      bodyToBodyContactCount: json['body_to_body_contact_count'],
      drowsinessTime: json['drowsiness_time'].toDouble(),
      yawnCount: json['yawn_count'],
      totalHarassmentEvents: json['total_harassment_events'],
      processingTime: json['processing_time'].toDouble(),
      videoDuration: json['video_duration'].toDouble(),
      user: json['user'],
    );
  }
}