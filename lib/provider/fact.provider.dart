import 'dart:convert';

import 'package:demoflutter/models/fact.model.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class FactProvider extends ChangeNotifier {
  List<FactModel> likedFact = [];
  List<FactModel> rejectedFact = [];
  FactModel? current;

  Future<void> loadFact() async {
    dynamic factRes = await http.get(Uri.parse("https://catfact.ninja/fact"));
    Map<String, dynamic> factBody = jsonDecode(factRes.body);

    dynamic pictureRes = await http.get(Uri.parse("https://api.thecatapi.com/v1/images/search"));
    List<Map<String, dynamic>> pictureBody = List.from(jsonDecode(pictureRes.body));

    current = FactModel(fact: factBody["fact"], picture: pictureBody[0]["url"]);
    notifyListeners();
  }

  Future<void> classify(bool liked) async {
    if (current == null) { return; }
    if (liked) {
      likedFact.add(current!);
    } else {
      rejectedFact.add(current!);
    }
    current = null;
    notifyListeners();
    loadFact();
  }
}