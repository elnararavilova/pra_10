import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pr_10/MyInheritedWidget.dart';
import 'package:pr_10/mobx.dart';
import 'first.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get_it/get_it.dart';

void main() {
  setupGetIt();
  runApp(MyApp());
}

final editString = EditString();

class GetString { // Класс отдельной логики для GetIt
  String text2;
  GetString(this.text2);
}

GetIt getIt = GetIt.instance; // Инициализация

void setupGetIt() { // Регистрация образа класса в контейнер get
  GetIt.I.registerSingleton<GetString>(GetString('Это картинка'));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/screen1': (context) => Screen1(),
          '/screen2': (context) => Screen2(),
          '/screen3': (context) => Screen3(),
          '/screen4': (context) => Screen4(),
          '/screen5': (context) => Screen5(),
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Домашняя страница'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/screen1');
              },
              child: Text('Экран 1'),
            ),
            ElevatedButton(
              onPressed: () {
                editString.edit('Картинка 2');
                Navigator.pushNamed(context, '/screen2');
              },
              child: Text('Экран 2'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/screen3');
              },
              child: Text('Экран 3'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/screen4');
              },
              child: Text('Экран 4'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/screen5');
              },
              child: Text('Экран 5'),
            ),
            ElevatedButton(
              onPressed: () {
                editString.edit('Картинка 2');
                goToFirst(context);
              },
              child: Text(MyInheritedWidget.of(context).text1), // Передаем строковую переменную
            ),
          ],
        ),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(getIt.get<GetString>().text2), // Передача параметра через GetIt
          CachedNetworkImage(
            imageUrl: "https://i.postimg.cc/633s8pHw/th-1.jpg",
            progressIndicatorBuilder: (context, url, progress) =>
            const CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Вернуться'),
          ),
        ],
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Observer(
            builder: (_) => Text(editString.text3),
          ),
          CachedNetworkImage(
            imageUrl: "https://i.postimg.cc/mgNhwP8s/1547367999-1.jpg",
            progressIndicatorBuilder: (context, url, progress) =>
            const CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Вернуться'),
          ),
        ],
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Screen 3'),
          CachedNetworkImage(
            imageUrl: "https://i.postimg.cc/N0sFPQzr/3d-kartinki-na-rabochij-stol-na-ves-ekran-3.jpg",
            progressIndicatorBuilder: (context, url, progress) =>
            const CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Вернуться'),
          ),
        ],
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Screen 4'),
          CachedNetworkImage(
            imageUrl: "https://i.postimg.cc/zB3B805z/651499770.jpg",
            progressIndicatorBuilder: (context, url, progress) =>
            const CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Вернуться'),
          ),
        ],
      ),
    );
  }
}

class Screen5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Screen 5'),
          CachedNetworkImage(
            imageUrl: "https://i.postimg.cc/YCwhY6NR/th.jpg",
            progressIndicatorBuilder: (context, url, progress) =>
            const CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Вернуться'),
          ),
        ],
      ),
    );
  }
}

Future<void> goToFirst(BuildContext context) {
  return Future.delayed(Duration(seconds: 3)).then((_) {
    // Переход к другой реализации
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FirstScreen()),
    );
  });
}