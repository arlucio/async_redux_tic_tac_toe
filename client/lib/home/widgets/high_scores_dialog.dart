import 'package:business/services/get_it_instance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void highScoresDialog(BuildContext context) async {
  var scoreQueryResponse = await getIt
      .get<FirebaseFirestore>()
      .collection('highScores')
      .where('score', isGreaterThanOrEqualTo: 0)
      .orderBy('score', descending: true)
      .limit(20)
      .get();

  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              title: Column(children: <Widget>[
                Text("HIGH SCORES"),
                SizedBox(height: 30.0),
                tagsRow(),
                SizedBox(height: 10.0),
                highScoresList(context, scoreQueryResponse),
              ]),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("CLOSE"))
              ]));
}

Container highScoresList(BuildContext context, QuerySnapshot queryResponse) {
  var querySize = queryResponse.docs.length;
  return Container(
      height: MediaQuery.of(context).size.height - 400,
      width: MediaQuery.of(context).size.width - 100,
      child: ListView.builder(
        itemCount: querySize,
        itemBuilder: (context, index) {
          var playerName = queryResponse.docs[index].data()['playerName'];
          var playerScore = queryResponse.docs[index].data()['score'];
          return ListTile(
            title: Container(
                height: 40.0,
                width: 350.0,
                decoration: _scoresLineBoxDecoration,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(
                        width: 30.0,
                        child: Text('  ${index + 1}',
                            style: TextStyle(fontSize: 14.0))),
                    SizedBox(
                        width: 100.0,
                        child: Text('$playerName',
                            style: TextStyle(fontSize: 14.0))),
                    SizedBox(
                        width: 50.0,
                        child: Text('$playerScore',
                            style: TextStyle(fontSize: 14.0))),
                  ],
                )),
          );
        },
      ));
}

Container tagsRow() {
  return Container(
      height: 40.0,
      width: 300.0,
      decoration: _scoresLineBoxDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text('Pos', style: TextStyle(fontSize: 16.0)),
          Text('Name', style: TextStyle(fontSize: 14.0)),
          Text('Score', style: TextStyle(fontSize: 14.0)),
        ],
      ));
}

final _scoresLineBoxDecoration = BoxDecoration(
  color: Colors.amber.shade50,
  shape: BoxShape.rectangle,
  border: Border.all(color: Colors.indigo.shade700, width: 2.0),
  borderRadius: BorderRadius.circular(5.0),
  boxShadow: [
    BoxShadow(
        color: Colors.black12, blurRadius: 10.0, offset: Offset(0.0, 10.0))
  ],
);
