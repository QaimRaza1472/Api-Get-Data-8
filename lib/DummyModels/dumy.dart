import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_api_data_8/models.dart';
import 'package:http/http.dart' as http;

import 'dummymodels.dart';




class DummyApp extends StatelessWidget {
  const DummyApp({Key? key}) : super(key: key);

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
      home:  const MyHomePage(title: 'Api Data',id: 1472),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title,  required this.id}) : super(key: key);

  final String title;
  final int id;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {



  List<DumyModel>? _dummy_myRecord;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
     listdata();


     //_dummy_myRecord = await  Dummy_APi_Manager().getData();

  }


  void listdata()async{
    _dummy_myRecord=  await Dummy_APi_Manager().getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: () {
          print("Button Pressed");
        },
        icon: Container(
          height: 50,
          width: 220,
          decoration: const BoxDecoration(
            color: Colors.yellow,
          ),
        ),
      ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        /*body:FutureBuilder<DumyModel>(
            future: _dummy_myRecord,
            builder: (context,snapshot){
              return ListView.builder(
                //itemCount:snapshot.data?.avatarUrl.toString().length,
                  itemCount: 2,
                  itemBuilder: (context,index){
                    var records = snapshot.data;
                    return Card(
                      child: ListTile(
                        selectedColor: Colors.red,
                        tileColor: Colors.amber,
                        minVerticalPadding: 30,

                       // title:Text(snapshot.data?.name??" "),

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
                                      snapshot.data?.url![index] ?? ""
                                  ),
                                ),
                              ),
                            ),


                            //Text(snapshot.data!.id.toString()),
                            Text(records?.id![index] ??" "),
                            //Text(snapshot.data?.updatedAt.toString()??""),
                          ],
                        ) ,
                      ),
                    );
                  }
              );
            }
        )*/


      body: _dummy_myRecord!=null
     ? ListView.builder(
        //itemCount:snapshot.data?.avatarUrl.toString().length,
        itemCount: _dummy_myRecord?.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              selectedColor: Colors.red,
              tileColor: Colors.amber,
              minVerticalPadding: 30,
              // title:Text(snapshot.data?.name??" "),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                            _dummy_myRecord![index].url.toString()
                        ),
                      ),
                    ),
                  ),
                  //Text(snapshot.data!.id.toString()),
                  Text(_dummy_myRecord![index].title.toString()),
                  //Text(snapshot.data?.updatedAt.toString()??""),
                ],
              ) ,
            ),
          );
        }
    ):
     const Center(
    child: CircularProgressIndicator(),
    ),


    );
  }
}


/*class Dummy_APi_Manager{
  Future<List<DumyModel>> getData()async {
    var dumyModel = null;
    try {
      var res = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
      var resString = res.body;
      var resMap = json.decode(resString);
      print(res.body);
      print("-------------------------");
      print(resMap);
      dumyModel = DumyModel.fromJson(resMap);
      print("*******************");
      print(dumyModel.toString());

    } catch(Exception){
      return dumyModel;
    }
    return dumyModel;
  }



}*/


class Dummy_APi_Manager{
  Future<List<DumyModel>?> getData()async {
      var res = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
      if(res.statusCode==200){
        var resString = res.body;
      return dumyModelFromJson(resString);
      }
  }
}

