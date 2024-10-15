import 'package:flutter/material.dart';
import '../widgets/pet_card.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/header.dart'; // Importando o Header
import '../models/pet.dart';
import '../services/pet_service.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final PetService petService = PetService();
  List<Pet> favoritePets = [];

  @override
  void initState() {
    super.initState();
    _loadFavoritePets();
  }

  void _loadFavoritePets() {
    setState(() {
      // Carrega os pets favoritos filtrando pela propriedade 'favorite'
      favoritePets = petService.getFavoritePets();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'My',
              style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),
            ),
            Image.asset('lib/assets/pata.png', width: 20, height: 20, fit: BoxFit.contain),
            Text('Pets', style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(left: 90),
              child: Row(
                children: [
                  Icon(Icons.favorite, color: Colors.red, size: 25),
                  Text('Favoritos', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                  SizedBox(width: 5),
                ],
              ),
            ),
          ],
        ),
        actions: [
          CircleAvatar(backgroundImage: AssetImage('lib/assets/profile_pic.png')),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Header(location: 'Embu das Artes', onAnimalTypeSelected: (_) {}), // Header aqui, sem filtro
          favoritePets.isEmpty
              ? Center(child: Text('Nenhum pet favorito encontrado')) // Exibe se não houver favoritos
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: favoritePets.length,
                      itemBuilder: (context, index) {
                        Pet pet = favoritePets[index];
                        List<Color> imageBackgroundColors = [
                          Color.fromARGB(255, 255, 193, 193),
                          Color.fromARGB(255, 215, 244, 221),
                          Color.fromARGB(255, 179, 229, 252),
                          Color.fromARGB(255, 255, 243, 211),
                          Color.fromARGB(255, 255, 217, 197),
                          Color.fromARGB(255, 236, 208, 255),
                          Color.fromARGB(255, 195, 254, 244),
                          Color.fromARGB(255, 255, 171, 171),
                          Color.fromARGB(255, 214, 199, 230),
                          Color.fromARGB(255, 224, 224, 224),
                        ];
                        Color imageColor = imageBackgroundColors[index % imageBackgroundColors.length];
                        return PetCard(pet: pet, imageBackgroundColor: imageColor);
                      },
                    ),
                  ),
                ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
