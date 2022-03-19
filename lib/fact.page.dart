import 'package:demoflutter/provider/fact.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/fact.model.dart';

class FactPage extends StatelessWidget {
  const FactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FactModel? fact = Provider.of<FactProvider>(context, listen: true).current;

    if (fact == null) {
      context.read<FactProvider>().loadFact();
      return const Center(child: CircularProgressIndicator());
    }
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(fact.picture, width: 200),
          const SizedBox(height: 25),
          Text(fact.fact),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<FactProvider>().classify(false);
                },
                child: const Icon(Icons.clear, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                  primary: Colors.red,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<FactProvider>().classify(true);
                },
                child: const Icon(Icons.favorite, color: Colors.white),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: EdgeInsets.all(20),
                  primary: Colors.green,
                ),
              )
            ]
          )
        ],
      )
    );
  }
}