import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/user_model.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  void register({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    emit(RegisterLoading());

    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      final user = value.user;
      if (user != null) {
        final newUser = UserModel(
          id: user.uid,
          fristName: firstName,
          lastName: lastName,
          email: user.email ?? "",
          phone: phone,
        );

        await _fireStore
            .collection("users")
            .doc(user.uid)
            .set(newUser.toJson());

        emit(RegisterSuccuess());
      }
    }).catchError((error) {
      if (error is FirebaseAuthException) {
        if (error.code == "weak-password") {
          emit(RegisterError(message: 'The password Provided is too Weak'));
        } else if (error.code == "email-already-in-use") {
          emit(RegisterError(message: 'The email is already in use'));
        } else {
          emit(
              RegisterError(message: "Authentication Failed ${error.message}"));
        }
      } else {
        emit(RegisterError(
            message: "An Unknown error occurred ${error.toString()}"));
      }
    });
  }

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(LoginSuccuess());
    }).catchError((e) {
      if (e is FirebaseAuthException) {
        if (e.code == "weak-password") {
          emit(
            LoginError(message: 'No user found for that email.'),
          );
        } else if (e.code == "wrong-password") {
          emit(
            LoginError(message: 'Wrong password provided for that user.'),
          );
        } else {
          emit(LoginError(message: "Authentication Failed ${e.message}"));
        }
      } else {
        emit(LoginError(message: "An Unknown error occured ${e.message}"));
      }
    });
  }
}
