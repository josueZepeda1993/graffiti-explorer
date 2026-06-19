import 'package:flutter/material.dart';

import '../models/mural.dart';
import '../data/murals_data.dart';
import '../screens/map_screen.dart';
import '../screens/mural_detail_screen.dart';
import '../services/favorites_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}
class _HomeScreenState extends State<HomeScreen>{
  final TextEditingController _searchController = TextEditingController();
  late List<Mural> muralesFiltrados;

  @override
  void initState(){
    super.initState();

    muralesFiltrados = List.from(murales);
  }

  void filtrarMurales(String texto){
    final busqueda = texto.toLowerCase();
    setState(() {
      if (texto.isEmpty){
        muralesFiltrados = List.from(murales);
      }else{
        muralesFiltrados = murales.where((mural){
          return mural.nombre.toLowerCase().contains(busqueda) || 
                 mural.artista.toLowerCase().contains(busqueda) || 
                 mural.ubicacion.toLowerCase().contains(busqueda);
        }).toList();
      }
    });
  }

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

          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MapScreen(),
                ),
              );
            },
            icon: const Icon(Icons.map),
            label: const Text('Ver Mapa'),
          ),

          TextField(
           controller: _searchController, 
           onChanged: filtrarMurales,
           decoration: InputDecoration(
              hintText: 'Buscar Mural ...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              ),
           ),           
          ),

          const SizedBox(height: 20),  

          Expanded(
            child: muralesFiltrados.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_off,
                      size: 64,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'No se encontraron murales',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Prueba con otro nombre, artista o ubicacion',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
            )
            : ListView.builder(
              itemCount: muralesFiltrados.length,
              itemBuilder: (context, index) {
                final mural = muralesFiltrados[index];

                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.palette),
                    title: Text(mural.nombre),
                    subtitle: Text(mural.artista),

                    trailing: IconButton(
                      icon: Icon(
                        FavoritesService.esFavorito(mural.nombre)
                          ? Icons.favorite
                          : Icons.favorite_border,
                        color: FavoritesService.esFavorito(mural.nombre)
                          ? Colors.red
                          : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          FavoritesService.toggleFavorito(mural.nombre);
                        });
                      },
                    ),

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