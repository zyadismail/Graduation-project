// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String? _image = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions:  [
//           Container(
//             padding: const EdgeInsets.all(3),
//             height: 30,
//             width: 30,
//             decoration: BoxDecoration(
//                 color: Colors.grey[400],
//                 borderRadius: BorderRadius.circular(40)),
//             child: Image.asset(
//               'assets/images/ring.png',
//             ),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Hi, Dear!',
//               style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w400,
//                   color: Color(0xff7F7F7F)),
//             ),
//             const Text(
//               'Be sure of your safety',
//               style: TextStyle(
//                 color: Color(0xff4EB7D9),
//                 fontSize: 20,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             const SizedBox(
//               height: 56,
//             ),
//             Container(
//               alignment: Alignment.center,
//               height: 230,
//               width: 361,
//               decoration: BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 13, vertical: 23),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           width: 72,
//                           height: 18,
//                           decoration: BoxDecoration(
//                               color: Colors.grey,
//                               borderRadius: BorderRadius.circular(20)),
//                           child: const Text(
//                             'Connecting',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w400,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 14,
//                         ),
//                         Container(
//                           width: 8,
//                           height: 8,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(4),
//                             color: Colors.red,
//                           ),
//                         ),
//                         const Spacer(),
//                         SizedBox(
//                           height: 25,
//                           width: 25,
//                           child: Image.asset(
//                             "assets/images/camera.png",
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 62,
//                     ),
//                     const Text(
//                       "Looking for camera",
//                       style: TextStyle(color: Color(0xffBFBFBF), fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 71,
//             ),
//             Center(
//               child: SizedBox(
//                 height: 51,
//                 width: 166,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                   ),
//                   onPressed: () async {
//                     ImagePicker imagePicker = ImagePicker();
//                     XFile? image =
//                         await imagePicker.pickImage(source: ImageSource.camera);
//                     if (image != null) {
//                       setState(() {
//                         _image = image.path;
//                       });
//                     }
//                   },
//                   child: const Text(
//                     "Let's Start",
//                     style: TextStyle(
//                         color: Color(0xff70ABD3),
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_project/screens/contact_details/camera_screen.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _videoPath;
  VideoPlayerController? _videoController;
  bool _isPlaying = false;

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  Future<void> _initializeVideo(String path) async {
    _videoController = VideoPlayerController.file(File(path));
    await _videoController!.initialize();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            padding: const EdgeInsets.all(3),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(40)),
            child: Image.asset(
              'assets/images/ring.png',
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hi, Dear!',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff7F7F7F)),
            ),
            const Text(
              'Be sure of your safety',
              style: TextStyle(
                color: Color(0xff4EB7D9),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 56,
            ),
            Container(
              alignment: Alignment.center,
              height: 230,
              width: 361,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: _videoController?.value.isInitialized ?? false
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: AspectRatio(
                            aspectRatio: _videoController!.value.aspectRatio,
                            child: VideoPlayer(_videoController!),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _isPlaying = !_isPlaying;
                              _isPlaying
                                  ? _videoController!.play()
                                  : _videoController!.pause();
                            });
                          },
                          icon: Icon(
                            _isPlaying ? Icons.pause : Icons.play_arrow,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 23),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 72,
                                height: 18,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Text(
                                  'Connecting',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 14,
                              ),
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.red,
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                height: 25,
                                width: 25,
                                child: Image.asset(
                                  "assets/images/camera.png",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 62,
                          ),
                          const Text(
                            "Looking for camera",
                            style: TextStyle(
                                color: Color(0xffBFBFBF), fontSize: 16),
                          ),
                        ],
                      ),
                    ),
            ),
            const SizedBox(
              height: 71,
            ),
            Center(
              child: SizedBox(
                height: 51,
                width: 166,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    final videoPath = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CameraScreen(),
                      ),
                    );
                    if (videoPath != null) {
                        setState(() {
                          _videoPath = videoPath;
                        });
                        await _initializeVideo(videoPath);
                      }
                  },
                  child: const Text(
                    "Let's Start",
                    style: TextStyle(
                        color: Color(0xff70ABD3),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
