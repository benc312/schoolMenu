import 'package:flutter/material.dart';
import 'fullday.dart';

class FullMenu extends StatefulWidget {
  final FullDay eat;
  const FullMenu({Key? key, required this.eat}) : super(key: key);

  @override
  _FullMenuState createState() {
    return _FullMenuState();
  }
}

class _FullMenuState extends State<FullMenu> {
  @override
  Widget build(BuildContext context) {
    // 1
    return Scaffold(
      backgroundColor: Color.fromARGB(245, 110, 148, 163),
      appBar: AppBar(
        title: Text(widget.eat.day),
      ),
      // 2
      body: SafeArea(
        // 3
        child: Column(
          children: <Widget>[
            // 4
            Container(
              decoration: BoxDecoration(border: Border.all(), color:  Color.fromRGBO(64,100,114,1.0), borderRadius: BorderRadius.all(Radius.circular(20))),
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.eat.imageUrl),
              ),
            ),
            // 5
            // 6
            DecoratedBox(
            decoration: const BoxDecoration(color: Color.fromRGBO(64,68,114,1.0)),
            child: Text(
              widget.eat.label,
              style: const TextStyle(fontSize: 25, color: Color.fromARGB(235, 194, 116, 109)),
            ),
          ),
            const Text(
              'Other foods for today',
              style: TextStyle(fontSize: 20),
            ),
            // 7
            Container(
            decoration: BoxDecoration(border: Border.all(), color:  Colors.bluegrey, borderRadius: BorderRadius.all(Radius.circular(20))),
              height: 100,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.eat.food.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.eat.food[index];
                  return Text(ingredient, 
                  style: const TextStyle(fontSize: 18 , fontFamily: 'Montserrat', color: Color.fromARGB(255, 194, 116, 7)),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
