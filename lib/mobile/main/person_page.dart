import 'package:blog/mobile/main/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});
  static const routeName='lib/mobile/main/person_page';

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.maybeOf(context)!.padding.top,
            ),
            SizedBox(height: 16,),
            SizedBox(
              width: 100,
              height: 100,
              child: CircleAvatar(
                child: FlutterLogo(),
              ),
            ),
            SizedBox(height: 16,),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('文章',style: TextStyle(fontSize: 20),),
                      Text('21')
                    ],
                  ),
                  Column(
                    children: [
                      Text('分类',style: TextStyle(fontSize: 20),),
                      Text('21')
                    ],
                  ),
                  Column(
                    children: [
                      Text('标签',style: TextStyle(fontSize: 20),),
                      Text('21')
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16,),
            Row(
              children: [
                Icon(Icons.message),
                SizedBox(width: 16,),
                Text('说说')
              ],
            ),
            SizedBox(height: 16,),
            Row(
              children: [
                Icon(Icons.type_specimen_outlined),
                SizedBox(width: 16,),
                Text('分类')
              ],
            ),
            SizedBox(height: 16,),
            Row(
              children: [
                Icon(Icons.tag),
                SizedBox(width: 16,),
                Text('标签')
              ],
            ),
            SizedBox(height: 16,),
            Row(
              children: [
                Icon(Icons.description),
                SizedBox(width: 16,),
                Text('关于')
              ],
            ),
            SizedBox(height: 16,),
            Row(
              children: [
                Icon(Icons.note),
                SizedBox(width: 16,),
                Text('留言')
              ],
            ),
            SizedBox(height: 16,),
            Row(
              children: [
                Icon(Icons.logout),
                SizedBox(width: 16,),
                Text('退出')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
