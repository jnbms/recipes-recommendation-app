import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/recipe/recipe.entity.dart';
import 'package:recipes/states/page.dart';
import 'package:recipes/widgets/food_card.dart';

class RecipeConsumer extends StatefulWidget {
  const RecipeConsumer({Key? key}) : super(key: key);

  @override
  _RecipeConsumerState createState() => _RecipeConsumerState();
}

class _RecipeConsumerState extends State<RecipeConsumer> {
  late Future<List<Recipe>> recipes;
  int memo = 0;

  @override
  Widget build(BuildContext context) {
    PageModel pageModel = Provider.of<PageModel>(context);

    if (memo != pageModel.count) {
      recipes = readRecipes(pageModel.count);
      memo = pageModel.count;
      print('memory');
    }

    return FutureBuilder<List<Recipe>>(
      future: recipes,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return ListView(children: [
              if (snapshot.hasData)
                for (dynamic recipe in snapshot.data!) FoodCard(recipe: recipe),
              SizedBox(height: 80, child: CupertinoActivityIndicator()),
            ]);
          case ConnectionState.active:
            return Text('activing..');
          case ConnectionState.none:
            return Text('none..');
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView(children: [
                for (dynamic recipe in snapshot.data!) FoodCard(recipe: recipe),
                SizedBox(
                    height: 80,
                    child: TextButton(
                        onPressed: () => pageModel.increase(30),
                        child: Text(
                          '더보기',
                          style: TextStyle(fontSize: 16),
                        ))),
              ]);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CupertinoActivityIndicator());
        }
        ;
      },
    );
  }
}
