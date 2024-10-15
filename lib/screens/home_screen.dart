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
          Header(
            location: 'Embu das Artes',
            onAnimalTypeSelected: (String animalType) {
              setState(() {
                selectedAnimalType = animalType;  // Atualiza o tipo de animal
              });
            },
          ), // Usando o Header aqui
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
