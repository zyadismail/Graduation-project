


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/cubit/app/app_cubit.dart';


// class ReportScreen extends StatelessWidget {
//   const ReportScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AppCubit, AppState>(
//       listener: (context, state) {
//       },
//       builder: (context, state) {
//         var cubit = AppCubit.get(context);
//         if (state is ReportSuccess) {
//           return Scaffold(
//             appBar: AppBar(
//               centerTitle: true,
//               title: const Text(
//                 "ReportScreen",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ),
//             body: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Card(
//                     margin: const EdgeInsets.only(left: 20, right: 20),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     elevation: 8,
//                     child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "ID:${cubit.reportModel!.id}",
//                             style: const TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Text(
//                             "submitted_at:${cubit.reportModel?.submittedAt}",
//                             style: const TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Text(
//                             "processed:${cubit.reportModel!.processed}",
//                             style: const TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Text(
//                             "processing_started: ${cubit.reportModel!.processingStarted}",
//                             style: const TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 50),
//                   Card(
//                     margin: const EdgeInsets.only(right: 80, left: 10),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     elevation: 8,
//                     child: Padding(
//                       padding: const EdgeInsets.all(30.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "harassment_detected:${cubit.reportModel!.harassmentDetected}",
//                             style: const TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Text(
//                             "face_contact_count:${cubit.reportModel!.faceContactCount}",
//                             style: const TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Text(
//                             "body_contact_count:${cubit.reportModel!.bodyContactCount}",
//                             style: const TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Text(
//                             "body_to_body_contact_count:${cubit.reportModel!.bodyToBodyContactCount}",
//                             style: const TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Text(
//                             "total_harassment_events:${cubit.reportModel!.totalHarassmentEvents}",
//                             style: const TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Text(
//                             "processing_time:${cubit.reportModel!.processingTime}",
//                             style: const TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Text(
//                             "video_duration:${cubit.reportModel!.videoDuration}",
//                             style: const TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         } else if (state is Reportloading) {
//           return const Center(child: CircularProgressIndicator());
//         } else {
//           return const Center(child: Text("No Data"));
//         }
//       },
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubit/app/app_cubit.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
      },
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
              actions: [
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    cubit.refreshReport();
                  },
                ),
              ],
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                cubit.refreshReport();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ID:${cubit.reportModel!.id}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "submitted_at:${cubit.reportModel?.submittedAt}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "processed:${cubit.reportModel!.processed}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "processing_started: ${cubit.reportModel!.processingStarted}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Card(
                      margin: const EdgeInsets.only(right: 80, left: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "harassment_detected:${cubit.reportModel!.harassmentDetected}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "face_contact_count:${cubit.reportModel!.faceContactCount}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "body_contact_count:${cubit.reportModel!.bodyContactCount}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "body_to_body_contact_count:${cubit.reportModel!.bodyToBodyContactCount}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "total_harassment_events:${cubit.reportModel!.totalHarassmentEvents}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "processing_time:${cubit.reportModel!.processingTime}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "video_duration:${cubit.reportModel!.videoDuration}",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
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