import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubit/app/app_cubit.dart';
import 'package:graduation_project/cubit/auth/auth_cubit.dart';
import 'package:graduation_project/firebase_options.dart';
import 'package:graduation_project/screens/layout/lay_out_screen.dart';
import 'package:graduation_project/screens/sign_in/sign_in_screen.dart';
import 'package:graduation_project/service/dio.dart';
import 'package:permission_handler/permission_handler.dart';
late List<CameraDescription> cameras;

Future<void> requestCameraPermission() async {
  var status = await Permission.camera.status;
  if (!status.isGranted) {
    await Permission.camera.request();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await requestCameraPermission();
  cameras = await availableCameras();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
    final videoService = VideoService();


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => AppCubit(videoService),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const LayoutScreen();
            } else {
              return const SignInScreen();
            }
          },
        ),
      ),
    );
  }
}
