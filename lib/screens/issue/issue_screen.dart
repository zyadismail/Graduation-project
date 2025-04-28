import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubit/auth/auth_cubit.dart';
import 'package:graduation_project/models/issue_model.dart';

class IssueScreen extends StatefulWidget {
  const IssueScreen({super.key});

  @override
  State<IssueScreen> createState() => _IssueScreenState();
}

class _IssueScreenState extends State<IssueScreen> {
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _issueController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff70ABD3),
      appBar: AppBar(
        backgroundColor: const Color(0xff70ABD3),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/image_no_bg.png',
                  height: 200,
                  width: 226,
                  fit: BoxFit.fill,
                ),
                const Text(
                  "CONTACT US",
                  style: TextStyle(
                    color: Color(0xffE6E6E6),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Register your issue and one of our customer\n service agent will contact you.",
                  style: TextStyle(
                      color: Color(0xffE6E6E6),
                      fontWeight: FontWeight.w700,
                      fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 42,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 35,
                    right: 35,
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: const TextStyle(color: Color(0xffBFBFBF)),
                          labelText: "Phone",
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xff4EB7D9)),
                              borderRadius: BorderRadius.circular(
                                10,
                              )),
                        ),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Please enter your phone';
                        //   }
                        //   return null;
                        // },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: const TextStyle(color: Color(0xffBFBFBF)),
                          labelText: "email",
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xff4EB7D9)),
                              borderRadius: BorderRadius.circular(
                                10,
                              )),
                        ),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Please enter your phone';
                        //   }
                        //   return null;
                        // },
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      TextFormField(
                        controller: _issueController,
                        keyboardType: TextInputType.text,
                        maxLines: 6,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelStyle: const TextStyle(color: Color(0xffBFBFBF)),
                          labelText: "Issu",
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xff4EB7D9)),
                              borderRadius: BorderRadius.circular(
                                10,
                              )),
                        ),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Please enter your phone';
                        //   }
                        //   return null;
                        // },
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      SizedBox(
                        width: 130,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffD9D9D9)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().sendIssue(
                                    IssueModel(
                                      phone: _phoneController.text,
                                      email: _emailController.text,
                                      issue: _issueController.text,
                                    ),
                                  );

                              var snackBar = const SnackBar(
                                elevation: 0.0,
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  title: 'Issue Sent Successfully',
                                  contentType: ContentType.success,
                                  message:
                                      "we will Take the action With the captan ",
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(snackBar);
                              _phoneController.text = "";
                              _emailController.text = "";
                              _issueController.text = "";
                            }
                          },
                          child: const Text('Send issue'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
