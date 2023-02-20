import 'package:flutter/material.dart';
import 'package:recipes/recipe/recipe.entity.dart';
import 'package:recipes/screens/recipe.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({Key? key, required this.recipe}) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(context, '/recipe',
            arguments: ScreenArguments(recipe))
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 80),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ImageCard(recipe.RCP_NM, recipe.ATT_FILE_NO_MAIN)),
            Positioned(
                bottom: -60,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextCard(recipe)))
          ],
        ),
      ),
    );
  }
}

Widget ImageCard(name, imgUrl) => Container(
      height: 200,
      // margin: EdgeInsets.only(bottom: 24),
      child: Card(
        child: Hero(
          tag: name,
          child: Image.network(
            imgUrl,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        // elevation: 5,
        margin: EdgeInsets.all(5),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),
    );

Widget TextCard(Recipe recipe) {
  List<String> fields = ['칼로리', '지방', '나트륨', '단백질'];
  final recipeFields = {
    '칼로리': recipe.INFO_CAR,
    '지방': recipe.INFO_FAT,
    '나트륨': recipe.INFO_NA,
    '단백질': recipe.INFO_PRO
  };
  return Card(
      elevation: 5,
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  recipe.RCP_NM,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22),
                ),
              )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                for (String field in fields)
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Text(field)),
                          Text(recipeFields[field].toString())
                        ]),
                  )
              ],
            ),
          ),
        ],
      ));
}
