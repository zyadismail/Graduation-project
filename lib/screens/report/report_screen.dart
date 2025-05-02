import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubit/app/app_cubit.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String baseUrl = 'https://7c85-197-37-157-78.ngrok-free.app';
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        if (state is ReportSuccess) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "ReportScreen",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
     
            ),
            body: RefreshIndicator(
              onRefresh: () {
                return cubit.refreshReport();
              },
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Video",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "ID:${cubit.reportModel?.video?.id ?? 'N/A'}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "submitted_at:${cubit.reportModel?.video?.submittedAt ?? 'N/A'}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "processed:${cubit.reportModel?.video?.processed ?? false}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "processing_started: ${cubit.reportModel?.video?.processingStarted ?? false}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Card(
                      margin: const EdgeInsets.only(right: 80, left: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Video Info",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "harassment_detected:${cubit.reportModel?.video?.harassmentDetected ?? false}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              "face_contact_count:${cubit.reportModel?.video?.faceContactCount ?? 0}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              "body_contact_count:${cubit.reportModel?.video?.bodyContactCount ?? 0}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              "body_to_body_contact_count: ${cubit.reportModel?.video?.bodyToBodyContactCount ?? 0}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              "total_harassment_events: ${cubit.reportModel?.video?.totalHarassmentEvents ?? 0}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              "processing_time: ${cubit.reportModel?.video?.processingTime ?? 0}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              "video_duration: ${cubit.reportModel?.video?.videoDuration ?? 0}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              "lookAtMirrorCount: ${cubit.reportModel?.video?.lookAtMirrorCount ?? 0}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              "lookBackCount: ${cubit.reportModel?.video?.lookBackCount ?? 0}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 30),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cubit.reportModel!.detections!.length,
                      itemBuilder: (context, detectionIndex) {
                        final detection =
                            cubit.reportModel!.detections![detectionIndex];

                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Detections",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Text(
                                //   "ID : ${detection.id}",
                                //   style: const TextStyle(
                                //     fontSize: 15,
                                //     fontWeight: FontWeight.normal,
                                //   ),
                                // ),
                                const SizedBox(height: 7),
                                Text(
                                  "Detection Type: ${detection.detectionType ?? 'N/A'}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                // const SizedBox(height: 7),
                                // Text(
                                //   "Timestamp: ${detection.timestamp ?? 'N/A'}",
                                //   style: const TextStyle(
                                //     fontSize: 15,
                                //     fontWeight: FontWeight.normal,
                                //   ),
                                // ),
                                const SizedBox(height: 10),
                                if (detection.frames != null &&
                                    detection.frames!.isNotEmpty)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: detection.frames!
                                        .map(
                                          (frame) => Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (frame.frameImage != null)
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 8.0,
                                                  ),
                                                  child: Transform.rotate(
                                                    angle: 90 * 3.1415927 / 180,
                                                    child: Image.network(
                                                      "$baseUrl${frame.frameImage!.replaceFirst('file://', '')}",
                                                      height: 350,
                                                      width: 350,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        )
                                        .toList(),
                                  )
                                else
                                  const Text("No frames available."),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is Reportloading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          return const Scaffold(
            body: Center(child: Text("No Data")),
          );
        }
      },
    );
  }
}
