import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyRecipeList extends StatefulWidget {
  const MyRecipeList({Key? key}) : super(key: key);

  @override
  State<MyRecipeList> createState() => _MyRecipeListState();
}

class _MyRecipeListState extends State<MyRecipeList> {
  List<String> recipes = [];

  @override
  void initState() {
    super.initState();
    recipes = <String>[];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: _buildRecipeList(context),
    );
  }

  Widget _buildRecipeList(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 100,
          child: Slidable(
            startActionPane: ActionPane(
              motion: const DrawerMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              children: <Widget>[
                SlidableAction(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.transparent,
                  icon: Icons.delete,
                  label: 'Delete',
                  onPressed: (BuildContext context) {},
                )
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              children: <Widget>[
                SlidableAction(
                  onPressed: (BuildContext context) {},
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.transparent,
                  icon: Icons.share,
                  label: 'Share',
                ),
              ],
            ),
            child: Card(
              elevation: 1.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.white,
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CachedNetworkImage(
                      imageUrl:
                          'http://www.seriouseats.com/recipes/2011/12/chicken-vesuvio-recipe.html',
                      height: 120,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                    title: const Text('Chicken Vesuvio'),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
