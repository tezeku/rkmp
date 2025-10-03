import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyStatelessWidget App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'MyStatelessWidget App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.grey),
                          shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24)
                              )
                          )
                      ),
                      child: const Text('Это кнопка')
                  )
              ),
              const SizedBox(
                width: 150,
                height: 50
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                'ФИО: Кузюхин Артемий Вячеславович\n'
                'Номер группы: ИКБО-06-22\n'
                'Номер студенческого билета: 22И0289',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.blueGrey
                  ),
                ),
              )
            ],
        )
      ),
    );
  }
}
