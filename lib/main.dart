
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.darkThemeEnabled,
      initialData: false,
      builder: (context,snapshot) => MaterialApp(
        theme: snapshot.data == true ? ThemeData.dark() : ThemeData.light(),
        home: HomePage(snapshot.data == true )
      )
    );
  }
}

class HomePage extends StatelessWidget {

 final bool darkThemeEnabled;
  
  HomePage(this.darkThemeEnabled);


   @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          
            
            elevation: 1,
        ),
      
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text("Dark Theme"),
                trailing: Switch(
                    value: darkThemeEnabled,
                    onChanged: bloc.changeTheme,
                      
                
                ),
                
              
              )]
          ),
        ),
        
          
         

      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text('Settings',
            style: TextStyle(fontSize: 25, 
            fontWeight: FontWeight.w500),
            ),

            SizedBox(height: 40,),
            Row(
              children: [
                Icon(Icons.person, 
                color: Colors.black),
                SizedBox(width: 15,),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 18,
                  fontWeight: FontWeight.bold,),
                ),
              ],
            ),
                
                

          Divider(height: 15,
          thickness: 2),
          SizedBox(height: 10,),
          buildAccountOptionRow(context, "Phone Number","Input Phone Number"),
          buildAccountOptionRow(context, "Email Address","Input Email Address"),
          buildAccountOptionRow(context,"Social","Facebook"),
          buildAccountOptionRow(context,"Language","English"),
          
          SizedBox(height: 40,),
            Row(
              children: [
                Icon(Icons.volume_down_outlined, 
                color: Colors.black),
                SizedBox(width: 15,),
                Text(
                  "Notification",
                  style: TextStyle(fontSize: 18,
                   fontWeight: FontWeight.bold,),
                ),
                SizedBox(height: 45,),
                
              ],
            ),
                

          Divider(height: 15,
          thickness: 2),
          SizedBox(height: 10,),

          buildNotificationOptionRow("Group Notification",true),
          buildNotificationOptionRow("Personal Notification",true),
          buildNotificationOptionRow('Mute Notification',false),
            
          SizedBox(height: 50,),
            
          Center(
            child: OutlinedButton(
              
            onPressed: (){},
            
            child: Text("Log Out",
            style: TextStyle(fontSize: 15,
            letterSpacing: 2.2,
            // color: Colors.red,
            
            
            ),
          ),
        ),
        )
      ],
            
      ),
      ),  
      
    );

}
              
                

  Row buildNotificationOptionRow(String title , bool isActive) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
              style: TextStyle(fontSize: 18,
              fontWeight: FontWeight.w500,
              // color: Colors.black,
              
              

              ),
              ),
              SizedBox(height: 45,),
              Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(value:isActive, 
                onChanged: (bool val){},),
              )
            ],
          );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title, String value) {
    return GestureDetector(
          onTap: (){
            showDialog(
              context: context,
              builder:(BuildContext context){
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  Text(value),
                  
                ],
                ),
                actions: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // background
                        onPrimary: Colors.black // foreground
                      ),
                      onPressed: () { 
                        Navigator.of(context).pop();
                      },
                      child: Text('Confirm'),
                    )

                ],
              );
            
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  
                ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                )
        
              ],
            ),
          ),
        );
  }

}

class Bloc {
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}

final bloc = Bloc();

         
          

        
          
        
        
        
