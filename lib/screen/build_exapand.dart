// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../itemsModal/items_data.dart';


class BuildExpandeds extends StatefulWidget {
  const BuildExpandeds({super.key});

  @override
  _BuildExpandedState createState() => _BuildExpandedState();
}

class _BuildExpandedState extends State<BuildExpandeds> {
 List<ProdacutItem>? products = [];
  List<Itam>? objectList = [];

  Future<Prodact> _getItemsList() async {
    final String res =
        await rootBundle.loadString('assets/jsonfile/itemsList.json');
    final data = await json.decode(res);
    products = await Prodact.fromJson(data).prodacutItem;

    objectList = products![0].itam;
    print(objectList!.length);

    Prodact items = Prodact.fromJson(data);

    print("kkkkkkkkkkkkkkkkk" + items.toString());
    return items;
  }

  @override
  void initState() {
    _getItemsList();
  }

  List _items = [];
  Future<void> readJsonFile() async {
    final String res =
        await rootBundle.loadString('assets/jsonfile/itemsList.json');
    final data = await json.decode(res);
    setState(() {
      _items = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 900,
        child: FutureBuilder(
            future: _getItemsList(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Text("Lodding...");
              } else {
                return ListView.builder(
                    itemCount: products!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          shadowColor: Colors.grey,
                          margin: EdgeInsets.all(5),
                          child: ExpansionTile(
                              title: Text(
                                products![index].name.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              children: <Widget>[
                                Container(
                                  height: 250,
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color.fromARGB(255, 234, 225, 225),
                                  ),
                                  child: ListView.builder(
                                      itemCount: objectList!.length,
                                      itemBuilder: (context, index) {
                                        return Card(
                                          child: ListTile(
                                            selected: true,
                                            title: Text(
                                              objectList![index]
                                                  .itemName
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            trailing: FavoriteButton(
                                              iconSize: 29,
                                              isFavorite: false,
                                              valueChanged: (_isFavorite) {
                                                print(
                                                    'Is Favorite : $_isFavorite');
                                              },
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ]));
                    });
              }
            }),
      
    );
  }

  }