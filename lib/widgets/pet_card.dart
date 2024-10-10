import 'package:flutter/material.dart';
import '../models/pet.dart';
import '../screens/pet_details_screen.dart';

class PetCard extends StatelessWidget {
  final Pet pet;
  final Color imageBackgroundColor;

  PetCard({required this.pet, required this.imageBackgroundColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PetDetailsScreen(pet: pet)),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                color: imageBackgroundColor,
                child: Image.asset(
                  pet.imagePath,
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pet.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(pet.breed),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(pet.age),
                      Icon(
                        pet.favorite ? Icons.favorite : Icons.favorite_border,
                        color: pet.favorite ? Colors.red : null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
