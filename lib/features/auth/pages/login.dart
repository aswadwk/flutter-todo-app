import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/common/global_thme.dart';
import 'package:todo_app/features/auth/auth_service.dart';
import 'package:todo_app/features/auth/models/login_model.dart';
import 'package:todo_app/features/todo/todo.dart';
import 'package:todo_app/widgets/input_widget.dart';
import 'package:todo_app/widgets/button_widget.dart';
import 'package:todo_app/widgets/alert_widget.dart';
import 'package:todo_app/widgets/label_widget.dart';
import 'package:todo_app/widgets/loading_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formSignUp = GlobalKey<FormState>();

  late Future<Login> _signInResponse;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isShowPassword = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            _bgLogin(context),
            SizedBox(
              height: 200,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Image.asset(
                    'assets/icons/logo.png',
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 210, left: 24, right: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: formSignUp,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Silahkan Login',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(height: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const LabelWidget(title: 'Email'),
                              InputWidget(
                                hintText: 'Masukkan email kamu',
                                controller: _emailController,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'Email tidak boleh kosong';
                                  } else if (!value.contains('@')) {
                                    return 'Email tidak valid';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const LabelWidget(title: 'Kata Sandi'),
                              InputWidget(
                                hintText: 'Masukkan kata sandi kamu',
                                controller: _passwordController,
                                isObscureText: !_isShowPassword,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'Kata sandi tidak boleh kosong';
                                  }

                                  return null;
                                },
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isShowPassword = !_isShowPassword;
                                    });
                                  },
                                  child: Icon(
                                    _isShowPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.pushNamed(
                                      //   context,
                                      //   RouteName.forgotPassword,
                                      // );
                                    },
                                    child: Text(
                                      textAlign: TextAlign.right,
                                      'Lupa kata sandi ?',
                                      style: GoogleFonts.poppins(
                                        color: primaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        textStyle: const TextStyle(
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          ButtonWidget(
                            title: 'Login',
                            onPressed: () {
                              if (formSignUp.currentState!.validate()) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const TodoPage(),
                                  ),
                                );
                              }
                            },
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Belum punya akun? '),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Visibility(
                            visible:
                                MediaQuery.of(context).viewInsets.bottom != 0,
                            child: const SizedBox(height: 200),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _bgLogin(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.white,
        image: const DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
