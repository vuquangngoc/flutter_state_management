import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/view/account.dart';
import 'package:todo_app_getx/view/completed.dart';
import 'package:todo_app_getx/view/recyce_bin.dart';
import 'package:todo_app_getx/view/to_do_list.dart';

void main() => runApp(GetMaterialApp(
      home: const MyApp(),
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 254, 127, 1)),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Widget> optionScreens = [
    ToDoListScreen(),
    CompletedTask(),
    RecycleBinToDoScreen(),
    const AccountScreen()
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: optionScreens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedItemColor: Colors.orange,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Task'),
            BottomNavigationBarItem(
                icon: Icon(Icons.check_circle), label: 'Completed'),
            BottomNavigationBarItem(
                icon: Icon(Icons.folder_delete), label: 'Recycle Bin'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Account')
          ]),
    );
  }
}

// void main() => runApp(
//   GetMaterialApp(
//       initialRoute: '/',
//       unknownRoute: GetPage(name: '/404', page: () => const UnknowNow()),
//       getPages: [
//         GetPage(name: '/', page: () => const Home()),
//         GetPage(name: '/second', page: () => Other()),
//         GetPage(
//             name: '/third', page: () => Other1(), transition: Transition.zoom),
//       ],
//     ));

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;

  increment1() {
    count++;
    update();
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());
    print('build home');
    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(
            title: GetBuilder<Controller>(
                builder: ((controller123) =>
                    Text("Clicks: ${controller123.count}")))

            //Obx(() => Text("Clicks: ${c.count}"))
            ),
        body: Center(
            child: ElevatedButton(
                child: const Text("Go to Other"),
                onPressed: () =>
                    Get.toNamed('/second', arguments: [1, 2, 3, 4]))),
        floatingActionButton: FloatingActionButton(
            onPressed: c.increment1, child: const Icon(Icons.add)));
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();
  List<int> test = Get.arguments;
  Other({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    print(test);
    // Access the updated count variable
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${c.count}"),
        const Text('Other Screen'),
        ElevatedButton(
            onPressed: () => Get.back(result: 'success'),
            child: const Text('Back')),
        ElevatedButton(
            onPressed: () => Get.offAll(() => Other1()),
            child: const Text('Next'))
      ],
    )));
  }
}

class Other1 extends StatelessWidget {
  Other1({Key? key}) : super(key: key);
  final Controller c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${c.count}"),
        const Text('Other 1 Screen'),
        ElevatedButton(onPressed: () => Get.back(), child: const Text('Back'))
      ],
    )));
  }
}

class UnknowNow extends StatelessWidget {
  const UnknowNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Không tìm thấy 404'),
      ),
    );
  }
}
