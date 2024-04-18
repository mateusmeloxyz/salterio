import 'package:flutter/material.dart';
import "/salmos.dart";

void main() {
  runApp(
    MaterialApp(
      title: 'Passing Data',
      home: SalmosScreen(
        salmos: salmos
      )
    )
  );
}

class SalmosScreen extends StatelessWidget {
  // Requiring the list of salmos.
  const SalmosScreen({super.key, required this.salmos});

  final List<Salmo> salmos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saltério Genebrino'),
      ),
      //passing in the ListView.builder
      body: ListView.builder(
        itemCount: salmos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Salmo ${salmos[index].number}"),
            enabled: salmos[index].enabled,
            // When a user taps the ListTile, navigate to the DeailScreen.
            // Notice that you're not only creating a DetailScreen, you're
            // also passing the current salmo through to it.
            onTap: salmos[index].enabled ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(salmo: salmos[index]),
                ),
              );
            } : null,
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  // In the constructor, require a Salmo
  const DetailScreen({super.key, required this.salmo});

  // Declare a field that holds the Salmo.
  final Salmo salmo;

  @override
  Widget build(BuildContext context) {
    // Use the Salmo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text("Salmo ${salmo.number}"),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(salmo.title),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(salmo.subtitle),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(salmo.description),
              ),
            ],
          ),
        ),
      ),
    );
  }
}