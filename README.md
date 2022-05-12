<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

## About getlogin

getlogin is an customizable login screen package. Which comes with the support of Normal SignIn, Google SignIn, Facebook SignIn, Apple SignIn.

## Features

Customize Login Screen
Normal SignIn Supported
Google SignIn Supported
Facebook SignIn Supported
Apple SignIn Supported
Customize AppBar
Customize Login Orientation
Customize Button
Customize Input Fields

## Getting started

Add getlogin to your pubspec.yaml file:
```dart
"dependencies:"
"get:"
```
Import get in files that it will be used:
```dart
import 'package:getlogin/getlogin.dart';
```

## Usage
```dart
    LoginScreen({
      // Provide Custom AppBar or it will use default
      AppBar? appBar,
      
      // Provide Custom BodyColor or it will use default as White
      Color? bodyColor,
      
      // Provide Custom loginHeader or it will use default as App Name
      // Here you can pass Widget with Logo and Title
      Widget? loginHeader,
      
      // Provide Custom TextInputField or it will use default
      TextFormField? inputField1,
      TextFormField? inputField2,
      
      // Provide Custom Declare Controller and assign here it will return response
      TextEditingController? loginInputField1Controller,
      TextEditingController? loginInputField2Controller,
      
      // Customize Login Button or it will use default as Buttons
      Widget? loginButton,
      Widget? googleLoginButton,
      Widget? facebookLoginButton,
      Widget? appleLoginButton,
      
      // Customize SignUp or it will use default as Text
      Widget? signUp,
      
      // Pass the required Login Methods such as [LoginMethods.GOOGLE, LoginMethods.FACEBOOK]
      // Default will be normal Login Method
      List<LoginMethods>? loginMethods,
      
      // InputFeild Change listerner for both 1 and 2 fields
      void Function(String)? onloginInputField1Change,
      void Function(String)? onloginInputField2Change,
      
      // LoginMethodsOrientations as VERTICAL_DEFAULT, VERTICAL_CUSTOM, HORIZONTAL
      // Horizontal Button will be Circular buttons
      LoginMethodsOrientation? loginMethodsOrientation = LoginMethodsOrientation.VERTICAL_DEFAULT,
      
      // SignUp Callback;
      void Function()? signUpCallback,
      
      // Normal Login Callback with inputField1 and inputField2 text;
      void Function(String, String)? onLoginButtonClick,
      
      // Google Login Callback with loginStatus,email,profilePic,firstName,lastName,error,authCode;
      void Function(AuthResponse)? googleLoginAuthResponse,
      
      // Facebook Login Callback with loginStatus,email,profilePic,firstName,lastName,error,authCode;
      void Function(AuthResponse)? facebookLoginAuthResponse,
      
      // Apple Login Callback with loginStatus,email,profilePic,firstName,lastName,error,authCode;
      void Function(AuthResponse)? appleLoginAuthResponse,
    });
'''

## Example
```dart
    import 'package:flutter/material.dart';
    import 'package:getlogin/getlogin.dart';
    
    class MyLoginScreen extends StatelessWidget {
      MyLoginScreen({Key? key}) : super(key: key);
    
      final TextEditingController loginInputField1 = TextEditingController();
      final TextEditingController loginInputField2 = TextEditingController();
    
      @override
      Widget build(BuildContext context) {
        return LoginScreen(
          loginInputField1Controller: loginInputField1,
          loginInputField2Controller: loginInputField2,
          loginMethods: const [LoginMethods.GOOGLE, LoginMethods.FACEBOOK],
          googleLoginAuthResponse: (val) {
            if (val.loginStatus == LoginStatus.SUCCESS) {
            
            } else {
            
            }
          },
        );
      }
    }
```
