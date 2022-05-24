import 'package:flutter/material.dart';
import 'package:todoapp/page/completed_page.dart';
import 'package:todoapp/page/todo_page.dart';
import 'package:todoapp/widget/add_to_do_dialog.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> tabScreens = [const ToDoPage(), const CompletedPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('To Do App'),
          centerTitle: true,
        ),
        body: tabScreens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.fact_check_outlined), label: 'ToDo'),
            BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Completed'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const AddToDoDialog();
                  });
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )));
  }
}
