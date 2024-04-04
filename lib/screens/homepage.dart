import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int _currentIndex = 0;

  List<Widget> _pages = [
    MyHomePage(),
    SecondPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: 'bookmark',
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> titles = [
    'Albert Einstein',
    'J.K. Rowling',
    'Albert Einstein',
  ];

  final List<String> descriptions = [
    '“The world as we have created it is a process of our thinking. It cannot be changed without changing our thinking.”',
    '“It is our choices, Harry, that show what we truly are, far more than our abilities.”',
    '“There are only two ways to live your life. One is as though nothing is a miracle. The other is as though everything is a miracle.”',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Quotes',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: CarouselSlider.builder(
          itemCount: titles.length,
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 8 / 9,
            enlargeCenterPage: true,
          ),
          itemBuilder: (BuildContext context, int index, _) {
            return Container(
              height: 400,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                      image: AssetImage('assets/download (1).jpg'),
                      fit:
                          BoxFit.fill) // Change the background color as desired
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    titles[index],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    descriptions[index],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Icon(Icons.bookmark),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Bookmark'),
    );
  }
}
