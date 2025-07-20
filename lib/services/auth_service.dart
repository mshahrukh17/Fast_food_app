import 'package:fastfood_app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:fastfood_app/utils/exceptions/firebase_exceptions.dart';
import 'package:fastfood_app/utils/exceptions/format_exceptions.dart';
import 'package:fastfood_app/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';

import '../Export/AllExport.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> registerwithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw MyFormatException();
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again later.';
    }
  }

  Future<UserCredential> loginWithEmalAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw MyFormatException();
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again later.';
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw MyFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MyFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw MyFormatException();
    } on PlatformException catch (e) {
      throw MyPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, please try again later.';
    }
  }
}
