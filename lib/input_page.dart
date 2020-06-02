import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custon_widgets/icon_content.dart';
import 'custon_widgets/reusable_card.dart';

const bottomContainerHeight = 70.0;
const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);

enum Gender {male, female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

//1DIE33
//8D8E98
class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColour;
  Color femaleCardColor = inactiveCardColour;

//  1=male, 2=female
  void updateColour(Gender gender) {
    if (gender == Gender.male) {
      if(maleCardColor==inactiveCardColour){
        maleCardColor=activeCardColour;
        femaleCardColor=inactiveCardColour;
      }else{
        maleCardColor=inactiveCardColour;
      }
    }
    if(gender == Gender.female){
      if(femaleCardColor==inactiveCardColour){
        femaleCardColor=activeCardColour;
        maleCardColor=inactiveCardColour;
      }else{
        femaleCardColor=inactiveCardColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.male);
                      });
                    },
                    child: ReusableCard(
                      colour: maleCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColour(Gender.female);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(colour: activeCardColour),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour: activeCardColour),
                ),
                Expanded(
                  child: ReusableCard(colour: activeCardColour),
                ),
              ],
            ),
          ),
          Container(
            height: bottomContainerHeight,
            color: bottomContainerColour,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
