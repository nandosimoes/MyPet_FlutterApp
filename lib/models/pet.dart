class Pet {
  final String id;
  final String name;
  final String species;
  final String breed;
  final String age;
  final String description;
  final String weight; 
  final String imagePath;
  final bool hasVaccines;
  final bool favorite;

  Pet({
    required this.id,
    required this.name,
    required this.species,
    required this.breed,
    required this.age,
    required this.description,
    required this.weight, 
    required this.imagePath,
    required this.hasVaccines,
    required this.favorite,
  });
}
