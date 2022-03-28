import 'package:http/http.dart' as  http;
import '../Models/profile.dart';



class Api_Manager{
  static Future<List<DumyModel>?> getData()async {
    var res = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    if(res.statusCode==200){
      var resString = res.body;
      return dumyModelFromJson(resString);
    }
  }
}



