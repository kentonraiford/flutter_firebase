import 'package:flutter/material.dart';
import 'package:firebase/Auth/auth.dart';


class LoginPage extends StatefulWidget
{
  LoginPage({this.auth, this.onSignedIn}); //when creating a login page, pass in an instance of auth.
  final BaseAuth auth; //added a new member variable to LoginPage named auth
  final VoidCallback onSignedIn;


  @override
  State<StatefulWidget> createState() => _LoginPageState(); // => shorthand for braces and return value
}

enum FormType
{
  login,
  register
}

class _LoginPageState extends State<LoginPage> // _ means private
{
  final formKey = GlobalKey<FormState>(); //This allows us to access the form

  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool validateAndSave()
  {
    final form = formKey.currentState;
    if (form.validate())
      {
        form.save();
        print('form is valid. Email: $_email, Password: $_password.');
        return true;
      }
      else
        {
          print('form is invalid.  Email: $_email, Password: $_password.');
          return false;
        }
  }

  void validateAndSubmit() async
  {
    if (validateAndSave())
      {
        try
        {
          if (_formType == FormType.login)
          {
            String userId = await widget.auth.signInWithEmailAndPassword(_email, _password); // widget allows us to access the auth variable in LoginPage
            print('Signed in: $userId');
          }
          else
          {
            String userId = await widget.auth.createUserWithEmailAndPassword(_email, _password);
            print('Registered in: $userId');
          }

          widget.onSignedIn(); //Ensures root page can receive a message from the login page.
        }
        catch(e)
        {
          print('Error: $e');
        }
      }
  }

  void moveToRegister()
  {
    formKey.currentState.reset();
    setState(() // build method gets called again
    {
      _formType = FormType.register;
    });
  }

  void moveToLogin()
  {
    formKey.currentState.reset();
    setState(()
    {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Login Demo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0), //Add padding around container.
        child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, //Login button takes the full width
              children: buildInputs() + buildSubmitButtons(),
            )
        )
      ),
    );
  }


  List<Widget> buildInputs()
  {
    return
      [
        TextFormField(
          decoration:  InputDecoration(labelText: "Email"),
          validator: (value) => value.isEmpty ? "Email can\'t be empty" : null, //Gives us a value => if empty we say "email can't be empty." ? If there's a value, do nothing.
          onSaved: (value) => _email = value,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Password"),
          obscureText: true, //make text secret
          validator: (value) => value.isEmpty ? "Password can\'t be empty" : null,
          onSaved: (value) => _password = value,
        ),
      ];
  }

  List<Widget> buildSubmitButtons()
  {
    if (_formType == FormType.login)
    {
      return
      [
        RaisedButton(
          child: Text("Login", style: TextStyle(fontSize: 20)),
          onPressed: validateAndSubmit, //Give button action and enable it
        ),
        FlatButton(
          onPressed: moveToRegister,
          child: Text('Create an Account', style: TextStyle(fontSize: 20)),
        )
      ];
    }
    else
    {
      return
        [
          RaisedButton(
            child: Text("Create an Account", style: TextStyle(fontSize: 20)),
            onPressed: validateAndSubmit, //Give button action and enable it
          ),
          FlatButton(
            onPressed: moveToLogin,
            child: Text('Already have an account? Login', style: TextStyle(fontSize: 20)),
          )
        ];
    }
  }
}



