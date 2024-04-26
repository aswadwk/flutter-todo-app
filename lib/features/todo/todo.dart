import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/widgets/input_widget.dart';
import 'package:todo_app/widgets/label_widget.dart';
import 'package:todo_app/widgets/shimmer_widget.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              headerHomePage(context),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputWidget(
                      textColor: Colors.white,
                      cursorColor: Colors.white,
                      hintText: 'Task baru',
                      controller: _passwordController,
                      // isObscureText: !_isShowPassword,
                      validate: (value) {
                        // if (value.isEmpty) {
                        //   return 'Kata sandi tidak boleh kosong';
                        // }

                        return null;
                      },
                      suffixIcon: GestureDetector(
                        onTap: () {
                          // setState(() {
                          //   _isShowPassword = !_isShowPassword;
                          // });
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.grey,
                          size: 25,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Stack headerHomePage(BuildContext context) {
  return Stack(
    children: [
      Container(
        height: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 23, 24, 27),
              Color.fromARGB(255, 23, 24, 27),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hai',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Apa yang ingin kamu lakukan hari ini?',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
