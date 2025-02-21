import 'package:flutter/material.dart';
import 'package:graduation_project/screens/sign_in/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}





// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ImagePickerScreen(),
//     );
//   }
// }

// class ImagePickerScreen extends StatefulWidget {
//   @override
//   _ImagePickerScreenState createState() => _ImagePickerScreenState();
// }

// class _ImagePickerScreenState extends State<ImagePickerScreen> {
//   File? _image;
//   final ImagePicker _picker = ImagePicker();

//   // Function to pick an image
//   Future<void> _pickImage(ImageSource source) async {
//     final pickedFile = await _picker.pickImage(source: source);

//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             // Circular Background (Bigger)
//             Container(
//               width: 90,
//               height: 90,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.red.shade200, // Larger background
//               ),
//             ),

//             // Floating Action Button
//             FloatingActionButton(
//               shape: const CircleBorder(),
//               onPressed: () {
//                 showModalBottomSheet(
//                   context: context,
//                   builder: (context) => buildBottomSheet(),
//                 );
//               },
//               backgroundColor: Colors.white,
//               child: _image == null
//                   ? const Icon(Icons.add_a_photo, color: Colors.red, size: 30)
//                   : ClipOval(
//                       child: Image.file(
//                         _image!,
//                         fit: BoxFit.cover,
//                         width: 50,
//                         height: 50,
//                       ),
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Bottom Sheet for Camera/Gallery Selection
//   Widget buildBottomSheet() {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       height: 160,
//       child: Column(
//         children: [
//           const Text("Choose Image From", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 15),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton.icon(
//                 onPressed: () => _pickImage(ImageSource.camera),
//                 icon: const Icon(Icons.camera),
//                 label: const Text("Camera"),
//               ),
//               ElevatedButton.icon(
//                 onPressed: () => _pickImage(ImageSource.gallery),
//                 icon: const Icon(Icons.photo_library),
//                 label: const Text("Gallery"),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
