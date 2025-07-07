import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: DashBoardScreen(),
    );
  }
}
class DashBoardScreen extends StatefulWidget{
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() {
    return MyHomePage();
  }
}
class MyHomePage extends State<DashBoardScreen>{

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var incController = TextEditingController();
  var bgcolor;
  var Result ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        color: bgcolor,
        child: Center(
          child: Container(
            width: 330,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI APP",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                SizedBox(height: 70,),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: wtController,
                  decoration: InputDecoration(
                    labelText: "Enter Your Weight (in kgs)",
                    prefixIcon: Icon(Icons.line_weight),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Colors.green,
                            width: 3
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Colors.green,
                            width: 3
                        )
                    ),

                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: ftController,
                  decoration: InputDecoration(
                    labelText: "Enter Your Height (in feet)",
                    prefixIcon: Icon(Icons.height),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Colors.green,
                            width: 3
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Colors.green,
                            width: 3
                        )
                    ),

                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: incController,
                  decoration: InputDecoration(
                    labelText: "Enter Your Height (in Inches)",
                    prefixIcon: Icon(Icons.height),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Colors.green,
                            width: 3
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Colors.green,
                            width: 3
                        )
                    ),

                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){

                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var Inc = incController.text.toString();

                  if(wt!="" && ft!="" && Inc!=""){

                    var iwt = int.parse(wt);
                    var ift = int.parse(ft);
                    var iInc = int.parse(Inc);

                    var tft = ift*0.3048;    // feet in meter
                    var tinc = iInc*0.0254;   // Inches in meter

                    var theight = tft + tinc;

                    var BMI = iwt / (theight*theight);

                    var msg ="";

                    if(BMI>25){
                      msg = "You're OverWeight!!";
                      bgcolor= Colors.orange.shade300;
                    }else if(BMI<18){
                      msg = "You're UnderWeight!!";
                      bgcolor= Colors.red.shade300;
                    }else{
                      msg = "You're Healthy!!";
                      bgcolor = Colors.green.shade300;
                    }

                    Result = "$msg \n You're BMI is ${BMI.toStringAsFixed(2)}";

                    setState(() {

                    });

                  }else{

                    setState(() {
                      Result = "Please Enter all the required Fields!!";
                    });
                  }



                },style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen
                ),
                    child: Text("Calculate",style: TextStyle(color: Colors.white,fontSize: 15),)),
                SizedBox(height: 20,),
                Text(Result,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
        ),
      ),
    );
  }

}
