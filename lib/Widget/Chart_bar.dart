import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';

class ChartBar extends StatelessWidget{

  final String label;
  final double spendingAmount;
  final double spendingPct0fTotal;

  ChartBar(this.label , this.spendingAmount , this.spendingPct0fTotal,);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Container(
          height: 20,
        child: FittedBox(
          child: Text('${spendingAmount.toStringAsFixed(0)}L.E',),
        ),
    ),
    SizedBox(height:4,),
      Container(
       height: 60,
       width: 10,
       child: Stack(
         children:[
           Container(
             decoration: BoxDecoration(
               border: Border.all(color: Colors.grey, width: 1.0,),
               color: Color.fromRGBO(220,220,220,1),
               borderRadius: BorderRadius.circular(10),
             ),
           ),
           FractionallySizedBox(
             heightFactor: spendingPct0fTotal,
             child:Container(
               decoration: BoxDecoration(
                 color: Theme.of(context).primaryColor,
                 borderRadius: BorderRadius.circular(10),
               ),
             ),
           ),
         ],
       ),
    ),
    SizedBox(height: 4,),
        Text(label),
        ],
    );
  }
}