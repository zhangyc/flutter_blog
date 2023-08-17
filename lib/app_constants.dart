import 'package:hive_flutter/hive_flutter.dart';

const userBox="user";
String _userToken='userToken';
String _email='email';
String _password='password';

String get userToken => Hive.box(userBox).get(_userToken,defaultValue: '');

set userToken(String value) {
  Hive.box(userBox).put(_userToken,value);
}
String get email => Hive.box(userBox).get(_email,defaultValue: '');

set email(String value) {
  Hive.box(userBox).put(_email,value);
}
String get password => Hive.box(userBox).get(_password,defaultValue: '');

set password(String value) {
  Hive.box(userBox).put(_password,value);
}