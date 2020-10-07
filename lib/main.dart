import 'package:flutter/material.dart';
import './Widget/New_Transaction.dart';
import 'models/Transaction.dart';
import 'Widget/Transaction_List.dart';
import './Widget/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.black,
        errorColor: Colors.red,
        textTheme: ThemeData.light().textTheme.copyWith(
        button: TextStyle(color: Colors.white),),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // String titleInput;
  // String amountInput ;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final List< Transaction > _userTransactions =[
    // Transaction(
    //   id: 't1',
    //   title:'New Shoes' ,
    //   amount :150.00 ,
    //   date : DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title:'New T_Shirt' ,
    //   amount :200.00 ,
    //   date : DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransactions{
    return _userTransactions.where((tx){
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String txTitle , double txAmount, DateTime chosenDate){
    final newTx = Transaction(
      title:txTitle ,
      amount:txAmount ,
      date:chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return GestureDetector(
      onTap: (){},
       child: NewTransaction(_addNewTransaction),
        behavior: HitTestBehavior.opaque,
      );
    },);
  }
  void _deleteTransaction(String id){
    setState(() {
      _userTransactions.removeWhere((tx){
        return tx.id == id;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
     appBar: AppBar(
        title: Text('Personal Expenses'),
       actions: <Widget>[
       //  IconButton(
        //   icon: Icon(Icons.add) , onPressed: () => _startAddNewTransaction(context),
        // ),
       ],
    ),
     body: SingleChildScrollView(
     child:Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
      Chart(_recentTransactions),
      TransactionList(_userTransactions , _deleteTransaction),
      ],
     ),
    ),
        //  floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
           child: Icon(Icons.add),
    backgroundColor: Theme.of(context).accentColor,
    onPressed:  () => _startAddNewTransaction(context),
    ),
    );
    }
}

//   class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//   setState(() {
//
//   _counter++;
//   });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//
//   return Scaffold(
//   appBar: AppBar(
//
//   title: Text(widget.title),
//   ),
//   body: Center(
//   child: Column(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: <Widget>[
//   Text(
//   'You have pushed the button this many times:',
//   ),
//   Text(
//   '$_counter',
//   style: Theme.of(context).textTheme.headline4,
//   ),
//   ],
//   ),
//   ),
//   floatingActionButton: FloatingActionButton(
//   onPressed: _incrementCounter,
//   tooltip: 'Increment',
//   child: Icon(Icons.add),
//   ),
//   );
//   }
//   }
// }
