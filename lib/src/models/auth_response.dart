import '../utils/enums.dart';

class AuthResponse {
  final LoginStatus loginStatus;
  final String email;
  final String profilePic;
  final String firstName;
  final String lastName;
  final String error;
  final String authCode;

  AuthResponse(
      {required this.loginStatus,
      required this.profilePic,
      required this.firstName,
      required this.lastName,
      required this.error,
      required this.email,
      required this.authCode});
}
