// import 'package:bloc/bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/models/report_model.dart';
// import 'package:graduation_project/service/dio.dart';
// import 'package:meta/meta.dart';

// part 'app_state.dart';

// class AppCubit extends Cubit<AppState> {
//   AppCubit(this._videoService) : super(AppInitial());
//   final VideoService _videoService;
//   ReportModel? reportModel;
//   static AppCubit get(context) => BlocProvider.of(context);
//   int? _id;



//     void uploadVideo(String path) {
//     emit(VideoUploadInProgress(0));

//     _videoService
//         .postVideo(
//           path,
//           onProgress: (progress) {
//             emit(VideoUploadInProgress(progress));
//           },
//         )
//         .then((response) {
//           if (response != null && response.data != null) {
//             _id = response.data['id'];
//             getReport(); 
//           }
//           emit(VideoUploadSuccess());
//         })
//         .catchError((error) {
//           emit(VideoUploadFailure(error.toString()));
//         });
//   }

//   void getReport() async {
//     emit(Reportloading());
//     await _videoService.getReport(
//       id: _id!,
//     ).then((value) {
//       reportModel = ReportModel.fromJson(value.data);
//       emit(ReportSuccess());
//     }).catchError((error) {
//       emit(ReportError(error.toString()));
//     });
//   }
// }




import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/report_model.dart';
import 'package:graduation_project/service/dio.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this._videoService) : super(AppInitial());

  final VideoService _videoService;
  ReportModel? reportModel;
  static AppCubit get(context) => BlocProvider.of(context);

  int? _id;

  // void uploadVideo(String path) {
  //   emit(VideoUploadInProgress(0));

  //   _videoService
  //       .postVideo(
  //         path,
  //         onProgress: (progress) {
  //           emit(VideoUploadInProgress(progress));
  //         },
  //       )
  //       .then((response) {
  //         if (response != null && response.data != null) {
  //           _id = response.data['id'];
  //           getReport();
  //         }
  //         emit(VideoUploadSuccess());
  //       })
  //       .catchError((error) {
  //         emit(VideoUploadFailure(error.toString()));
  //       });
  // }


  void uploadVideo(String path) async {
    emit(VideoUploadInProgress(0));

    try {
      final response = await _videoService.postVideo(
        path,
        onProgress: (progress) {
          emit(VideoUploadInProgress(progress * 100));
        },
      );

      if (response != null && response.data != null) {
        _id = response.data['id'];
        getReport();
        emit(VideoUploadSuccess());
      } else {
        emit(VideoUploadFailure(path.toString()));
      }
    } catch (error) {
      emit(VideoUploadFailure(error.toString()));
    }
  }

  void getReport() async {
    if (_id == null) return;
    
    emit(Reportloading());
    await _videoService.getReport(
      id: _id!,
    ).then((value) {
      reportModel = ReportModel.fromJson(value.data);
      emit(ReportSuccess());
    }).catchError((error) {
      emit(ReportError(error.toString()));
    });
  }

  void refreshReport() {
    if (_id != null) {
      getReport();
    }
  }


}



// import 'package:bloc/bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pro34/cubit/app_cubit/app_state.dart';
// import 'package:pro34/models/Report_model.dart';
// import 'package:pro34/services/video_service.dart';

// class AppCubit extends Cubit<AppState> {
//   AppCubit(this._videoService) : super(AppInitial());

//   final VideoService _videoService;
//   ReportModel? reportModel;
//   int? _videoId;
//   static AppCubit get(context) => BlocProvider.of(context);

//   void uploadVideo(String path) {
//     emit(VideoUploadInProgress(0));

//     _videoService
//         .postVideo(
//           path,
//           onProgress: (progress) {
//             emit(VideoUploadInProgress(progress));
//           },
//         )
//         .then((response) {
//           if (response != null && response.data != null) {
//             _videoId = response.data['id'];
//             getReport(); // Automatically get report after successful upload
//           }
//           emit(VideoUploadSuccess());
//         })
//         .catchError((error) {
//           emit(VideoUploadFailure(error.toString()));
//         });
//   }

//   Future<void> getReport() async {
//     if (_videoId == null) {
//       emit(ReportError("No video ID available"));
//       return;
//     }

//     emit(Reportloading());

//     try {
//       final response = await _videoService.getReport(videoId: _videoId!);
//       reportModel = ReportModel.fromJson(response.data);
//       emit(ReportSuccess());
//     } catch (error) {
//       emit(ReportError(error.toString()));
//     }
//   }

//   Future<void> _waitForProcessing(int videoId) async {
//     bool isReady = false;

//     while (!isReady) {
//       final response = await _videoService.getReport(videoId: videoId);

//       if (response.statusCode == 200) {
//         final data = response.data;

//         if (data['status'] == 'processed') {
//           isReady = true;
//           print('Report is ready!');
//         } else {
//           print('Still processing...');
//           await Future.delayed(const Duration(seconds: 2));
//         }
//       } else {
//         throw Exception('Failed to fetch report');
//       }
//     }
//   }
// }