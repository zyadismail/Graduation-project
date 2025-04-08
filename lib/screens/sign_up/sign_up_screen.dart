import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubit/auth/auth_cubit.dart';
import 'package:graduation_project/screens/sign_up/widgets/custom_check_box.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _agreeToTerms = false;
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
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
                      padding: const EdgeInsets.symmetric(vertical: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            width: 57,
                            height: 57,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: containerTextFields(
                              height, width, context, cubit  , state ),
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

  Container containerTextFields(
      double height, double width, BuildContext context, AuthCubit cubit  , AuthState state ) {
    return Container(
      height: height * 0.85,
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
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Color(0xff70ABD3),
                        size: 20,
                      ),
                    ),
                    const Text(
                      "Back to login",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff70ABD3),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 9),
                const Text(
                  "Sign up",
                  style: TextStyle(
                      fontSize: 36,
                      color: Color(0xff70ABD3),
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          labelText: "First name",
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xff4EB7D9)),
                              borderRadius: BorderRadius.circular(
                                10,
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          labelText: "Last name",
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xff4EB7D9)),
                              borderRadius: BorderRadius.circular(
                                10,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 13),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff4EB7D9)),
                        borderRadius: BorderRadius.circular(
                          10,
                        )),
                  ),
                ),
                const SizedBox(height: 13),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Phone",
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff4EB7D9)),
                        borderRadius: BorderRadius.circular(
                          10,
                        )),
                  ),
                ),
                const SizedBox(height: 13),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
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
                const SizedBox(height: 13),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                      labelText: "Confirm password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCheckBox(
                        isChecked: _agreeToTerms,
                        onChecked: (value) {
                          setState(() {
                            _agreeToTerms = value;
                          });
                        }),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      child: Text.rich(TextSpan(
                        children: [
                          TextSpan(
                            text: 'I agree to the ',
                            style: TextStyle(
                                color: Color(0xff000000), fontSize: 12),
                          ),
                          TextSpan(
                            text: 'Terms and Conditions\n',
                            style: TextStyle(
                                color: Color(0xff4EB7D9),
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          TextSpan(
                            text: 'and ',
                            style: TextStyle(
                                color: Color(0xff000000), fontSize: 12),
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: Color(0xff4EB7D9),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 27,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() && _agreeToTerms) {
                        cubit.register(
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          email: _emailController.text,
                          phone: _phoneController.text,
                          password: _passwordController.text,
                          confirmPassword: _confirmPasswordController.text,
                        );
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            title: Text(state is RegisterSuccuess ? "Sign Up Success" : "SignUp Failed") ,
                            content: Icon(state is RegisterSuccuess ? Icons.fork_right : Icons.wrong_location),
                          );
                        },);
                        // Navigator.pushAndRemoveUntil(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (_) => const LayoutScreen()),
                        //   (route) => false,
                        // );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff70ABD3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text(
                      "Create account",
                      style: TextStyle(color: Colors.white, fontSize: 16),
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
                child: Image.asset('assets/images/facebook.png'),
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
        ],
      ),
    );
  }
}
