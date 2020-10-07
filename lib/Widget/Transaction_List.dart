import 'package:flutter/material.dart';
import '../models/Transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget{
 final List<Transaction> Transactions ;
 final Function deleteTx;

 TransactionList(this.Transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
     height: 450,
      child: Transactions.isEmpty 
          ? Column(
              children:<Widget> [
                Text(
                  'No transactions added yet!',
                  style:Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child:Image(image: NetworkImage('https://img3.stockfresh.com/files/i/ichiosea/m/35/7469900_stock-photo-man-with-no-money-businessman-holding-empty-wallet.jpg',),
                  fit: BoxFit.cover,
                ),
                )
              ],
      )
      :ListView.builder(
        itemBuilder: (ctx, index){
          return Card(
            elevation: 5,
          margin: EdgeInsets.symmetric(
          vertical: 8,
            horizontal: 5,
          ),
            child:ListTile(
            leading: CircleAvatar(
             radius:30,
              child:Padding(
              padding: EdgeInsets.all(6),
              child: FittedBox(
                child: Text('${Transactions[index].amount}'+'L.E'),
              ),
          ),
          ),
            title: Text(
              Transactions[index].title,
            ),
            subtitle: Text(
              DateFormat.yMMMd().format(Transactions[index].date),
            ),
              trailing: IconButton(icon: Icon(Icons.delete),
                  color:Theme.of(context).errorColor,
                  onPressed: () => deleteTx(Transactions[index].id)),
          )
          );
          // return Card(
          //   child: Row(
          //     children: <Widget>[
          //       Container(
          //         margin: EdgeInsets.symmetric(
          //           vertical: 10,
          //           horizontal: 15,
          //         ),
          //         decoration: BoxDecoration(
          //           border: Border.all(
          //             color: Theme.of(context).primaryColor,
          //             width: 2,
          //           ),
          //         ),
          //         padding: EdgeInsets.all(10),
          //         child: Text(
          //           '\$${Transactions[index].amount.toStringAsFixed(2)}',
          //           style: TextStyle(
          //             fontSize:20,
          //             fontWeight:FontWeight.bold ,
          //             color:Theme.of(context).primaryColor,
          //           ),
          //         ),
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start ,
          //         children: <Widget>[
          //           Text(Transactions[index].title,
          //               style:TextStyle(
          //                 fontSize:16,
          //                 fontWeight: FontWeight.bold ,
          //               )
          //           ),
          //           Text(
          //             DateFormat().format(Transactions[index].date),
          //             style:TextStyle(
          //                 color: Colors.grey
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // );
        },
        itemCount: Transactions.length,
       ),
    );
   }
       }