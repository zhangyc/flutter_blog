import 'package:blog/mobile/creation/creation_blog.dart';
import 'package:blog/mobile/main/home_page.dart';
import 'package:blog/mobile/main/person_page.dart';
import 'package:blog/util/ex_buildcontext.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _HomePageState();
}

class _HomePageState extends State<MainPage> with SingleTickerProviderStateMixin{
  HomeBody homeBody=HomeBody.home;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeBody==HomeBody.home?HomePage():PersonPage(),
      bottomNavigationBar: BottomNavigationBar(items:
      [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: ''),
      ],
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: (value){

           homeBody=HomeBody.values[value];
           setState(() {

           });
        },
        currentIndex: homeBody.index,

      ),
      floatingActionButton: FloatingActionButton.small(onPressed: (){
         context.goName(CreationBlog());
      }),
    );
  }
}
enum HomeBody{
  home,
  person
}