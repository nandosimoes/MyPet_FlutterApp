import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Notificações'),
            trailing: Switch(
              value: true,
              onChanged: (bool value) {
                // Implement notification toggle
              },
            ),
          ),
          ListTile(
            title: Text('Tema Escuro'),
            trailing: Switch(
              value: false,
              onChanged: (bool value) {
                // Implement dark theme toggle
              },
            ),
          ),
          ListTile(
            title: Text('Idioma'),
            trailing: DropdownButton<String>(
              value: 'Português',
              items: <String>['Português', 'English', 'Español']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Implement language change
              },
            ),
          ),
          ListTile(
            title: Text('Versão do App'),
            subtitle: Text('1.0.0'),
          ),
        ],
      ),
    );
  }
}