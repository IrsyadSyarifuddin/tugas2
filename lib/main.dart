import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Flutter World',
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(50)),
                child: Image.asset(
                    'assets/gambar.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Hi!, Doraemon',
                        style: TextStyle(color: Colors.white),
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/avatar.jpg',
                        ),
                        radius: 40,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.white
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          TextButton(
                              onPressed: null,
                              child: Text('Hallo Button')
                          ),
                          TextButton(
                              onPressed: null,
                              child: Text('Pencet Saya')
                          ),
                          FloatingActionButton.extended(
                              label: Text('Pesan Test Sekarang'),
                              backgroundColor: Colors.orange,
                              icon: Icon(
                                Icons.abc,
                                size: 30,
                              ),
                              onPressed: null,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
