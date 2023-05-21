import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: InitialPage());
  }
}

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  String buttonName1 = 'Click';
  String buttonName2 = 'Click';
  int currentIndex = 0;
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Frisopita App'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: currentIndex == 0
            ? Container(
                color: Colors.pink.shade100,
                width: double.infinity,
                height: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(220, 222, 18, 164),
                          foregroundColor: Colors.white),
                      onPressed: () {
                        setState(() {
                          buttonName1 = 'Clicked';
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => const NextPage(),
                        ));
                        print('Holiwis');
                      },
                      child: Text(buttonName1),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(220, 235, 12, 157),
                          foregroundColor: Colors.black),
                      onPressed: () {
                        setState(() {
                          buttonName2 = 'Clicked';
                        });
                        print('Bbcita');
                      },
                      child: Text(buttonName2),
                    ),
                  ],
                ),
              )
            : GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked = !isClicked;
                  });
                },
                child: isClicked
                    ? Image.asset('Images/flowers.jpg')
                    : Image.asset('Images/horapico.png'),
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.favorite,
              color: Color.fromARGB(255, 187, 22, 77),
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ),
          BottomNavigationBarItem(
              label: 'Settings', icon: Icon(Icons.settings)),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
        backgroundColor: Colors.purple.shade400,
      ),
    );
  }
}
