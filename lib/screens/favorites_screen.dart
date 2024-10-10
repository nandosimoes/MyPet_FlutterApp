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
            Image.asset(
              'lib/assets/pata.png',
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
            Text(
              'Pets',
              style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90),
              child: Row(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 25,
                  ),
                  Text(
                    'Favoritos',
                    style: TextStyle(color: const Color.fromARGB(255, 255, 0, 0), fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                ],
              ),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('lib/assets/profile_pic.png'),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Header(location: 'Embu das Artes'), // Usando o Header aqui
          Expanded( // Usando Expanded para ocupar o espaço restante
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _filteredFavoritePets().length,
                itemBuilder: (context, index) {
                  Pet pet = _filteredFavoritePets()[index];
                  List<Color> imageBackgroundColors = [
                    Color(0xFFD7F4DD),
                    Color(0xFFFFF3D3),
                    Color(0xFFFFD9C5),
                    Color(0xFFD0EFFF),
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

  List<Pet> _filteredFavoritePets() {
    return petService.getFavoritePets();
  }
}
