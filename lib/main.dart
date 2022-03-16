import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_api_data_8/models.dart';
import 'package:http/http.dart' as http;

import 'DummyModels/dumy.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        backgroundColor: Colors.yellow,
      ),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home:  MyHomePage(title: 'Api Data',id: 1472),
    home: DummyApp(),
    );
  }
}
















class MyHomePage extends StatefulWidget {
   MyHomePage({Key? key, required this.title,  required this.id}) : super(key: key);

  final String title;
  final int id;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {



  Future<AlbumModel>? _myRecord;

@override
  void initState() {
    // TODO: implement initState
     super.initState();
    _myRecord = APi_Manager().getData();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body:FutureBuilder<AlbumModel>(
          future: _myRecord,
          builder: (context,snapshot){
            return ListView.builder(
                //itemCount:snapshot.data?.avatarUrl.toString().length,
               itemCount: 2,
                itemBuilder: (context,index){
                  //var records = snapshot.data?.email[index];
                  return Card(
                    child: ListTile(
                      selectedColor: Colors.red,
                      tileColor: Colors.amber,
                      minVerticalPadding: 110,
                      title:Text(snapshot.data?.name??" "),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color:Colors.transparent,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      snapshot.data?.avatarUrl.toString() ??""
                                  ),
                              ),
                            ),
                          ),
                          Text(snapshot.data?.followers.toString() ??""),
                          Text(snapshot.data?.createdAt.toString()??""),
                          Text(snapshot.data?.updatedAt.toString()??""),
                        ],
                      ) ,
                    ),
                  );
                }
                );
          }
          )
    );
  }
}


class APi_Manager{
Future <AlbumModel> getData()async {
  var albumModel = null;
  try {
    var res = await http.get(Uri.parse("https://api.github.com/users/desi-programmer"));
    var resString = res.body;
      var resMap = json.decode(resString);
      print(res.body);
      print("-------------------------");
      print(resMap);
      albumModel = AlbumModel.fromJson(resMap);
      print("*******************");
      print(albumModel.toString());

  } catch(Exception){
    return albumModel;
  }
  return albumModel;
}



}