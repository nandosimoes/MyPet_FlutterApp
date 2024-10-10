import '../models/pet.dart';
import '../mock/pets_data.dart';

class PetService {
  List<Pet> getPets() {
    return petsData.map((data) => Pet(
      id: data['id'],
      name: data['name'],
      species: data['species'],
      breed: data['breed'],
      age: data['age'],
      description: data['description'],
      weight: data['weight'],
      imagePath: data['imagePath'],
      hasVaccines: data['hasVaccines'], 
      favorite: data['favorite'],       
    )).toList();
  }

  List<Pet> getFavoritePets() {
    return getPets().where((pet) => pet.favorite).toList();
  }
}
