import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gettin_jacked/router/delegate.dart';

class WorkoutEdit extends StatefulWidget {
  WorkoutEdit({ @required String id });

  @override
  _WorkoutEditState createState() => _WorkoutEditState();
}

class _WorkoutEditState extends State<WorkoutEdit> {
  List<String> items = List.generate(7, (index) => 'Item');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () => JackedRouterDelegate.of(context).popRoute()
          ),
          title: Text('Edit Workout'),
          actions: [
            IconButton(icon: Icon(Icons.done, color: Colors.white), onPressed: () => JackedRouterDelegate.of(context).popRoute(),)
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add)
        ),
        body: ListView(
          children: List.generate(items.length, (index) {
            return Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Exercise Name'),
                    trailing: IconButton(icon: Icon(Icons.delete))
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 80.0,
                          child: TextFormField(
                            initialValue: '5',
                            decoration: InputDecoration(labelText: 'Weight', suffixText: 'lbs'),
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          )
                        ),
                        SizedBox(
                          width: 80.0,
                          child: TextFormField(
                            initialValue: '5',
                            decoration: InputDecoration(labelText: 'Reps'),
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          )
                        ),
                        SizedBox(
                          width: 80.0,
                          child: TextFormField(
                            initialValue: '5',
                            decoration: InputDecoration(labelText: 'Sets'),
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          )
                        )
                      ]
                    )
                  )
                ]
              )
            );
          })
        )
    );
  }
}

