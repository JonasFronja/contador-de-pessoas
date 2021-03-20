import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Contador de Pessoas",
      home: Home()
  ));
}



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = 'Está Vazio';
  void _changePeople(int delta){
    setState(() {
      _people += delta;
      if(_people + delta < 10){

        int _vagas = 10 - _people;
        _infoText = 'Há '+ _vagas.toString() + ' Vagas';
      }else{
        _people = 10;
        _infoText = 'Casa Cheia';
      }
      if(_people  <= 0){
        _people = 0;
        _infoText = 'Está Vazio';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("images/original.jpg",fit: BoxFit.cover,height: 1000.0,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child:FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed:(){_changePeople(1);} ,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child:FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed:(){_changePeople(-1);} ,
                  ),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            ),
          ],
        )
      ],
    );
  }
}
