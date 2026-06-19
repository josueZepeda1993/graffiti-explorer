class FavoritesService {

  static final Set<String> _favoritos = {};

  static bool esFavorito(String nombre) {
    return _favoritos.contains(nombre);
  }

  static void toggleFavorito(String nombre) {

    if (_favoritos.contains(nombre)) {
      _favoritos.remove(nombre);
    } else {
      _favoritos.add(nombre);
    }

  }

  static List<String> obtenerFavoritos() {
    return _favoritos.toList();
  }

}