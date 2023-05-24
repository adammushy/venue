import 'package:flutter/material.dart';
import '../screens/weddings.dart';
import 'package:nice_buttons/nice_buttons.dart';
import '../widgets/styles.dart';

class DetailPage extends StatelessWidget {
  final name;
  final location;
  final imgUrl;
  const DetailPage( this.name, this.location, this.imgUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      drawer:Drawer(semanticLabel: "Menu", elevation: 2,child:drawContent() ,backgroundColor: Color.fromARGB(255, 147, 148, 149),) ,
      
      body: Column(

        children: [
          SizedBox(height: 50,),
          Container(
          child: Image.asset(imgUrl),
        ), Text(
          name
        ),Text(location)],
      ),
    );
  }
  Widget drawContent(){
    return Container(
      child: Column(
        children: [
          SizedBox(height: 100,),
    
        NiceButtons(
                startColor: primaryColor,
                endColor: Color.fromARGB(210, 11, 0, 0),
                progressColor: Color.fromARGB(255, 223, 73, 73),
                borderColor: Color.fromARGB(47, 235, 57, 57),
                height: 50,
                stretch: true,
                gradientOrientation: GradientOrientation.Horizontal,
                onTap: (finish) {
                  print('On tap called');
                },
                child: Text(
                  'Full Width',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),NiceButtons(
                startColor: primaryColor,
                endColor: Color.fromARGB(210, 11, 0, 0),
                progressColor: Color.fromARGB(255, 223, 73, 73),
                borderColor: Color.fromARGB(47, 235, 57, 57),
                height: 50,
                stretch: true,
                gradientOrientation: GradientOrientation.Horizontal,
                onTap: (finish) {
                  print('On tap called');
                },
                child: Text(
                  'Full Width',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
        ],
      ),
    );
  }
}
