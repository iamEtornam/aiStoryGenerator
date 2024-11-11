import 'package:ai_story_generator/home.dart';
import 'package:ai_story_generator/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController =
      TextEditingController(text: 'sunumacbright@gmail.com');
  final _passwordController = TextEditingController(text: '1234567890');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: AutofillGroup(
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.all(32.0),
            children: [
              SizedBox(height: 56.0),
              FlutterLogo(size: 100.0),
              SizedBox(height: 56.0),
              TextFormField(
                controller: _emailController,
                autofillHints: [AutofillHints.email],
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                autofillHints: [AutofillHints.password],
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24.0),
              TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await signinWithEmail(
                          _emailController.text, _passwordController.text);
                    }
                  },
                  child: SizedBox(
                      width: double.infinity,
                      child: Center(
                          child: Text('Login',
                              style: TextStyle(
                                color: Colors.white,
                              ))))),
              SizedBox(height: 15.0),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text('Don\'t have an account? Sign up'),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                ),
              ),
              SizedBox(height: 15.0),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                onPressed: () async => await signInWithGoogle(),
                child: SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Continue with Google'))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> signInWithGoogle() async {
    SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black);
    SVProgressHUD.show();
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.user != null && mounted) {
        await FirebaseAuth.instance.currentUser!
            .updateDisplayName(userCredential.user!.displayName!);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Home()), (route) => false);
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login Failed'),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      SVProgressHUD.dismiss();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$e'),
        ),
      );
    } finally {
      SVProgressHUD.dismiss();
    }
  }

  Future<void> signinWithEmail(String email, String password) async {
    SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black);
    SVProgressHUD.show();
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null && mounted) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Home()), (route) => false);
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login Failed'),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
print('$e');
      SVProgressHUD.dismiss();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$e'),
        ),
      );
    } finally {
      SVProgressHUD.dismiss();
    }
  }
}
