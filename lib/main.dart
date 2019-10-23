import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/widgets.dart';

void main() => runApp(TranslatePage());

class TranslatePage extends StatefulWidget {

  @override
  _TranslatePageState createState() => _TranslatePageState();
}


class _TranslatePageState extends State<TranslatePage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {

    // TODO: implement initState
    controller = AnimationController(duration: Duration(milliseconds: 1000),vsync: this);
    animation = Tween(begin: 0.0, end: 215.0).animate(controller);
    controller.addListener((){setState(() {

    });});

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String dropDownValue1 = 'Indonesian';
    String dropDownValue2 = 'English';


    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.menu),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text('Google', style: TextStyle(
                    fontFamily: 'ProductSans', letterSpacing: 1.15,fontSize: 25),),
                SizedBox(width: 10,),
                Text('Translate',
                  style: TextStyle(fontFamily: 'ProductSans', letterSpacing: 0.50,fontSize: 20),)
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(animation.value,0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropDownValue1,
                          iconSize: 24,
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                          onChanged: (String newValue) {
                            setState(() {
                              dropDownValue1 = newValue;
                            });
                          },
                          items: <String>[
                            'Indonesian',
                            'Telugu',
                            'Portuguese',
                            'English'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10,),
                          GestureDetector(
                            onTap: (){

                              print(controller.value);
                              if(controller.value == 0){
                                controller.forward();
                              }
                              else{
                                controller.reverse();
                              }

                              setState(() {

                              });

                            },
                            child: RotationTransition(
                              turns: controller,
                              child: Icon(
                                Icons.compare_arrows,
                                size: 30,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Transform.translate(
                          offset: Offset(-animation.value,0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: dropDownValue2,
                              iconSize: 24,
                              style: TextStyle(color: Colors.blue, fontSize: 20),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropDownValue2 = newValue;
                                });
                              },
                              items: <String>[
                                'Indonesian',
                                'Telugu',
                                'Portuguese',
                                'English'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],

                ),
                Container(width: double.infinity,height: 1,color: Colors.grey,
                )
              ],
            ),
          ),),
      ),
    );
  }
}
