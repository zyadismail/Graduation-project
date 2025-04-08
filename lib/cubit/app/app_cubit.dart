import 'package:bloc/bloc.dart';
import 'package:graduation_project/service/dio.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this._videoService) : super(AppInitial());
  final VideoService _videoService;

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
}
