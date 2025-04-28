// class ReportModel {
//   final int id;
//   final String videoFile;
//   final String submittedAt;
//   final bool processed;
//   final bool processingStarted;
//   final String? taskId;
//   final String? deviceId;
//   final bool harassmentDetected;
//   final int faceContactCount;
//   final int bodyContactCount;
//   final int bodyToBodyContactCount;
//   final double drowsinessTime;
//   final int yawnCount;
//   final int totalHarassmentEvents;
//   final double processingTime;
//   final double videoDuration;
//   final dynamic user;

//   ReportModel({
//     required this.id,
//     required this.videoFile,
//     required this.submittedAt,
//     required this.processed,
//     required this.processingStarted,
//     this.taskId,
//     this.deviceId,
//     required this.harassmentDetected,
//     required this.faceContactCount,
//     required this.bodyContactCount,
//     required this.bodyToBodyContactCount,
//     required this.drowsinessTime,
//     required this.yawnCount,
//     required this.totalHarassmentEvents,
//     required this.processingTime,
//     required this.videoDuration,
//     this.user,
//   });

//   factory ReportModel.fromJson(Map<String, dynamic> json) {
//     return ReportModel(
//       id: json['id'],
//       videoFile: json['video_file'],
//       submittedAt: json['submitted_at'],
//       processed: json['processed'],
//       processingStarted: json['processing_started'],
//       taskId: json['task_id'],
//       deviceId: json['device_id'],
//       harassmentDetected: json['harassment_detected'],
//       faceContactCount: json['face_contact_count'],
//       bodyContactCount: json['body_contact_count'],
//       bodyToBodyContactCount: json['body_to_body_contact_count'],
//       drowsinessTime: json['drowsiness_time'].toDouble(),
//       yawnCount: json['yawn_count'],
//       totalHarassmentEvents: json['total_harassment_events'],
//       processingTime: json['processing_time'].toDouble(),
//       videoDuration: json['video_duration'].toDouble(),
//       user: json['user'],
//     );
//   }
// }






class ReportModel {
  int? id;
  String? videoFile;
  String? submittedAt;
  bool? processed;
  bool? processingStarted;
  Null taskId;
  Null deviceId;
  bool? harassmentDetected;
  int? faceContactCount;
  int? bodyContactCount;
  int? bodyToBodyContactCount;
  int? totalHarassmentEvents;
  int? lookAtMirrorCount;
  int? lookBackCount;
  double? processingTime;
  double? videoDuration;
  Null resultVideo;
  int? reportsCount;

  ReportModel(
      {this.id,
      this.videoFile,
      this.submittedAt,
      this.processed,
      this.processingStarted,
      this.taskId,
      this.deviceId,
      this.harassmentDetected,
      this.faceContactCount,
      this.bodyContactCount,
      this.bodyToBodyContactCount,
      this.totalHarassmentEvents,
      this.lookAtMirrorCount,
      this.lookBackCount,
      this.processingTime,
      this.videoDuration,
      this.resultVideo,
      this.reportsCount});

  ReportModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoFile = json['video_file'];
    submittedAt = json['submitted_at'];
    processed = json['processed'];
    processingStarted = json['processing_started'];
    taskId = json['task_id'];
    deviceId = json['device_id'];
    harassmentDetected = json['harassment_detected'];
    faceContactCount = json['face_contact_count'];
    bodyContactCount = json['body_contact_count'];
    bodyToBodyContactCount = json['body_to_body_contact_count'];
    totalHarassmentEvents = json['total_harassment_events'];
    lookAtMirrorCount = json['look_at_mirror_count'];
    lookBackCount = json['look_back_count'];
    processingTime = json['processing_time'];
    videoDuration = json['video_duration'];
    resultVideo = json['result_video'];
    reportsCount = json['reports_count'];
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['video_file'] = videoFile;
    data['submitted_at'] = submittedAt;
    data['processed'] = processed;
    data['processing_started'] = processingStarted;
    data['task_id'] = taskId;
    data['device_id'] = deviceId;
    data['harassment_detected'] = harassmentDetected;
    data['face_contact_count'] = faceContactCount;
    data['body_contact_count'] = bodyContactCount;
    data['body_to_body_contact_count'] = bodyToBodyContactCount;
    data['total_harassment_events'] = totalHarassmentEvents;
    data['look_at_mirror_count'] = lookAtMirrorCount;
    data['look_back_count'] = lookBackCount;
    data['processing_time'] = processingTime;
    data['video_duration'] = videoDuration;
    data['result_video'] = resultVideo;
    data['reports_count'] = reportsCount;
    return data;
  }
}