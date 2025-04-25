import 'package:flutter/material.dart';
import 'package:mylearning/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // VARIABLES--------------------------------------
  List<Map<String, dynamic>> people = [
    {
      'name': 'Shijin',
      'picture': 'https://i.pravatar.cc/150?img=1',
      'age': 25,
    },
    {
      'name': 'Aisha',
      'picture': 'https://i.pravatar.cc/150?img=2',
      'age': 22,
    },
    {
      'name': 'Rahul',
      'picture': 'https://i.pravatar.cc/150?img=3',
      'age': 28,
    },
    {
      'name': 'Neha',
      'picture': 'https://i.pravatar.cc/150?img=4',
      'age': 24,
    },
    {
      'name': 'Arjun',
      'picture': 'https://i.pravatar.cc/150?img=5',
      'age': 30,
    },
    {
      'name': 'Priya',
      'picture': 'https://i.pravatar.cc/150?img=6',
      'age': 27,
    },
    {
      'name': 'Vikram',
      'picture': 'https://i.pravatar.cc/150?img=7',
      'age': 26,
    },
    {
      'name': 'Meera',
      'picture': 'https://i.pravatar.cc/150?img=8',
      'age': 23,
    },
    {
      'name': 'Karan',
      'picture': 'https://i.pravatar.cc/150?img=9',
      'age': 29,
    },
    {
      'name': 'Anjali',
      'picture': 'https://i.pravatar.cc/150?img=10',
      'age': 21,
    },
    {
      'name': 'Ravi',
      'picture': 'https://i.pravatar.cc/150?img=11',
      'age': 32,
    },
    {
      'name': 'Sneha',
      'picture': 'https://i.pravatar.cc/150?img=12',
      'age': 20,
    },
    {
      'name': 'Aman',
      'picture': 'https://i.pravatar.cc/150?img=13',
      'age': 31,
    },
    {
      'name': 'Divya',
      'picture': 'https://i.pravatar.cc/150?img=14',
      'age': 22,
    },
    {
      'name': 'Rohit',
      'picture': 'https://i.pravatar.cc/150?img=15',
      'age': 28,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false);
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final person = people[index];
          return ListTile(
            title: Text('${person['name']}'),
            subtitle: Text('${person['age']} years old'),
            leading: Container(
              width: 50,
              height: 50,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: index.isEven ? BoxShape.circle : BoxShape.rectangle,
              ),
              child:
                  Image.network('https://picsum.photos/250?image=${index + 1}'),
            ),
            onTap: () {
              // Handle item tap
            },
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: people.length,
      ),
    );
  }
}
