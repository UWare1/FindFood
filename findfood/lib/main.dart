import 'package:findfood/components/menu.dart';
import 'package:findfood/foods.dart';
import 'package:findfood/pages/navpages/home_page.dart';
import 'package:findfood/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'base_client.dart';
import 'pages/navpages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void getData() async {
    final url = Uri.parse("http://10.0.2.2:8000/foods");
    http.Response response1 = await http.get(url);
    if (response1.statusCode == 200) {
      print("Success to Fetch API!");
    } else {
      print("Failed to Fetch API!");
    }

    var response = await BaseClient().get('/').catchError((err) {});
    if (response == null) return debugPrint('failed main');
    debugPrint('successful main');

    var food = foodsFromJson(response);
    print(food[0].likes);
    for (var val in food) {
      debugPrint("name : ${val.name}, Likes : ${val.likes}");
    }
    //debugPrint('Foods count: ' + food.length.toString());

    /*var likes = Foods(likes: 8);
    var response2 = await BaseClient().put('/1', likes).catchError((err) {});
    if (response2 == null) return;
    debugPrint('successful:');*/
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    hideSystemBar();
    getData();
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Jost",
      ),
      home: WelcomePage(),
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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hey!',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Future hideSystemBar() async =>
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
