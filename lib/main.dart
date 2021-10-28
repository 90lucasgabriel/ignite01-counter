import 'package:flutter/material.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: Colors.white,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.amber,
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.white10,
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Colors.white60,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.blueAccent,
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Counter'),
      body: Body(count: count),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.height = kToolbarHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class Body extends StatefulWidget {
  final int count;
  const Body({
    Key? key,
    required this.count,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Counter: ${widget.count}',
      ),
    );
  }
}
