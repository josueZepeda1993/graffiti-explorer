import 'package:flutter/material.dart';

void main() {
  runApp(const GraffitiExplorerApp());
}

class GraffitiExplorerApp extends StatelessWidget {
  const GraffitiExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Graffiti Explorer',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Graffiti Explorer'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Murales registrados',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              Card(
                child: ListTile(
                  leading: Icon(Icons.palette),
                  title: Text('Jaguar Cósmico'),
                  subtitle: Text('Artista: Desconocido'),
                ),
              ),

              Card(
                child: ListTile(
                  leading: Icon(Icons.palette),
                  title: Text('Alas de Libertad'),
                  subtitle: Text('Artista: Colectivo Urbano'),
                ),
              ),

              Card(
                child: ListTile(
                  leading: Icon(Icons.palette),
                  title: Text('Colores del Barrio'),
                  subtitle: Text('Artista: Muralistas SV'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}