import 'package:bankingapp/pages/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:bankingapp/pages/Customers.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:expansion_card/expansion_card.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final dbhelper = Databasehelper.instance;

  TextEditingController se = TextEditingController();
  TextEditingController re = TextEditingController();
  TextEditingController am = TextEditingController();
  String semail, remail;
  double amount;

  void initState() {
    super.initState();
    queryall2();
  }

  final db = Databasehelper.instance;
  var allrows;
  int k;
  List<Map<String, dynamic>> items = List<Map<String, dynamic>>();
  void queryall2() async {
    allrows = await db.queryall2();
    allrows.forEach((element) {
      items.add(element);
    });
    print('===================');
    print(items);
    print('===================');
  }

 Future hello(){
   print('refresh');
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.grey[100],
        appBar: AppBar(title: Text('Transaction History')),
        body: RefreshIndicator(
          onRefresh: (){
            setState(() {
              items;
            });
            return Future.delayed(const Duration(seconds: 1));
          },
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return new Card(
                  color:Colors.grey[600],
                  child: ExpansionTile(
                    title: Text(
                      '\nSender:${items[index]['semail']}\n \t\t\t\t\t Receiver:${items[index]['remail']}\n',
                      style:
                          TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Amount:${items[index]['amount']}',
                          style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ));
  }
}
