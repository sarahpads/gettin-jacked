import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gettin_jacked/layout/sidebar.dart';
import 'package:path_provider/path_provider.dart';

class ExerciseDetail extends StatefulWidget {
  final String id;

  ExerciseDetail({ @required this.id });

  @override
  _ExerciseDetailState createState() => _ExerciseDetailState();
}

class _ExerciseDetailState extends State<ExerciseDetail> {
  final FavouritesStorage storage = FavouritesStorage();
  bool _isFavourite = true;

  @override
  void initState() {
    super.initState();

    storage.isFavourite(widget.id)
      .then((bool value) => setState(() => _isFavourite = value))
      .catchError((error) => print(error));
  }

  void handlePress() {
    _isFavourite = !_isFavourite;
    print(_isFavourite);
    print(widget.id);

    if (_isFavourite) {
      print('?');
      storage.addFavourite(widget.id);
    } else {
      storage.removeFavourite(widget.id);
    }

    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Detail'),
        actions: [
          IconButton(
            icon: Icon(_isFavourite ? Icons.star : Icons.star_border),
            onPressed: () => handlePress()
          )
        ]
      ),
      body: Text(_isFavourite ? 'favourite' : 'not favourite')
    );
  }
}

class FavouritesStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<void> addFavourite(String id) async {
    final file = await _localFile;
    print(file);

    // Write the file
    await file.writeAsString('\n$id', mode: FileMode.append);
  }

  Future<void> removeFavourite(String id) async {
    final file = await _localFile;
    print(file);

    List<String> lines = LineSplitter().convert(file.toString());
    print(lines);
  }

  Future<bool> isFavourite(String id) async {
    try {
      final file = await _localFile;

      // Read the file
      List<String> favourites = await file.readAsLines();
      print(favourites);

      return favourites.contains(id);
    } catch (e) {
      // If encountering an error, return false
      return false;
    }
  }
}

