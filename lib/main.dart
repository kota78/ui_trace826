import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _value = 0.2;
  int selectedNumber = 0;
  int correctAnswerNumber = 1;

  Widget tileView(String pictureAddress, wordText, int itemNumber) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          selectedNumber = itemNumber;
          print(selectedNumber);
          setState(() {});
        },
        child: Container(
          decoration: BoxDecoration(
            color: (selectedNumber == itemNumber)
                ? Colors.lightBlue.withOpacity(0.2)
                : Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: (selectedNumber == itemNumber)
                ? Border.all(
                    color: Colors.lightBlue.withOpacity(0.3), width: 1.5)
                : Border.all(color: Colors.grey[300], width: 1.5),
          ),
          child: Column(
            children: [
              Expanded(child: Container()),
              Expanded(child: Image.asset(pictureAddress)),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(wordText),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget modal() {
    return Container(
      color: Colors.lightGreen[200],
      height: 150,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Nicely done!",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.flag_outlined,
                  color: Colors.green,
                  size: 20,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "CONTINUE",
                      style: TextStyle(),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          SizedBox(
            height: 30,
          ),
          //Expanded(child: Container()),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.close,
                      color: Colors.grey,
                      size: 40,
                    )),
              ),
              Expanded(
                child: Container(
                  height: 15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: LinearProgressIndicator(
                      value: _value,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.favorite,
                      color: Colors.pink,
                      size: 30,
                    )),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.audiotrack, color: Colors.lightBlue),
              Text(
                "NEW WORD",
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Which of these is "coffee"?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: tileView("assets/drink_milk_pack.png", "Milch", 1),
                ),
                Expanded(
                  child: tileView("assets/food_bread.png", "Brot", 2),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child:
                      tileView("assets/petbottle_water_full.png", "Wasser", 3),
                ),
                Expanded(
                  child: tileView("assets/drink_coffee.png", "Kaffee", 4),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: (selectedNumber != 0)
                      ? ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                                enableDrag: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return modal();
                                });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "CHECK",
                          ),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: null,
                          child: Text(
                            "CHECK",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }
}
