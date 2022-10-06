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
      home: Page1(),
    );
  }
}

class Page1 extends StatefulWidget {
  Page1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int counter = 0;
  String y = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Saya Dipanggil Lagi sebanyak $counter'),
            ElevatedButton(
                onPressed: () async {
                  final data = await Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Page2()));
                  setState(() {
                    counter++;
                    if (data != null) {
                      y = data;
                    } else {
                      y = '';
                    }
                  });
                },
                child: Text('Navigation to Page 2')),
            Visibility(
                visible: y.isNotEmpty,
                child: Text('Saya kembali dari $y')
            )
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, "dari halaman 2");
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
              title: Text('Latihan Page 2')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Page3()));
                  },
                  child: Text('Navigation to Page 3'),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, 'Dari Halaman 2');
                    },
                    child: Text('Back to Page 1'))
              ],
            ),
          ),
        ));
  }
}

class Page3 extends StatelessWidget {
  Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Page 3'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Page4()
              )
            );
          },
          child: Text('Navigation to Page4'),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kembali ke Halaman Awal'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: Text('Kembali ke Halaman Awal'),
        ),
      ),
    );
  }
}
