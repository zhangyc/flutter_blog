import 'package:flutter/material.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});
  static const routeName='lib/mobile/main/person_page';

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('person'),
    );
  }
}
