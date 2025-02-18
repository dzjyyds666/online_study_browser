import 'package:online_study_browser/utils/constant.dart';
import 'package:online_study_browser/utils/shared_preference_clien.dart';

class Utils{
  static Future<String?> getUserToken()async{
    final token =  Prefs.instance.prefs.getString(Constant.Token);
    return token;
  }
}