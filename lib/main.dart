import 'package:boardgame_tools/screens/dice_3d_screen.dart';
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/dice_2d_screen.dart';

void main() => runApp(BoardGameTools());

class BoardGameTools extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,

      ),



      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        Dice2DScreen.id: (context) => Dice2DScreen(),
        Dice3DScreen.id: (context) => Dice3DScreen(),


      },
    );
  }
}
