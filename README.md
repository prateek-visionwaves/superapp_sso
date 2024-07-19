# Enabling SSO in Mini Apps on Super App

For publishing apps on Super App, some apps may require Single Sign-On (SSO) for seamless authentication in mini apps using Super App authentication credentials. This document provides a step-by-step procedure to enable SSO in mini apps.

## Add SuperApp SSO to your app
add superapp_sso in under dependencies in pubspec.yaml file of your flutter project

```yaml
dependencies:
    superapp_sso
```

## Contents

- [SSO Library (superapp_sso)](#sso-library-superapp_sso)
- [Implementation](#implementation)
- [Examples](#examples)

## SSO Library

We are providing a Flutter package `superapp_sso` that offers a way to implement SSO in mini apps. This package contains the following:

- `SsoScreen` Class
- `EnableSSO` Mixin

### SsoScreen Class

This abstract class provides a basic UI for the SSO screen with a button "Login with SuperApp". This class has the following fields and functions:

- `title` of type `String`
- `content` of type `String`
- `onLogin` function with `void` return type

### EnableSSO Mixin

This mixin provides an abstract method `loginWithSSO` that can be called to log in with Super App credentials by passing `access_token` to the method.

## Implementation

To enable SSO in a mini application from the Super App, developers need to extend some classes and mixins and override some methods to change their existing login functionality.

### SSO Screen

When a mini app is launched from the Super App, it should show the SSO login screen instead of the old login screen. To achieve this behavior, the old login screen must be replaced with a new SSO screen that extends from the `SsoScreen` abstract class.

```dart
import 'package:flutter/material.dart';
import 'package:superapp_sso/superapp_sso.dart';

class LoginScreen extends SsoScreen {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: onLogin,
              child: Text('Login with SuperApp'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onLogin() {
    // Your logic here
    print('Login with SuperApp button pressed');
  }
}
```

 

### EnableSSO 

While working on MVC we often use repository to interact with database and Api calls (Business logic), so there must be a method of login with SSO in your Authentication repository. To get this method in your repository just create the repository using EnableSSO mixin. 

 
```dart
import 'package:superapp_sso/superapp_sso.dart'; 
 
class AuthRepository with EnableSSO{ 
@override 
loginWithSSO(String token) { 
        // your logic here 
    } 
}
```
 

 