import 'package:flutter/material.dart';
import 'register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final height = screenSize.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'lib/assets/fundoWelcome.png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'My',
                      style: TextStyle(
                        fontSize: width * 0.15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                        fontFamily: 'Arial',
                      ),
                    ),
                    SizedBox(width: width * 0.02),
                    Image.asset(
                      'lib/assets/pata.png',
                      width: width * 0.15,
                      height: width * 0.15,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: width * 0.02),
                    Text(
                      'Pet',
                      style: TextStyle(
                        fontSize: width * 0.15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                        fontFamily: 'Arial',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                SizedBox(
                  height: height * 0.55,
                  child: Image.asset(
                    'lib/assets/mulherCachorro.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: height * 0.02),
                Text(
                  'Faça um novo amigo',
                  style: TextStyle(
                    fontSize: width * 0.08,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Arial',
                  ),
                ),
                Text(
                  'Adote um Pet hoje',
                  style: TextStyle(
                    fontSize: width * 0.06,
                    fontFamily: 'Arial',
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1, vertical: height * 0.025),
                  ),
                  child: Text(
                    'Vamos lá',
                    style: TextStyle(
                      fontSize: width * 0.06,
                      color: Colors.white,
                      fontFamily: 'Arial',
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                ),
                SizedBox(height: height * 0.04),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
