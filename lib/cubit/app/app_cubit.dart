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

  void uploadVideo(String path) {
    emit(VideoUploadInProgress(0));

    _videoService
        .postVideo(
          path,
          onProgress: (progress) {
            emit(VideoUploadInProgress(progress));
          },
        )
        .then((response) {
          if (response != null && response.data != null) {
            _id = response.data['id'];
            getReport();
          }
          emit(VideoUploadSuccess());
        })
        .catchError((error) {
          emit(VideoUploadFailure(error.toString()));
        });
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