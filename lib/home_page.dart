import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;

import "model.dart";


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MyApiFile> myApiFile = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("My App")),
      body: FutureBuilder(future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(itemCount: myApiFile.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      margin: EdgeInsets.all(10),
                      height: 130,
                      color: Colors.greenAccent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('User id: ${myApiFile[index].userId}'),
                          Text('Id: ${myApiFile[index].id}'),
                          Text("Title: ${myApiFile[index].title}",maxLines: 1,),
                          Text("Body: ${myApiFile[index].body}",maxLines: 1,),

                        ],
                      ),
                    );
                  }
              );
            }
            else {
              return Center(child: CircularProgressIndicator());
            }
          }
      ),

    );
  }
  Future<List<MyApiFile>> getData() async {
  final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

  var data = jsonDecode(response.body.toString());
  if(response.statusCode == 200) {
    for(Map<String,dynamic> index in data){

      myApiFile.add(MyApiFile.fromJson(index));
    }
    return myApiFile;
  }
  else {
    return myApiFile;
  }
  }
}



