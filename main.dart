import 'package:flutter/material.dart';
import 'fullmenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'NYCDOE Menu',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Color(0x8B94A3),
          secondary: Color(0x8B94A3),
        ),
      ),
      home: const MyHomePage(title: 'NYCDOE Menu for the Week'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // 1
    return Scaffold(
       backgroundColor: const Color.fromARGB(255, 100, 100, 101),
      // 2
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // 3
      body: SafeArea(
        // 4
        child: ListView.builder(
          // 5
          itemCount: FullDay.samples.length,
          // 6
          itemBuilder: (BuildContext context, int index) {
            // 7
            return GestureDetector(
              // 8
              onTap: () {
                // 9
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // 10
                      return FullMenu(eat: FullDay.samples[index]);
                    },
                  ),
                );
              },
              // 11
              child: buildRecipeCard(FullDay.samples[index]),
            );
          },
        ),
      ),
    );
  }

  Widget buildRecipeCard(FullDay food) {
    return Card(
      color: const Color.fromRGBO(25, 28, 64, 1.0),
      // 1
      elevation: 2.0,
      // 2
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      // 3
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // 4
        child: Column(
          children: <Widget>[
            Image(image: AssetImage(food.imageUrl)),
            // 5
            const SizedBox(
              height: 14.0,
            ),
            // 6
            Text(
              '${food.day}: ${food.label}',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
                color: Color.fromARGB(255, 194, 116, 7),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FullDay {
  String label;
  String imageUrl;
  String day;
  List<String> food;

  FullDay(this.label, this.imageUrl, this.day, this.food);

  static  List<FullDay> samples = [
    FullDay('Zucchini Carrot Breakfast Bread', 'assets/CarrotZucchiniBread.jpeg', 'Monday', 
        ['New York Yogurt', 'Hot Oatmeal', 'Seasonal Fresh Fruit']),
    FullDay('Mini Blueberry Waffles', 'assets/BlueberryWaffles.jpeg', 'Tuesday', 
        ['Fresh Plums']),
    FullDay('Banana Muffin', 'assets/BananaMuffin.jpg', 'Wednesday', 
        ['Mozarella Cheese Sticks', 'Fresh Oranges']),
    FullDay('Buttermilk Pancakes', 'assets/ButtermilkPancakes.jpg', 'Thursday', ['Fresh Apples']),
    FullDay('Assorted Fresh Bagels with Cream Cheese', 'assets/bagel.jpg', 'Friday', ['Fresh Pears'])
  ];

}
