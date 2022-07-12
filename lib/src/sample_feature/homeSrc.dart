import 'package:birmbenawa/src/sample_feature/reminder_screen.dart';
import 'package:flutter/material.dart';
class GoHomePage extends StatefulWidget {
  GoHomePage({Key? key}) : super(key: key);

  @override
  State<GoHomePage> createState() => _HomePageState();
}
class _HomePageState extends State<GoHomePage> {
  final String LogoPath = 'assets/images/slider/logo.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.all(32),
            child: Column(
              textDirection: TextDirection.rtl,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(60, 60, 60, 40),
                  child: Image.asset(LogoPath, width: 120,),
                ),
                Container(
                  child: Text('تۆمارکردن', style: TextStyle(fontFamily: 'KurdBold', fontSize: 22))
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 224, 224, 224),
                    borderRadius: BorderRadius.circular(25)
                  ),
                  margin: EdgeInsets.fromLTRB(20, 60, 20, 60),
                  padding: EdgeInsets.fromLTRB(30, 60, 30, 60),
                    child: Column(
                      
                      children: [
                        TextField ( 
                          style: TextStyle(),
                          decoration: InputDecoration(  
                          border: InputBorder.none,  
                          labelText: 'Enter Name',  
                           hintText: 'Enter Your Name'  
                        ),  
                      ), 
                      Divider( thickness: 4,),
                      TextField ( 
                          style: TextStyle(),
                          decoration: InputDecoration(  
                          border: InputBorder.none,  
                          labelText: 'Enter Name',  
                           hintText: 'Enter Your Name'  
                        ),  
                      ), 
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(24)),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.fromLTRB(40, 6, 0, 0),
                      height: 46,
                      width: 200,
                      child: Text('چوونەژوورەوە', style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'KurdBold'),),
                    ),
                    onPressed: () => goToHome(context),
                  )
              ],
            ),
          ),
          ),
       
    );
  }
  void goToHome(context) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => Reminderpage()));
}