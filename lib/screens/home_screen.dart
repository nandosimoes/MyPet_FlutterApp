import 'package:flutter/material.dart';
import '../widgets/pet_card.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/header.dart';
import '../models/pet.dart';
import '../services/pet_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PetService petService = PetService();
  String selectedAnimalType = 'Todos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(
              'My',
              style: TextStyle(
                  color: Colors.blue[900], fontWeight: FontWeight.bold),
            ),
            Image.asset(
              'lib/assets/pata.png',
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
            Text(
              'Pet',
              style: TextStyle(
                  color: Colors.blue[900], fontWeight: FontWeight.bold),
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _filteredPets().length,
                itemBuilder: (context, index) {
                  Pet pet = _filteredPets()[index];
                  List<Color> imageBackgroundColors = [
                    Color(0xFFFFC1C1), 
                    Color(0xFFD7F4DD),
                    Color(0xFFB3E5FC), 
                    Color(0xFFFFF3D3), 
                    Color(0xFFFFD9C5),
                    Color.fromARGB(255, 236, 208, 255), 
                    Color.fromARGB(255, 195, 254, 244),
                    Color(0xFFFFABAB),
                    Color(0xFFD6C7E6), 
                    Color(0xFFE0E0E0), 
                  ];
                  Color imageColor = imageBackgroundColors[
                      index % imageBackgroundColors.length];
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

  List<Pet> _filteredPets() {
    if (selectedAnimalType == 'Todos') {
      return petService.getPets();
    } else {
      return petService
          .getPets()
          .where((pet) => pet.species == selectedAnimalType)
          .toList();
    }
  }
}
