import 'package:flutter/material.dart';

enum LoginMethods { GOOGLE, FACEBOOK, APPLE }
enum LoginMethodsOrientation { VERTICAL_DEFAULT, VERTICAL_CUSTOM, HORIZONTAL }
enum VERTICAL { DEFAULT, CUSTOM }

class LoginScreen extends StatefulWidget {
  final AppBar? appBar;
  final Color? bodyColor;
  final Widget? loginHeader;
  final TextFormField? inputField1;
  final TextFormField? inputField2;
  final Widget? loginButton;
  final Widget? googleLoginButton;
  final Widget? facebookLoginButton;
  final Widget? appleLoginButton;
  final Widget? signUp;
  final List<LoginMethods>? loginMethods;
  final TextEditingController? loginInputField1Controller;
  final TextEditingController? loginInputField2Controller;
  final void Function(String)? onloginInputField1Change;
  final void Function(String)? onloginInputField2Change;
  final void Function(String inp1, String inp2)? onLoginButtonClick;
  final void Function()? signUpCallback;
  final LoginMethodsOrientation? loginMethodsOrientation;

  LoginScreen({
    Key? key,
    this.appBar,
    this.bodyColor,
    this.loginHeader,
    this.inputField1,
    this.inputField2,
    this.loginButton,
    this.googleLoginButton,
    this.facebookLoginButton,
    this.appleLoginButton,
    this.signUp,
    this.loginMethods,
    this.loginInputField1Controller,
    this.loginInputField2Controller,
    this.onloginInputField1Change,
    this.onloginInputField2Change,
    this.onLoginButtonClick,
    this.signUpCallback,
    this.loginMethodsOrientation = LoginMethodsOrientation.VERTICAL_DEFAULT,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  AppBar defaultAppBar() {
    return AppBar(
      title: const Text("Login"),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  Widget defaultLoginHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Welcome Back",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
      ],
    );
  }

  Widget defaultInputField1() {
    return TextFormField(
      autofocus: true,
      controller: widget.loginInputField1Controller,
      onChanged: widget.onloginInputField1Change,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail, color: Theme.of(context).primaryColor),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email Address",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }

  Widget defaultInputField2() {
    return TextFormField(
      autofocus: false,
      controller: widget.loginInputField2Controller,
      onChanged: widget.onloginInputField2Change,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.key, color: Theme.of(context).primaryColor),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }

  Widget defaultLoginButton() {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Theme.of(context).primaryColor,
      child: MaterialButton(
        onPressed: () {
          if (validation(context)) {
            if (widget.onLoginButtonClick != null) {
              widget.onLoginButtonClick!(
                  widget.loginInputField1Controller!.text,
                  widget.loginInputField2Controller!.text);
            }
          }
        },
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        child: const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget defaultGoogleLoginButton() {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.red,
      child: MaterialButton(
        onPressed: () {},
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        child: const Text(
          "Login with Google",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget defaultFacebookLoginButton() {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue.shade900,
      child: MaterialButton(
        onPressed: () {},
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        child: const Text(
          "Login with Facebook",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget defaultAppleLoginButton() {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
        onPressed: () {},
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        child: const Text(
          "Login with Apple",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget defaultGoogleLoginButton2() {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () {},
      tooltip: 'Google',
      child: Icon(Icons.g_mobiledata_outlined, color: Colors.red),
    );
  }

  Widget defaultFacebookLoginButton2() {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () {},
      tooltip: 'Facebook',
      child: Icon(Icons.facebook, color: Colors.blue.shade900),
    );
  }

  Widget defaultAppleLoginButton2() {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () {},
      tooltip: 'Apple',
      child: const Icon(Icons.apple, color: Colors.black),
    );
  }

  Widget defaultSignUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Don't have an account?",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        GestureDetector(
          onTap: () {
            if (widget.signUpCallback != null) {
              widget.signUpCallback!();
            }
          },
          child: const Text(
            "SignUp",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  bool validation(context) {
    if (widget.loginInputField1Controller!.text.trim().isEmpty &&
        widget.loginInputField2Controller!.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Both fields are empty"),
          duration: Duration(seconds: 2),
        ),
      );
      setState(() {
        isLoading = false;
      });
    } else if (widget.loginInputField1Controller!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Empty Email"),
          duration: Duration(seconds: 2),
        ),
      );
      setState(() {
        isLoading = false;
      });
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(widget.loginInputField1Controller!.text.trim())) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid Email"),
          duration: Duration(seconds: 2),
        ),
      );
      setState(() {
        isLoading = false;
      });
    } else if (widget.loginInputField2Controller!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Empty Password"),
          duration: Duration(seconds: 2),
        ),
      );
      setState(() {
        isLoading = false;
      });
    } else if (widget.loginInputField2Controller!.text.trim().length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Require minimum 6 digits password"),
          duration: Duration(seconds: 2),
        ),
      );
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = true;
      });
      return true;
    }
    return false;
  }

  Widget defaultHorizontalLoginButtons(LoginMethodsOrientation orientation) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if ((widget.loginMethods?.contains(LoginMethods.GOOGLE) ?? false) &&
            orientation == LoginMethodsOrientation.HORIZONTAL)
          defaultGoogleLoginButton2(),
        if ((widget.loginMethods?.contains(LoginMethods.GOOGLE) ?? false) &&
            orientation == LoginMethodsOrientation.HORIZONTAL)
          const SizedBox(
            height: 20,
          ),
        if ((widget.loginMethods?.contains(LoginMethods.FACEBOOK) ?? false) &&
            orientation == LoginMethodsOrientation.HORIZONTAL)
          defaultFacebookLoginButton2(),
        if ((widget.loginMethods?.contains(LoginMethods.FACEBOOK) ?? false) &&
            orientation == LoginMethodsOrientation.HORIZONTAL)
          const SizedBox(
            height: 20,
          ),
        if ((widget.loginMethods?.contains(LoginMethods.APPLE) ?? false) &&
            orientation == LoginMethodsOrientation.HORIZONTAL)
          defaultAppleLoginButton2(),
      ],
    );
  }

  Widget defaultVerticalLoginButtons(LoginMethodsOrientation orientation) {
    if (orientation == LoginMethodsOrientation.VERTICAL_CUSTOM) {
      return Column(
        children: [
          if ((widget.loginMethods?.contains(LoginMethods.GOOGLE) ?? false) &&
              widget.googleLoginButton != null)
            widget.googleLoginButton ?? defaultGoogleLoginButton(),
          if ((widget.loginMethods?.contains(LoginMethods.GOOGLE) ?? false) &&
              widget.googleLoginButton != null)
            const SizedBox(
              height: 20,
            ),
          if ((widget.loginMethods?.contains(LoginMethods.FACEBOOK) ?? false) &&
              widget.facebookLoginButton != null)
            widget.facebookLoginButton ?? defaultFacebookLoginButton(),
          if ((widget.loginMethods?.contains(LoginMethods.FACEBOOK) ?? false) &&
              widget.facebookLoginButton != null)
            const SizedBox(
              height: 20,
            ),
          if ((widget.loginMethods?.contains(LoginMethods.APPLE) ?? false) &&
              widget.appleLoginButton != null)
            widget.appleLoginButton ?? defaultAppleLoginButton(),
          if ((widget.loginMethods?.contains(LoginMethods.APPLE) ?? false) &&
              widget.appleLoginButton != null)
            const SizedBox(
              height: 20,
            ),
        ],
      );
    }
    return Column(
      children: [
        if ((widget.loginMethods?.contains(LoginMethods.GOOGLE) ?? false) &&
            orientation == LoginMethodsOrientation.VERTICAL_DEFAULT)
          defaultGoogleLoginButton(),
        if ((widget.loginMethods?.contains(LoginMethods.GOOGLE) ?? false) &&
            orientation == LoginMethodsOrientation.VERTICAL_DEFAULT)
          const SizedBox(
            height: 20,
          ),
        if ((widget.loginMethods?.contains(LoginMethods.FACEBOOK) ?? false) &&
            orientation == LoginMethodsOrientation.VERTICAL_DEFAULT)
          defaultFacebookLoginButton(),
        if ((widget.loginMethods?.contains(LoginMethods.FACEBOOK) ?? false) &&
            orientation == LoginMethodsOrientation.VERTICAL_DEFAULT)
          const SizedBox(
            height: 20,
          ),
        if ((widget.loginMethods?.contains(LoginMethods.APPLE) ?? false) &&
            orientation == LoginMethodsOrientation.VERTICAL_DEFAULT)
          defaultAppleLoginButton(),
        if ((widget.loginMethods?.contains(LoginMethods.APPLE) ?? false) &&
            orientation == LoginMethodsOrientation.VERTICAL_DEFAULT)
          const SizedBox(
            height: 20,
          ),
      ],
    );
  }

  Widget loginMethodsOrientation(LoginMethodsOrientation orientation) {
    if (orientation == LoginMethodsOrientation.HORIZONTAL) {
      return defaultHorizontalLoginButtons(orientation);
    }
    return defaultVerticalLoginButtons(orientation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.bodyColor ?? Colors.white,
      appBar: widget.appBar ?? defaultAppBar(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 80,
                    ),
                    widget.loginHeader ?? defaultLoginHeader(),
                    const SizedBox(
                      height: 40,
                    ),
                    widget.inputField1 ?? defaultInputField1(),
                    const SizedBox(
                      height: 30,
                    ),
                    widget.inputField2 ?? defaultInputField2(),
                    const SizedBox(
                      height: 30,
                    ),
                    widget.loginButton ?? defaultLoginButton(),
                    const SizedBox(
                      height: 20,
                    ),
                    loginMethodsOrientation(widget.loginMethodsOrientation!),
                    const SizedBox(
                      height: 20,
                    ),
                    widget.signUp ?? defaultSignUp(),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
