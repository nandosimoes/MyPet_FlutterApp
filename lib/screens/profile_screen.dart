import 'package:flutter/material.dart';
import 'package:my_pet_app/screens/favorites_screen.dart';
import 'package:my_pet_app/screens/home_screen.dart'; // Ajuste o caminho conforme necessário
import 'package:my_pet_app/screens/add_pet_screen.dart';
import 'package:my_pet_app/widgets/bottom_navigation.dart'; // Ajuste o caminho conforme necessário

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, 
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
              'Pet',
              style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),
            ),
          ],
        ),

      ),
      body: Container(
       
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('lib/assets/profile_pic.png'),
              ),
              SizedBox(height: 20),
              Text(
                'Usuário',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.home, color: Colors.blue[900]),
                  title: Text('Home'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                ),
              ),
              Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.add, color: Colors.blue[900]),
                  title: Text('Adicionar'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddPetScreen()),
                    );
                  },
                ),
              ),
              Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: Icon(Icons.favorite, color: Colors.blue[900]),
                  title: Text('Favoritos'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FavoriteScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
