import 'package:flutter/material.dart';

class Exercises extends StatefulWidget {
  @override
  _ExercisesState createState() => _ExercisesState();
}

class _ExercisesState extends State<Exercises> {
  final items = List<String>.generate(3, (i) => "Item ${i + 1}");

  Future<bool> _confirmDismiss (DismissDirection direction) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm"),
          content: const Text("Are you sure you wish to delete this item?"),
          actions: <Widget>[
            TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel')
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          // shrinkwrap and the physics options ensure that 1) this only takes up the space it needs
          // and 2) that it doesn't scroll independently
          // these are necessary as we have nested ListViews, which will take up all available space by default
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: ValueKey(items[index]),
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                });
              },
              confirmDismiss: _confirmDismiss,
              background: Container(color: Colors.red),
              secondaryBackground: Container(color: Colors.blue),
              child: Card(
                child: ListTile(
                  title: Text('Exercise name'),
                  subtitle: Text('x lbs, 5 sets x 5 reps'),
                )
              )
            );
          },
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: Theme.of(context).cardTheme.margin ?? EdgeInsets.symmetric(horizontal: 4.0),
          child: OutlinedButton(child: Text('Add exercise'), onPressed: () => {})
        )
      ]
    );
  }
}
