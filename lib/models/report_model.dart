



// class ReportModel {
//   Video? video;
//   List<Detections>? detections;
//   String? status;

//   ReportModel({this.video, this.detections, this.status});

//   ReportModel.fromJson(Map<String, dynamic> json) {
//     video = json['video'] != null ? new Video.fromJson(json['video']) : null;
//     if (json['detections'] != null) {
//       detections = <Detections>[];
//       json['detections'].forEach((v) {
//         detections!.add(new Detections.fromJson(v));
//       });
//     }
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.video != null) {
//       data['video'] = this.video!.toJson();
//     }
//     if (this.detections != null) {
//       data['detections'] = this.detections!.map((v) => v.toJson()).toList();
//     }
//     data['status'] = this.status;
//     return data;
//   }
// }

// class Video {
//   int? id;
//   String? videoFile;
//   String? submittedAt;
//   bool? processed;
//   bool? processingStarted;
//   Null? taskId;
//   Null? deviceId;
//   bool? harassmentDetected;
//   int? faceContactCount;
//   int? bodyContactCount;
//   int? bodyToBodyContactCount;
//   int? totalHarassmentEvents;
//   int? lookAtMirrorCount;
//   int? lookBackCount;
//   double? processingTime;
//   double? videoDuration;
//   Null? resultVideo;
//   int? reportsCount;

//   Video(
//       {this.id,
//       this.videoFile,
//       this.submittedAt,
//       this.processed,
//       this.processingStarted,
//       this.taskId,
//       this.deviceId,
//       this.harassmentDetected,
//       this.faceContactCount,
//       this.bodyContactCount,
//       this.bodyToBodyContactCount,
//       this.totalHarassmentEvents,
//       this.lookAtMirrorCount,
//       this.lookBackCount,
//       this.processingTime,
//       this.videoDuration,
//       this.resultVideo,
//       this.reportsCount});

//   Video.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     videoFile = json['video_file'];
//     submittedAt = json['submitted_at'];
//     processed = json['processed'];
//     processingStarted = json['processing_started'];
//     taskId = json['task_id'];
//     deviceId = json['device_id'];
//     harassmentDetected = json['harassment_detected'];
//     faceContactCount = json['face_contact_count'];
//     bodyContactCount = json['body_contact_count'];
//     bodyToBodyContactCount = json['body_to_body_contact_count'];
//     totalHarassmentEvents = json['total_harassment_events'];
//     lookAtMirrorCount = json['look_at_mirror_count'];
//     lookBackCount = json['look_back_count'];
//     processingTime = json['processing_time'];
//     videoDuration = json['video_duration'];
//     resultVideo = json['result_video'];
//     reportsCount = json['reports_count'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['video_file'] = this.videoFile;
//     data['submitted_at'] = this.submittedAt;
//     data['processed'] = this.processed;
//     data['processing_started'] = this.processingStarted;
//     data['task_id'] = this.taskId;
//     data['device_id'] = this.deviceId;
//     data['harassment_detected'] = this.harassmentDetected;
//     data['face_contact_count'] = this.faceContactCount;
//     data['body_contact_count'] = this.bodyContactCount;
//     data['body_to_body_contact_count'] = this.bodyToBodyContactCount;
//     data['total_harassment_events'] = this.totalHarassmentEvents;
//     data['look_at_mirror_count'] = this.lookAtMirrorCount;
//     data['look_back_count'] = this.lookBackCount;
//     data['processing_time'] = this.processingTime;
//     data['video_duration'] = this.videoDuration;
//     data['result_video'] = this.resultVideo;
//     data['reports_count'] = this.reportsCount;
//     return data;
//   }
// }

// class Detections {
//   int? id;
//   String? detectionType;
//   String? detectionTypeDisplay;
//   double? timestamp;
//   int? confidence;
//   int? frameNumber;
//   String? bodyPart;
//   int? person1;
//   int? person2;
//   String? details;
//   List<Frames>? frames;

//   Detections(
//       {this.id,
//       this.detectionType,
//       this.detectionTypeDisplay,
//       this.timestamp,
//       this.confidence,
//       this.frameNumber,
//       this.bodyPart,
//       this.person1,
//       this.person2,
//       this.details,
//       this.frames});

//   Detections.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     detectionType = json['detection_type'];
//     detectionTypeDisplay = json['detection_type_display'];
//     timestamp = json['timestamp'];
//     confidence = json['confidence'];
//     frameNumber = json['frame_number'];
//     bodyPart = json['body_part'];
//     person1 = json['person1'];
//     person2 = json['person2'];
//     details = json['details'];
//     if (json['frames'] != null) {
//       frames = <Frames>[];
//       json['frames'].forEach((v) {
//         frames!.add(new Frames.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['detection_type'] = this.detectionType;
//     data['detection_type_display'] = this.detectionTypeDisplay;
//     data['timestamp'] = this.timestamp;
//     data['confidence'] = this.confidence;
//     data['frame_number'] = this.frameNumber;
//     data['body_part'] = this.bodyPart;
//     data['person1'] = this.person1;
//     data['person2'] = this.person2;
//     data['details'] = this.details;
//     if (this.frames != null) {
//       data['frames'] = this.frames!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Frames {
//   int? id;
//   String? frameImage;
//   int? frameNumber;
//   String? createdAt;

//   Frames({this.id, this.frameImage, this.frameNumber, this.createdAt});

//   Frames.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     frameImage = json['frame_image'];
//     frameNumber = json['frame_number'];
//     createdAt = json['created_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['frame_image'] = this.frameImage;
//     data['frame_number'] = this.frameNumber;
//     data['created_at'] = this.createdAt;
//     return data;
//   }
// }




// ignore_for_file: prefer_collection_literals

class ReportModel {
  Video? video;
  List<Detections>? detections;
  String? status;
  Frames? frames;

  ReportModel({this.video, this.detections, this.status});

  ReportModel.fromJson(Map<String, dynamic> json) {
    video = json['video'] != null ? Video.fromJson(json['video']) : null;
    if (json['detections'] != null) {
      detections = <Detections>[];
      json['detections'].forEach((v) {
        detections!.add(Detections.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (video != null) {
      data['video'] = video!.toJson();
    }
    if (detections != null) {
      data['detections'] = detections!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class Video {
  int? id;
  String? videoFile;
  String? submittedAt;
  bool? processed;
  bool? processingStarted;
  bool? harassmentDetected;
  int? faceContactCount;
  int? bodyContactCount;
  int? bodyToBodyContactCount;
  int? totalHarassmentEvents;
  int? lookAtMirrorCount;
  int? lookBackCount;
  double? processingTime;
  double? videoDuration;
  int? reportsCount;

  Video({
    this.id,
    this.videoFile,
    this.submittedAt,
    this.processed,
    this.processingStarted,
    this.harassmentDetected,
    this.faceContactCount,
    this.bodyContactCount,
    this.bodyToBodyContactCount,
    this.totalHarassmentEvents,
    this.lookAtMirrorCount,
    this.lookBackCount,
    this.processingTime,
    this.videoDuration,
    this.reportsCount,
  });

  Video.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoFile = json['video_file'];
    submittedAt = json['submitted_at'];
    processed = json['processed'];
    processingStarted = json['processing_started'];
    harassmentDetected = json['harassment_detected'];
    faceContactCount = json['face_contact_count'];
    bodyContactCount = json['body_contact_count'];
    bodyToBodyContactCount = json['body_to_body_contact_count'];
    totalHarassmentEvents = json['total_harassment_events'];
    lookAtMirrorCount = json['look_at_mirror_count'];
    lookBackCount = json['look_back_count'];
    processingTime = json['processing_time'];
    videoDuration = json['video_duration'];
    reportsCount = json['reports_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['video_file'] = videoFile;
    data['submitted_at'] = submittedAt;
    data['processed'] = processed;
    data['processing_started'] = processingStarted;
    data['harassment_detected'] = harassmentDetected;
    data['face_contact_count'] = faceContactCount;
    data['body_contact_count'] = bodyContactCount;
    data['body_to_body_contact_count'] = bodyToBodyContactCount;
    data['total_harassment_events'] = totalHarassmentEvents;
    data['look_at_mirror_count'] = lookAtMirrorCount;
    data['look_back_count'] = lookBackCount;
    data['processing_time'] = processingTime;
    data['video_duration'] = videoDuration;
    data['reports_count'] = reportsCount;
    return data;
  }
}

class Detections {
  int? id;
  String? detectionType;
  String? detectionTypeDisplay;
  double? timestamp;
  List<Frames>? frames;

  Detections({
    this.id,
    this.detectionType,
    this.detectionTypeDisplay,
    this.timestamp,
    this.frames,
  });

  Detections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    detectionType = json['detection_type'];
    detectionTypeDisplay = json['detection_type_display'];
    timestamp = json['timestamp'];
    if (json['frames'] != null) {
      frames = <Frames>[];
      json['frames'].forEach((v) {
        frames!.add(Frames.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['detection_type'] = detectionType;
    data['detection_type_display'] = detectionTypeDisplay;
    data['timestamp'] = timestamp;
    if (frames != null) {
      data['frames'] = frames!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Frames {
  String? frameImage;

  Frames({this.frameImage});

  Frames.fromJson(Map<String, dynamic> json) {
    frameImage = json['frame_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['frame_image'] = frameImage;
    return data;
  }
}