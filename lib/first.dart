import 'package:flutter/material.dart';
import 'main.dart';
import 'second.dart';
import 'third.dart';
import 'fourth.dart';
import 'fifth.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    return 'Данные обработаны';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'First Screen',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );
              },
              child: const Text('Second Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdScreen()),
                );
              },
              child: const Text('Third Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FourthScreen()),
                );
              },
              child: const Text('Fourth Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FifthScreen()),
                );
              },
              child: const Text('Fifth Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: const Text('Come back'),
            ),
            ElevatedButton(
              onPressed: () async {
                String data = await fetchData();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Обработка данных'),
                      content: Text(data),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Закрыть'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Обработать данные'),
            ),
          ],
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 7));
    return 'Данные загружены';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          String data = await fetchData();
          showDialog(
            context: context,
            builder: (BuildContext context) {

              return AlertDialog(
                title: Text('Загрузка данных'),
                content: Text(data),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Закрыть'),
                  ),
                ],
              );
            },
          );
        },
        child: Text('Загрузить данные'),
      ),
    );
  }
}
