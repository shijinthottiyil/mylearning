import 'package:flutter/material.dart';
import 'package:mylearning/features/events/view/events_view.dart';
import 'package:mylearning/features/home/view/home_view.dart';

class BottomView extends StatefulWidget {
  const BottomView({super.key});

  @override
  State<BottomView> createState() => _BottomViewState();
}

class _BottomViewState extends State<BottomView> {
  int _selectedIndex = 0;
  final _pages = [
    HomeView(),
    EventsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'Events')
        ],
        onTap: (currentIndex) {
          setState(() {
            _selectedIndex = currentIndex;
          });
        },
      ),
    );
  }
}
