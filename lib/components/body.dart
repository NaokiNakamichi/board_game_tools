import 'package:boardgame_tools/screens/coin_toss_screen.dart';
import 'package:boardgame_tools/screens/dice_3d_screen.dart';
import 'package:flutter/material.dart';
import 'package:boardgame_tools/components/header.dart';
import 'package:boardgame_tools/constants.dart';



class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Header(size: size),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    ReusableCard(
                      colour: Colors.white,
                      cardChild: CardContent(
                        image: 'assets/images/dice_3d.jpeg',
                        label: '3D-DICE',
                        size: size,
                      ),
                      onPress: () {
                        Navigator.pushNamed(context, Dice3DScreen.id);
                      },
                    ),
                    SizedBox(height: 20),
                    ReusableCard(
                      colour: Colors.white,
                      cardChild: CardContent(
                        image: 'assets/images/coin.jpg',
                        label: 'coin',
                        size: size,
                      ),
                      onPress: () {
                        Navigator.pushNamed(context, CoinTossScreen.id);
                      },
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  CardContent({this.image, this.label, this.size});
  final String image;
  final String label;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Image(
            image: AssetImage(image),
            fit: BoxFit.contain,
            width: size.width * 0.7,
            height: size.width * 0.7,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kTitleTextstyle,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        // margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 24,
              color: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({
    Key key,
    this.image,
    this.title,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: Colors.black26,
                  ),
                ],
              ),
            ),
            Expanded(
                child: Image(
              image: AssetImage(image),
            )),
            Positioned(
              left: 130,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        text,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
