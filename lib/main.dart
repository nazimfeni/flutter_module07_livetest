import 'package:flutter/material.dart';
void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter =0;
  Future<void> _showCongratulationsDialog(counter) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Button pressed ${counter} times'),
          actions: <Widget>[
            TextButton(onPressed: (){
              Navigator.pop(context);

            }, child: Text("Close"))
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App"),),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Count:", style: TextStyle(fontSize: 30),),
            Text(counter.toString(), style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){

                  setState(() {
                    counter = counter+1;
                    if (counter >= 5) {
                      _showCongratulationsDialog(counter);
                    }



                  });
                }, child: Icon(Icons.add)),
                SizedBox(width: 30),
                ElevatedButton(onPressed: (){

                  setState(() {
                    if (counter > 0) {
                      counter = counter - 1;
                    }
                  });
                }, child: Icon(Icons.remove)),
              ],
            )
          ],
        ),
        
        
      ),

    );
  }
}