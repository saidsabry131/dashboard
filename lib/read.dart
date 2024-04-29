import 'package:dashboard2/core/SqlDB.dart';
import 'package:flutter/material.dart';


class REAd extends StatelessWidget {
  

  SqlDB objdb=SqlDB();
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Button Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Insert button
              ElevatedButton(
                onPressed: ()  async{
    String sql = 'Delete from User ';
    List<dynamic> values = [200, 'said', 20, '25'];

                  int res = await objdb.insertData(
                   sql
                  );

                  print("reslut $res");
                },
                child: Text('Insert'),
              ),
              SizedBox(height: 16), // Adds some space between the buttons
              
              // Show button
              ElevatedButton(
                onPressed: () async {
                  String sql = 'SELECT * FROM "User"';
                  List<Map> res=await objdb.readData(sql);
                  for(var el in res)
                  {
                    print(el);
                  }
                },
                child: Text('Show'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}