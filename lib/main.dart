import 'package:flutter/material.dart';
import 'package:task/test_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  var newList = <TestModel>[];

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  void initState() {
    super.initState();
  }

  Future<void> _askedToLead(BuildContext context, int i) async {
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select options'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    widget.newList[i].currentX = widget.newList[i].nextX;
                    widget.newList[i].currentY = widget.newList[i].nextY;
                  });
                },
                child: const Text('move next'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    widget.newList[i].currentX = widget.newList[i].perviousX;
                    widget.newList[i].currentY = widget.newList[i].perviousY;
                  });
                },
                child: const Text('move back'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    widget.newList.removeAt(i);
                  });
                },
                child: const Text('delete'),
              ),
            ],
          );
        });
  }



  @override
  Widget build(BuildContext context) {
    final modeles = <Widget>[];
    for(int i = 0; i < widget.newList.length; i++) {
      modeles.add(
          Positioned(
            top: widget.newList[i].currentY,
            left: widget.newList[i].currentX,
            child: GestureDetector(
              child: Image.asset(
                widget.newList[i].imageUrl,
                height: 200,
                width: 200,
              ),
              onVerticalDragUpdate: (DragUpdateDetails dragUpdateDetails){
                setState(() {
                  widget.newList[i].nextY = dragUpdateDetails.globalPosition.dy - 200;
                  widget.newList[i].nextX = dragUpdateDetails.globalPosition.dx - 50;
                  widget.newList[i].currentY = dragUpdateDetails.globalPosition.dy - 200;
                  widget.newList[i].currentX = dragUpdateDetails.globalPosition.dx - 50;
                });
              },
              onVerticalDragStart: (DragStartDetails ds){
                setState(() {
                  widget.newList[i].perviousY = ds.globalPosition.dy - 200;
                  widget.newList[i].perviousX = ds.globalPosition.dx - 50;
                });
              },
              onLongPress: () {
                _askedToLead(context,i);
              },
            )
          )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            child: Stack(
              children: modeles,
            ),
          ),
          Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(10.0),
                crossAxisCount:  2 ,
                children: List.generate(
                    allModels.length, (index) {
                  return Card(
                    child: Wrap(
                      children: [
                        Center(
                          child: Image.asset(
                            allModels[index].imageUrl,
                            height: 70,
                            width: 100,
                          ),
                        ),
                        Center(
                          child: Text(
                            allModels[index].name,
                            style: TextStyle(
                              fontSize: 24
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Rate : ⭐⭐⭐⭐⭐",
                            style: TextStyle(
                                fontSize: 18
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: FloatingActionButton(
                              onPressed: (){
                                setState(() {
                                  widget.newList.remove(allModels[index]);
                                  widget.newList.add(allModels[index]);
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                ),
              ),
          )
        ],
      )
    );
  }
}
