import 'package:shared_preferences/shared_preferences.dart';  
class SharedUserPreferences{
  
  static SharedPreferences _preferences;
  static const _keyUserName="username";
  static const _keyPhone="phone";
  static const _keyEmail="email";

  static Future init() async =>
  _preferences =await SharedPreferences.getInstance(); 

  static Future setemail(String email)async =>
  await _preferences.setString( _keyEmail, email);

  static Future setphone(int phone)async =>
  await _preferences.setInt( _keyPhone, phone);

  static Future setusername(String username)async =>
  await _preferences.setString( _keyUserName, username);

 static String getusername()=>_preferences.getString(_keyUserName);
 static String getemail()=>_preferences.getString(_keyEmail);
 static String getphone()=>_preferences.getString(_keyPhone);
 }