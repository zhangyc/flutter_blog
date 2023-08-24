import 'package:hive_flutter/hive_flutter.dart';

const userBox="user";
String _userToken='userToken';
String _email='email';
String _password='password';
String _blogs='blogs';
String _tags='tags';
String _categories="categories";
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
String get blogs => Hive.box(userBox).get(_blogs,defaultValue: '');

set blogs(String value) {
  Hive.box(userBox).put(_blogs,value);
}
String get tags => Hive.box(userBox).get(_tags,defaultValue: '');

set tags(String value) {
  Hive.box(userBox).put(_tags,value);
}
String get categories => Hive.box(userBox).get(_categories,defaultValue: '');

set categories(String value) {
  Hive.box(userBox).put(_categories,value);
}