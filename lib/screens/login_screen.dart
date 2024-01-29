import 'package:flutter/material.dart';
import 'package:login/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  void _login(){
    final isValid = _formKey.currentState!.validate();
    if(!isValid){
      return;
    }

    //else login

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const  Text('Login'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 150.0,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                ),
                child: Center(
                  child: Image.asset("assets/images/login_icon.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      hintText: 'Enter valid mail id as abc@gmail.com'),
                  validator: (value) {
                    if (value!.isEmpty || 
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+") 
                          .hasMatch(value)) { 
                    return 'Enter a valid email!'; 
                  } 
                  return null;
                  },
                      
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your secure password'),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 6) { 
                    return 'Length of password shourd be 6 or more'; 
                  } 
                  return null;
                  },
                ),
              ),
              const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  elevation: 0,
                ),
                onPressed: () {
                  _login();
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 130,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('New User ?'),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpScreen()));
                    },
                    child: const Text("Create Account"),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
