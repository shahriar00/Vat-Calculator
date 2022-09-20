import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class tip extends StatefulWidget {
  const tip({Key? key}) : super(key: key);

  @override
  State<tip> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<tip> {

 int persentage = 0;
 int person = 1;
 double billamount = 0.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 120),
        color: Colors.white,

        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 180,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Per Person",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("${calculatetotalperperson(billamount,person,persentage)}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    )

                  ],
                ),
              ),
             
            ),
            Container(
              margin: EdgeInsets.all(12),
              padding:const EdgeInsets.all(12.0),

              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color:Colors.grey,
                  style: BorderStyle.solid              
                 ),
                 borderRadius: BorderRadius.circular(16)
                ),

                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(color: Colors.green),
                      decoration: InputDecoration(
                        prefixText: "Bill Amount: ",
                        prefixIcon: Icon(Icons.money)

                      ),
                      onChanged: (value) {
                        try{
                          billamount = double.parse(value);

                        }
                        catch(e){
                          billamount = 0.0;

                        }
                        
                      }

                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                      children: [
                        
                        Text("Spilt",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if(person>1){
                                    person--;
                                  }
                                  else{
                                    //do nothing
                                  }
                                });},
                               child:Container(
                                  height: 40,
                                  width: 40,
                                  margin: EdgeInsets.all(10),
                                 
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Colors.orange,
                                  ),
                                  child: Center(child: Text("-",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),

                                ),
                                
                              
                            ),
                            Text("$person",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                             InkWell(
                              onTap: () {
                                setState(() {
                                  person++;
                                });},
                               child:Container(
                                  height: 40,
                                  width: 40,
                                  margin: EdgeInsets.all(10),
                                 
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Colors.orange,
                                  ),
                                  child: Center(child: Text("+",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),

                                ),
                                
                              
                            ),
                            

                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tip",style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold),),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${calculatetotaltip(billamount, person, persentage)}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                        )
                      ],
                      
                    ),
                    Column(
                      children: [
                        Text("$persentage%",style: TextStyle(color: Colors.purple,fontSize: 20,fontWeight: FontWeight.bold),),

                        Slider(min: 0,max: 100,divisions: 10, value: persentage.toDouble(), onChanged: (double value){
                          setState(() {
                            persentage = value.round();
                            
                          });

                        })
                      ],
                    )
                  ],
                
                  
                ),

              ),

            
          ],

        ),

      ),


    );
    
  }
  calculatetotalperperson(double billamount,int splitBy,int tippersentage)
  {
    var total = (calculatetotaltip(billamount, splitBy, tippersentage)+billamount)/splitBy;
    return total.toStringAsFixed(2);


  }
  calculatetotaltip(double billamount,int splitBy,int tippersentage){
    double total = 0.0;

    if(billamount<0 ||billamount.toString().isEmpty||billamount == null)
    {
      //to go...
    }
    else{
      total = (billamount*tippersentage)/100;
    }
    return total;

  }
}
