import 'package:flutter/material.dart';
import 'package:recipes/recipe/recipe.fetcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('오늘의 밥상'),
        ),
        body: RecipeConsumer());
  }
}
