import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:todo_app/features/todo/models/todo_model.dart';
import 'package:todo_app/features/todo/todo_service.dart';
import 'package:todo_app/widgets/input_widget.dart';
import 'package:todo_app/widgets/label_widget.dart';
import 'package:todo_app/widgets/shimmer_widget.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late Future<List<Todo>> todosFuture = TodoService.getTodos();
  late Future<bool> deleteTodos;
  late Future<bool> editTodos;
  late Future<bool> addTodos;

  final TextEditingController _newTodoController = TextEditingController();
  final TextEditingController _idTodoController = TextEditingController();

  bool _isUpdate = false;

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
                      controller: _newTodoController,
                      // isObscureText: !_isShowPassword,
                      validate: (value) {
                        // if (value.isEmpty) {
                        //   return 'Kata sandi tidak boleh kosong';
                        // }

                        return null;
                      },
                      suffixIcon: GestureDetector(
                          onTap: () {
                            if (_isUpdate) {
                              editTodos = TodoService.editTodos(
                                _idTodoController.text,
                                _newTodoController.text,
                                null,
                              );

                              editTodos.then((value) => {
                                    if (value)
                                      {
                                        setState(() {
                                          _isUpdate = false;
                                          _newTodoController.text = '';
                                          _idTodoController.text = '';
                                        }),
                                        // get data
                                        setState(() {
                                          todosFuture = TodoService.getTodos();
                                        })
                                      }
                                  });
                            } else {
                              addTodos = TodoService.addTodos(
                                _newTodoController.text,
                                null,
                              );

                              addTodos.then((value) => {
                                    if (value)
                                      {
                                        setState(() {
                                          _newTodoController.text = '';
                                        }),
                                        // get data
                                        setState(() {
                                          todosFuture = TodoService.getTodos();
                                        })
                                      }
                                  });
                            }
                          },
                          child: Container(
                            color: Colors.green, // Set your desired color here
                            child: Icon(
                              _isUpdate ? Icons.check : Icons.add,
                              color: Colors.white,
                              size: 35,
                            ),
                          )),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // listTask(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: FutureBuilder(
                  future: todosFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Todo> todos = snapshot.data as List<Todo>;

                      return ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 4),
                                child: Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    const Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          todos[index].todo.toString(),
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          todos[index].createdAt.toString(),
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // action edit and delete
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _newTodoController.text =
                                              todos[index].todo.toString();
                                          _idTodoController.text =
                                              todos[index].id.toString();

                                          _isUpdate = true;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        deleteTodos = TodoService.deleteTodos(
                                            todos[index].id.toString());

                                        deleteTodos.then((value) => {
                                              if (value)
                                                {
                                                  if (_isUpdate &&
                                                      _idTodoController.text ==
                                                          todos[index]
                                                              .id
                                                              .toString())
                                                    {
                                                      setState(() {
                                                        _isUpdate = false;
                                                        _newTodoController
                                                            .text = '';
                                                        _idTodoController.text =
                                                            '';
                                                      })
                                                    },
                                                  // get data
                                                  setState(() {
                                                    todosFuture =
                                                        TodoService.getTodos();
                                                  })
                                                }
                                            });
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }

                    return ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Shimmer.fromColors(
                              baseColor: Colors.white,
                              highlightColor: Colors.grey,
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: const [
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    )
                                  ],
                                ),
                              ),
                            ));
                      },
                    );
                  },
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
