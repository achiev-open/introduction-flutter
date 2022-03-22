import 'package:demoflutter/provider/fact.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/fact.model.dart';

class LikedPage extends StatelessWidget {
  const LikedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FactModel> facts = Provider.of<FactProvider>(context, listen: true).likedFact;

    if (facts.isEmpty) {
      return Center(child: Text("You didn't like ant fact"));
    }

    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 25),
      itemBuilder: (BuildContext ctx, int index) {
        return ListTile(
          leading: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(facts[index].picture),
                fit: BoxFit.cover,
              )
            ),
          ),
          title: Text(facts[index].fact),
        );
      },
      separatorBuilder: (BuildContext ctx, int index) {
        return const Divider();
      },
      itemCount: facts.length,
    );
  }
}