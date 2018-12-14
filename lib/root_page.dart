import 'package:flutter/material.dart';
import 'package:firebase/Login/login_page.dart';
import 'package:firebase/Auth/auth.dart';
import 'package:firebase/Home/home_page.dart';

class RootPage extends StatefulWidget
{
  RootPage({this.auth});
  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => _RootPageState();
}

enum AuthStatus
{
  notSignedIn,
  signedIn
}

class _RootPageState extends State<RootPage>
{

  AuthStatus authStatus = AuthStatus.notSignedIn;

  @override
  void initState() //Not async method and is called before widget build is called.
  {
    super.initState();
    widget.auth.currentUser().then((userId)
    {
      setState(()
      {
        authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn; //if userId is nil then user is not signed in. Otherwise they are.
      });
    }); //When we get the current user then return userId
  }


  void _signedIn()
  {
    setState(()
    {
      authStatus = AuthStatus.signedIn;
    });
  }


  void _signedOut()
  {
    setState(()
    {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    switch (authStatus)
    {
      case AuthStatus.notSignedIn:
        return LoginPage(
          auth: widget.auth,
          onSignedIn: _signedIn,
        );

      case AuthStatus.signedIn:
        return HomePage(
          auth: widget.auth,
          onSignedOut: _signedOut,
        );
    }
  }
}