import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/bottomnavigationbar.dart';

class ProfileCareGiver extends StatefulWidget {
  @override
  _ProfileCareGiverState createState() => _ProfileCareGiverState();
}

class _ProfileCareGiverState extends State<ProfileCareGiver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.generateAppBar('Profile', true),
      bottomNavigationBar: AppBottomNavigationBar.buildBottomNavigationBar(context),
    );
  }
}