import 'package:college_stuff/secret.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData.dark(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final key = GlobalKey<FormState>();
  String id = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Welcome Gitamite!!',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),),
              SizedBox(height: 10,),
              Form(
                key: key,
                child: LayoutBuilder(
                  builder: (context,constraints){
                    return Column(
                      children: [
                        Container(
                          width: 250,
                          
                          child: TextFormField(
                            validator: (val) => val.length < 9 ? 'Give a valid id' : null,
                            onChanged: (val){
                              setState(() {
                                
                                id = val;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Roll No',
                              fillColor: Colors.black,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:Colors.black,width:2.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:Colors.pink,width:2.0),
                              ),
                              
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),

                        Container(
                          child: Material(
                            color: Colors.blue,
                            elevation: 6,
                            borderRadius: BorderRadius.circular(30),
                            child: MaterialButton(
                              onPressed: () {
                                if(key.currentState.validate()){
                                  String url = 'https://doeresults.gitam.edu/gitamhallticket/img.aspx?id='+id;
                                  Navigator.push(context,MaterialPageRoute(
                                    builder: (context) => Secret(url: url,),
                                  ));
                                }
                              },
                              minWidth: 100,
                              height: 50,
                              child: Text('Open'),
                            ),
                          ),
                        ),

                      ],
                    );
                  },
                ),
              ),
            ],
          ),     
        )            
      );
  }
}
