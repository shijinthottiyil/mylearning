import 'package:flutter/material.dart';

class StaggerdListView extends StatefulWidget {
  const StaggerdListView({super.key});

  @override
  State<StaggerdListView> createState() => _StaggerdListViewState();
}

class _StaggerdListViewState extends State<StaggerdListView>
    with SingleTickerProviderStateMixin {
  int itemCount = 20;
  late AnimationController staggerdAnimationController =
      AnimationController(vsync: this, duration: Duration(seconds: 2));

  late List<Animation<Offset>> staggeredAnimationValueList = List.generate(
    itemCount,
    (index) => Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero).animate(
      CurvedAnimation(
          parent: staggerdAnimationController,
          curve: Interval(index * (1 / itemCount), 1, curve: Curves.ease)),
    ),
  );

  @override
  void initState() {
    super.initState();

    staggerdAnimationController.forward();
  }

  @override
  void dispose() {
    staggerdAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staggerd List View'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          itemBuilder: (context, index) => SlideTransition(
            position: staggeredAnimationValueList[index],
            child: ListTile(
              tileColor: Colors.transparent,
              leading: Icon(Icons.favorite_rounded),
              title: Text('Hello World$index.'),
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 8,
          ),
          itemCount: itemCount,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (staggerdAnimationController.isCompleted) {
            staggerdAnimationController.reverse();
            return;
          }
          staggerdAnimationController.forward();
        },
        child: Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
