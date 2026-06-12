import 'package:flutter/material.dart';
//import '../models/mural.dart';
import 'mural_detail_screen.dart';
import '../data/murals_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Graffiti Explorer'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Murales',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

          Expanded(
            child: ListView.builder(
              itemCount: murales.length,
              itemBuilder: (context, index) {
                final mural = murales[index];

                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.palette),
                    title: Text(mural.nombre),
                    subtitle: Text(mural.artista),

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MuralDetailScreen(mural: mural),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),  
          ],
        ),
      ),      
    );
  }
}