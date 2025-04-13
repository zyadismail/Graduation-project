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


  void uploadVideo(String path) {
    emit(VideoUploadInProgress(0));

    _videoService.postVideo(
      path,
      onProgress: (progress) {
        emit(VideoUploadInProgress(progress));
      },
    ).then((response) {
      emit(VideoUploadSuccess());
    }).catchError((error) {
      emit(VideoUploadFailure(error.toString()));
    });
  }

  void getReport() async {
    emit(Reportloading());
    await _videoService.getReport(

    ).then((value){
      reportModel = ReportModel.fromJson(value.data);
      emit(ReportSuccess());
    }
   
    ).catchError((error){
      emit(ReportError(error.toString()));
    });
  }
}
