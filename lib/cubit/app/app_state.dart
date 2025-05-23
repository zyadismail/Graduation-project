part of 'app_cubit.dart';



@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

class VideoUploadInProgress extends AppState {
  final double progress;

  VideoUploadInProgress(this.progress);

  @override
  List<Object?> get props => [progress];
}

class VideoUploadSuccess extends AppState {}

class VideoUploadFailure extends AppState {
  final String error;

  VideoUploadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

final class Reportloading extends AppState {}

final class ReportSuccess extends AppState {}

final class ReportError extends AppState {
  final String message;
  ReportError(this.message);
}
