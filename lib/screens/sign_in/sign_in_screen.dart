import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubit/auth/auth_cubit.dart';
import 'package:graduation_project/screens/layout/lay_out_screen.dart';
import 'package:graduation_project/screens/sign_up/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _agreeToTerms = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          backgroundColor: const Color(0xff6FAAD2),
          body: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                height: height,
                width: width,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 57),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            width: 57,
                            height: 57,
                          ),
                          const Text(
                            "Hello!",
                            style: TextStyle(
                                fontSize: 36,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          const Text(
                            'Welcome back you have been\n missed !',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Container(
                            height: height * 0.7,
                            width: width,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(70),
                                topRight: Radius.circular(70),
                              ),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 11),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Log in",
                                        style: TextStyle(
                                            fontSize: 36,
                                            color: Color(0xff70ABD3),
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const SizedBox(height: 14),
                                      const SizedBox(height: 13),
                                      TextFormField(
                                        controller: _emailController,
                                        decoration: InputDecoration(
                                          labelText: "Email",
                                          border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color(0xff4EB7D9)),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
                                              )),
                                        ),
                                      ),
                                      const SizedBox(height: 26),
                                      TextFormField(
                                        controller: _passwordController,
                                        decoration: InputDecoration(
                                            labelText: "Password",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  _isObscure = !_isObscure;
                                                });
                                              },
                                              icon: _isObscure
                                                  ? const Icon(
                                                      Icons.visibility_off)
                                                  : const Icon(
                                                      Icons.visibility),
                                            )),
                                        obscureText: _isObscure,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Forgot password ?",
                                            style: TextStyle(
                                              color: Color(0xff4EB7D9),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              cubit.login(
                                                email: _emailController.text,
                                                password:
                                                    _passwordController.text,
                                              );
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) =>
                                                      const LayoutScreen(),
                                                ),
                                                (route) => false,
                                              );
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xff70ABD3),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ),
                                          child: const Text(
                                            "Sign in",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: Divider(
                                      color: Colors.grey,
                                      thickness: 2,
                                    )),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text("or continue with"),
                                    SizedBox(
                                      width: 27,
                                    ),
                                    Expanded(
                                        child: Divider(
                                      color: Colors.grey,
                                      thickness: 2,
                                    )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 27,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: Image.asset(
                                        'assets/images/google.png',
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 31,
                                    ),
                                    SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: Image.asset(
                                        'assets/images/facebook.png'
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 31,
                                    ),
                                    SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: Image.asset(
                                        "assets/images/instgram.png",
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 35,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Don’t have an account?'),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                const SignUpScreen(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'Sign up',
                                        style: TextStyle(
                                          color: Color(0xff4EB7D9),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
