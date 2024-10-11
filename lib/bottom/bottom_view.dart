import 'package:flutter/material.dart';

class BottomView extends StatefulWidget {
  const BottomView({Key? key}) : super(key: key);

  @override
  State<BottomView> createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  int _selectedIndex = 0;
  late final PageController _pageController =
      PageController(initialPage: _selectedIndex);
  final pages = [
    PageA(),
    PageB(),
    PageC(),
    PageD(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
          controller: _pageController,
          itemBuilder: (context, index) {
            return pages[index];
          },
          itemCount: pages.length,
          onPageChanged: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
        NavigationBar(
          height: kBottomNavigationBarHeight,
          selectedIndex: _selectedIndex,
          destinations: [
            NavigationDestination(icon: Icon(Icons.abc), label: 'A'),
            NavigationDestination(icon: Icon(Icons.abc), label: 'B'),
            NavigationDestination(icon: Icon(Icons.abc), label: 'C'),
            NavigationDestination(icon: Icon(Icons.abc), label: 'D'),
          ],
          onDestinationSelected: (value) {
            setState(() {
              _selectedIndex = value;
              _pageController.animateToPage(
                value,
                duration: Durations.medium4,
                curve: Curves.linear,
              );
            });
          },
        ),
      ],
    );
  }
}

class PageA extends StatelessWidget {
  const PageA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('A'),
      ),
    );
  }
}

class PageB extends StatelessWidget {
  const PageB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('B'),
      ),
    );
  }
}

class PageC extends StatelessWidget {
  const PageC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('C'),
      ),
    );
  }
}

class PageD extends StatelessWidget {
  const PageD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('D'),
      ),
    );
  }
}
