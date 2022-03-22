import 'package:demoflutter/fact.page.dart';
import 'package:demoflutter/liked.page.dart';
import 'package:demoflutter/provider/fact.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FactProvider()),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cats fact',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF147067)
        )
      ),
      home: const Layout(),
    );
  }
}

class Layout extends StatefulWidget {
  const Layout({ Key? key }) : super(key: key);

  @override
  LayoutState createState() => LayoutState();
}

class LayoutState extends State<Layout> {
  int _currentTab = 0;
  List<Widget> tabs = [FactPage(), LikedPage()];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext ctx, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return webLayout();
        }
        return mobileLayout();
      },
    );
  }

  Widget webLayout() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cats fact"),
        actions: [
          TextButton(onPressed: () { setState(() { _currentTab = 0; }); }, child: Text("Fact", style: TextStyle(color: Colors.white))),
          TextButton(onPressed: () { setState(() { _currentTab = 1; }); }, child: Text("Saved", style: TextStyle(color: Colors.white)))
        ],
      ),
      body: tabs[_currentTab],
    );
  }

  Widget mobileLayout() {
    return Scaffold(
      appBar: AppBar(title: Text("Cats fact")),
      body: tabs[_currentTab],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentTab,
          onTap: (value) { setState(() { _currentTab = value; }); },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.lightbulb), label: "Fact"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Saved"),
          ]
      ),
    );
  }
}