import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _image = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(40)),
            child: Image.network(
              'http://s3-alpha-sig.figma.com/img/be05/13ef/06d6025905c1789b05c60502c53e8043?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=GYj7YXRbmy0hCd5CFQubLeVOnltoSWkT7BGakF0sxLFCmelSc2VaUl5NFWPa4-xHqq~7c7onqu0gfWLEBVJmIosSiXPJ7W2PeU-XNk~1kwbiSlPwTaqQAXNKBNzncy6XRnnKfTg1qM85Oy0I0gAfirB-kX6yF3-~RU~qxh7GzvPipHU5wDdzl2zEgvCdERuFx~bYM3~S1tJfiRPq-GR3T13S7sMUoRB9sx1bJP-XXuRTqCEk3wUPHD2Fzvl4WBk3tKYwU5kw2dVvMsPNp6Nz43rSR5M4-0YD7eUytVcyC1Dk5yPCxoeDslyns31o38fggglA3ncrTZgcGV7bHQB8ug__',
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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 23),
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
                          child: Image.network(
                            'https://s3-alpha-sig.figma.com/img/b703/f428/6bd4dd45770a11c9fdeffdf766095fd4?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=sev5FsG9QhV7B9SBByhYjwdic5Rj3X6L2~r4upZfQAnjPBN8xKvbxmoFBgzBzTP4yzHUpG4zCq5fwl0UiFVyGDZBT43EFZjOdr-mbwO71jZAUD4HJnJMnYwC3sMP91N2KCylFjUD3eInzLkFR4zrscvOmuFiuSaQI3owprsrkGmhFWQWDo7Nu0fzGnnm9Ieh2CTujytcJGDqVbthZcf~71oMCY9-fzE2PV69NEjQOBACSfKWZjn2AP5O3ax8GounlWiasv9TzjHVgHm2GDcIK67rg7Glirmq3tdZ8yqDfnt0gSMxtrj9pR1WAd2wsoaOE9T~fJ7kvN9QgKQul9h9EA__',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 62,
                    ),
                    const Text(
                      "Looking for camera",
                      style: TextStyle(color: Color(0xffBFBFBF), fontSize: 16),
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
                  onPressed: ()async {
                    ImagePicker imagePicker = ImagePicker();
                    XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
                    if (image!= null) {
                      setState(() {
                        _image = image.path;
                      });
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
            )
            // Center(
            //   child: FloatingActionButton(
            //     shape: const CircleBorder(),
            //     onPressed: () async{
            //       ImagePicker imagePicker = ImagePicker();
            //       XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
            //       if (image != null) {
            //         setState(() {
            //           _image = image.path;
            //         });
            //       }
            //     },
            //     backgroundColor: Colors.red,
            //     child: const Icon(Icons.circle, color: Colors.white, size: 30),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}


















//  ImagePicker imagePicker = ImagePicker();
//                   XFile? image =
//                       await imagePicker.pickImage(source: ImageSource.camera);
//                   if (image != null) {
//                     setState(() {
//                       _image = image.path;
//                     });
//                   }