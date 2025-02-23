import 'package:flutter/material.dart';
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 57),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        'https://s3-alpha-sig.figma.com/img/7462/1c98/b1ba8f98db067b02c9e4fd7b294fbb80?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=pZDunc-z7AUWmNKpzo8GuA4938CxXeNh1Aj~aiEantRRJRmjeqNi0H~22K6zQl9JM7P7CeRQfNUTzHFkFNgqwmcs96a77vPpkeZwi1r9k8wvZsN2QFVMGS790THTEXPKND68Vu5eThznvAJhrHM43pHKjOUkKc5o02lGKrOPPJBRIIEBv77rcWZ13IFY4eEb0hWUegwlCHMZBUtq5koU8D4ClthPGMy8jIwOK56qUY8lQbejolEyQC3dzuOQrwSBs~AneoaeFAQX~KAuBaX7po3qczkHoX0Xrn-5HP-cpMaADxhHysqi0Pj~pjTY6hzIbzzThFnIqlH2ThVbj2Exxw__',
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          borderRadius: BorderRadius.circular(
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
                                              ? const Icon(Icons.visibility_off)
                                              : const Icon(Icons.visibility),
                                        )),
                                    obscureText: _isObscure,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
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
                                        if (_formKey.currentState!.validate()) {
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
                                            color: Colors.white, fontSize: 16),
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
                                  child: Image.network(
                                      'https://s3-alpha-sig.figma.com/img/c331/82c0/0d8219852566c2fee5a9b222b1e8fb9f?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=ODMOe9Te1rgCIbhAHlUYGp9FtzXCD5qlbw~NpeJy0fEGyQ08yfgjKPws1~f20ze3jwtPkjCkgKfiil1aw-6EtleO0i-FTri8GybJ~yR16wRdKFNa3wnFz-doKGQ9e6tdyJIPBsoSuG1gnSyPLLnR7fY1E2AqS2nCQUrit-juYpwzQw8nzmNLozi6JIF7cXn5aIPDxr4dntVA8jpXi83pOjwQNdhACRU8W8-wdGG-0vJAZZWc3M8vSGHHg7h1JF8a~~rrCXX~oWhszfOAR5aSa5se5QLx5xDblLdrVHm7bZvDiKzycaaqTA4l0YjRTL6jc4iQLRtN02FxEGX~p0trHg__'),
                                ),
                                const SizedBox(
                                  width: 31,
                                ),
                                SizedBox(
                                  width: 25,
                                  height: 25,
                                  child: Image.network(
                                      'https://s3-alpha-sig.figma.com/img/094b/0127/d702b288dda138bbfa9dfa85f7971b59?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=pjRj4wPckkqk7Gz3VLyYEGT3JDYqPDHqfs~WRxBB3vUyW5wwwRM~Z5wWdhrEu8a5NP-3N7Qp4z5Ec-RRroUlisIIWHGkHax0ONGL7ppRzmpV6jx2btspjujsnGd7fbJfzyLR9woHrWhdisZ7RPyqkK2Yybquqi8Nns7iwvzD2GpNoHF9P8bCUNmZ5bnX-wF5Hi3IX1~2nCUU8RYgqk6GUQkFhHrwCTJ~5I7cYgkmkkJj7JqPNjetAGgAqJRKh5Zpkdbl4OcQ25UfRe8ksGZu9knE-t6u3KwD~qiIZiP47nG7RLKZx5PpTEY15amciBaQCujGadSFYWFj~OgwJzBmdw__'),
                                ),
                                const SizedBox(
                                  width: 31,
                                ),
                                SizedBox(
                                  width: 25,
                                  height: 25,
                                  child: Image.network(
                                      'https://s3-alpha-sig.figma.com/img/c9fc/30c0/e4aaa1cea757b5f9c9f3f0726732f587?Expires=1740355200&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=hJixymaJ8~9lY40DfIzWjpcSvtiHYw2sgREDMHljaBmXc4fhkWylS8fTLxE99mNYnDtzH8u3fFMA6A0h9w0EzSIfpbsw9Tx1MhbuPAjK4905iKrGc1qlgAbs835u1r0dN0MZunUaLYJyf6OkK7LP-R7ckrUGWYSzV5wcwk9s-ZyPIUwBeJJzGemtOyA9Sb8Wz9mCbQKiHASQlnfDV8ZKNVN~ycTm9nAP6Vc1EBMD1RorjUBlzpOXY40-U8eiWo3EsfLlSGyRsr~i3Rf7TY0CgMb2Gna4Y3baZIjVdQLZo~G-x~lROLh-hVPaNAM1zj49lKEOfvGUFU38HUt11VT67Q__'),
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
                                        builder: (_) => const SignUpScreen(),
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
  }
}
