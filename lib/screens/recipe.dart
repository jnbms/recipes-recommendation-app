import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/recipe/recipe.entity.dart';
import 'package:recipes/states/page.dart';

class ScreenArguments {
  final Recipe recipe;

  ScreenArguments(this.recipe);
}

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments? args =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    final cook = args!.recipe;
    final words = cook.RCP_PARTS_DTLS.split(',');
    // words.removeAt(0);ㅁㄴㄴㅁㄴㅁㄴㅁㄴㅁㄴㅁㄴㅡㅏㅁㄴ

    // const String MANUAL = 'MANUAL';
    // String MANUAL01 = MANUAL + '01';
    // List<String> Mauals =
    // var list = Iterable<int>.generate(20).toList().map((e) => 'MANUAL' + e.toString());
    Iterable<String> manuals = List<int>.generate(20, (i) => i + 1)
        .map((i) => i < 10 ? "MANUAL0$i" : "MANUAL$i");
    Iterable<String> Manuals = manuals.map((index) {
      return cook.toMap()[index];
    });

    // print(Manuals.single[3]);

    return Consumer<PageModel>(builder: (context, page, child) {
      final recipe = page.recipeObejct;
      return Scaffold(
        appBar: AppBar(
          title: Text(cook.RCP_NM),
        ),
        body: Stack(
          // mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
                tag: cook.RCP_NM,
                child: Image.network(
                  cook.ATT_FILE_NO_MK,
                  fit: BoxFit.cover,
                  height: 600,
                )),
            Positioned(
              child: DraggableScrollableSheet(
                maxChildSize: 0.8,
                initialChildSize: 0.3,
                minChildSize: 0.3,
                builder: (context, scrollController) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      padding: EdgeInsets.all(24),
                      color: Colors.white,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Center(
                            child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24)),
                                  color: Colors.grey[300]),
                              height: 4,
                              width: 40,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 24),
                              child: Text(
                                '재료',
                                style: TextStyle(fontSize: 32),
                              ),
                            ),
                            for (String word in words)
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 2),
                                child: Text(
                                  word,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            Container(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 32),
                              child: Text(
                                '요리 과정',
                                style: TextStyle(
                                    fontSize: 32,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                            for (String manual in Manuals)
                              if (manual.length != 0)
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    manual.substring(3, manual.length - 1)
                                    // .skip(0)
                                    // .first,
                                    ,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                            Container(
                              height: 48,
                            )
                          ],
                        )),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
