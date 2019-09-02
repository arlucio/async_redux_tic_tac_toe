import 'package:client/home/widgets/new_random_name_button.dart';
import 'package:flutter/material.dart';

class PlayerNameWidget extends StatefulWidget {
  final String playerName;
  final VoidCallback generateRandomName;
  final ValueChanged<String> onNameChanged;

  PlayerNameWidget({this.playerName, this.generateRandomName, this.onNameChanged});

  @override
  _PlayerNameWidgetState createState() => _PlayerNameWidgetState();
}

class _PlayerNameWidgetState extends State<PlayerNameWidget> {
  TextEditingController saveNameTextController;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              alignment: Alignment.center,
              height: 200.0,
              decoration: _playerNameBoxDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  welcomeText(playerName: widget.playerName),
                  SizedBox(height: 15.0),
                  newRandomNameButton(widget.generateRandomName),
                  SizedBox(height: 15.0),
                  Container(
                      width: 250.0,
                      child: changeNameTextField(
                        saveNameTextController: saveNameTextController,
                        onNameChanged: widget.onNameChanged,
                      )),
                ],
              ),
            ),
          ],
        ));
  }
}

TextField changeNameTextField({TextEditingController saveNameTextController, ValueChanged<String> onNameChanged}) {
  return TextField(
    textAlign: TextAlign.center,
    cursorColor: Colors.indigo.shade700,
    decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(width: 2.0, color: Colors.red)),
        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
        hintText: "OR type a new name here"),
    controller: saveNameTextController,
    onChanged: (name) => onNameChanged(name),
  );
}

RichText welcomeText({String playerName}) {
  return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Hello, ',
          style: TextStyle(
            fontSize: 22.0,
            color: Colors.indigo.shade700,
            fontWeight: FontWeight.w300,
          ),
          children: <TextSpan>[
            TextSpan(
                text: '$playerName',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.indigo.shade700,
                  fontWeight: FontWeight.bold,
                )),
            TextSpan(
              text: ' !',
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.indigo.shade700,
                fontWeight: FontWeight.w200,
              ),
            )
          ]));
}

final _playerNameBoxDecoration = BoxDecoration(
  color: Colors.blue.shade50,
  shape: BoxShape.rectangle,
  border: Border.all(color: Colors.indigo.shade700, width: 2.0),
  borderRadius: BorderRadius.circular(7.0),
  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10.0, offset: Offset(0.0, 10.0))],
);
