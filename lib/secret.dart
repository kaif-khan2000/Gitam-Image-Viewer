import 'package:flutter/material.dart';
class Secret extends StatefulWidget {
  String url;
  Secret({this.url});
  
  _SecretState createState() => _SecretState();
}

class _SecretState extends State<Secret> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              height: 150,
              child: Image(
                image: NetworkImage(
                '${widget.url}',
              ),
              )??Text('no Image Found'),
            ),
            Text(
              "Be carefull with Internet",
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}