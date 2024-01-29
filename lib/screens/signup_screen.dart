import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignUpScreen();
  }
}

class _SignUpScreen extends State {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  var _formKey = GlobalKey<FormState>();

  void _signup(String fullname,String age,String email,String password){
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
          title: const  Text('SignUp'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                  ),
                  child: Center(
                    child: Image.asset("assets/images/signup_icon.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: fullnameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Full Name'),
                    validator: (value) {
                      if (value!.isEmpty) { 
                      return 'Enter a valid name'; 
                    } 
                    return null;
                    },
                        
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Age',
                        hintText: 'Enter your age'),
                    validator: (value) {
                      if (value!.isEmpty || int.parse(value) <= 0 || int.parse(value) > 100) { 
                      return 'Enter valid age'; 
                    } 
                    return null;
                    },
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
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
               
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    elevation: 0,
                  ),
                  onPressed: () {
                    _signup(fullnameController.text,ageController.text,emailController.text,passwordController.text);
                  },
                  child: const Text(
                    "SignUp",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
//git config --global user.email "you@example.com"
 // git config --global user.name "Your Name"
//