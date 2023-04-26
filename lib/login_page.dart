import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_getx_demo/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(

        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: loginController.emailController.value,
                decoration: InputDecoration(
                  hintText: 'Email'
                ),
              ),
               TextFormField(
                controller: loginController.passwordController.value,
                decoration: InputDecoration(
                  hintText: 'Password'
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Obx(() {
                return InkWell(
                onTap: () {
                  loginController.loginApi();
                },
                child: loginController.loading.value ? CircularProgressIndicator() : Container(
                  height: 30,
                  color: Colors.grey,
                  child: Center(
                    child: Text('Login'),
                  ),
                ),
              );
              },)

            ],
          ),
        ),
      )
      
    );
  }
}