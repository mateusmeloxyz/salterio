import 'package:flutter/material.dart';
import "/salmos.dart";

void main() {
  runApp(
    MaterialApp(
      title: 'Passing Data',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.brown,
          brightness: Brightness.light,
        ),

        textTheme: const TextTheme(),
      ),
      darkTheme: ThemeData.dark(),
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
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
          itemCount: salmos.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: salmos[index].enabled ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(salmo: salmos[index]),
                  ),
                );
              } : null,
              child: Container(
                margin: const EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 8.0),
                padding: const EdgeInsets.all(16.0),
                decoration: salmos[index].enabled ? BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ) : 
                BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text("${salmos[index].number}"),
                ),
              ),
            );
          },
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