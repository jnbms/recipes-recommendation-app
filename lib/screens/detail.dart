import 'package:flutter/material.dart';
import 'package:recipes/recipe/recipe.entity.dart';

class ScreenArguments {
  final Recipe recipe;

  ScreenArguments(this.recipe);
}

class DetialScreen extends StatefulWidget {
  const DetialScreen({Key? key}) : super(key: key);

  @override
  _DetialScreenState createState() => _DetialScreenState();
}

class _DetialScreenState extends State<DetialScreen> {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments? args =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Column(children: [Text(args!.recipe.MANUAL01)]);
  }
}
