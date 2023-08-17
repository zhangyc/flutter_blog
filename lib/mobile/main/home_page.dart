import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName='lib/mobile/main/home_page';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(child: Column(
      //
      // ), preferredSize: Size(MediaQuery.maybeOf(context)!.size.width, 100)),
      body: ListView.separated(itemBuilder: (_,i){
        return Container(
          clipBehavior: Clip.antiAlias,
          child: Column(
              children: [
                ExtendedImage.network('url'),

              ],
          ),
        );
      }, separatorBuilder: (_,i){
        return SizedBox(height: 10,);
      }, itemCount: 20),
    );
  }
}
