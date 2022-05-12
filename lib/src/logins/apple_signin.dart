import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../models/auth_response.dart';
import '../utils/enums.dart';

Future<AuthResponse> appleSignIn() async {
  LoginStatus loginStatus = LoginStatus.FAILED;
  String email = "";
  String profilePic = "";
  String firstName = "";
  String lastName = "";
  String error = "";
  String authCode = "";
  try {
    AuthorizationCredentialAppleID result =
        await SignInWithApple.getAppleIDCredential(scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ]);
    loginStatus = LoginStatus.SUCCESS;
    email = result.email ?? "";
    firstName = result.givenName?.split(" ").first ?? "";
    lastName = result.givenName?.replaceFirst(firstName, "").trim() ?? "";
    authCode = result.authorizationCode;
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
