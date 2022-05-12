import 'package:google_sign_in/google_sign_in.dart';

import '../models/auth_response.dart';
import '../utils/enums.dart';

Future<AuthResponse> googleSignIn() async {
  LoginStatus loginStatus = LoginStatus.FAILED;
  String email = "";
  String profilePic = "";
  String firstName = "";
  String lastName = "";
  String error = "";
  String authCode = "";
  try {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    GoogleSignInAccount? result = await _googleSignIn.signIn();
    if (result == null) {
      throw Exception("Some Error Occurred, Please Try Again Later.");
    }
    loginStatus = LoginStatus.SUCCESS;
    email = result.email;
    profilePic = result.photoUrl ?? "";
    firstName = result.displayName?.split(" ").first ?? "";
    lastName = result.displayName?.replaceFirst(firstName, "").trim() ?? "";
    authCode = result.serverAuthCode ?? "";
  } catch (e) {
    loginStatus = LoginStatus.FAILED;
    error = e.toString();
  }
  return AuthResponse(
    loginStatus: loginStatus,
    email: email,
    profilePic: profilePic,
    firstName: firstName,
    lastName: lastName,
    error: error,
    authCode: authCode,
  );
}

Future<bool> googleSignOut() async {
  try {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    bool isSignedIn = await _googleSignIn.isSignedIn();
    if (isSignedIn) {
      GoogleSignInAccount? result = await _googleSignIn.signOut();
      if (result == null) {
        throw Exception("Some Error Occurred, Please Try Again Later.");
      }
    }
    return true;
  } catch (e) {
    return false;
  }
}
