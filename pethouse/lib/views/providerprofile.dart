import 'package:flutter/material.dart';
import 'package:pethouse/widgets/bottomnavigationbar.dart';
import 'package:pethouse/widgets/themenotificator.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';


class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  bool lockInBackground = true;
  
  @override
  Widget build(BuildContext context) {
   
    final themeProvider = Provider.of<DynamicTheme>(context);  
    return Scaffold(
      appBar: AppBar(title: Text('Perfil y ajustes')),
      bottomNavigationBar:
          AppBottomNavigationBar.buildBottomNavigationBar(context,2),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Common',
            tiles: [
              SettingsTile(
                title: 'Idioma',
                subtitle: 'Español',
                leading: Icon(Icons.language),
                onTap: () {},
              ),
            ],
          ),
          SettingsSection(
            title: 'Cuenta',
            tiles: [
              SettingsTile(title: 'Phone number', leading: Icon(Icons.phone)),
              SettingsTile(title: 'Email', leading: Icon(Icons.email)),
              SettingsTile(
                title: 'Cambiar Contraseña',
                leading: Icon(Icons.lock),                
              ),
              SettingsTile(
                  title: 'Cerrar Sesion', leading: Icon(Icons.exit_to_app)),
            ],
          ),
          SettingsSection(
            title: 'Modo Oscuro',
            tiles: [
              SettingsTile.switchTile(
                title: 'Cambiar Tema',
                leading: Icon(Icons.autorenew),
                switchValue: themeProvider.getDarkMode(), 
                onToggle: (bool value) {
                  setState(() {                   
                       themeProvider.changeDarkMode(value);  
                  });                 
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
 
 