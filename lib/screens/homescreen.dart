import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:venue/screens/profilescreen.dart';
import 'package:venue/widgets/styles.dart';
import '../services/AuthenticationService.dart';
import 'weddings.dart';
import 'package:nice_buttons/nice_buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  late int _currentIndex;
  int _selected = 0;
  // final double _notchedValue = 5;


  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }
  User? user = FirebaseAuth.instance.currentUser;

  void changePage(int? index,) {
    setState(() {
      _currentIndex = index!;
      if (index == 3) {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ServiceScreen(),
        //   ),
        // );
      } else if (index == 2 && user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserProfilePage(user: user),
          ),
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    var currentIndex;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Card(
                    elevation: 40,
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("assets/images/lights.gif"),
                              fit: BoxFit.cover)),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: 180,
                        // child: Image(
                        //   image: AssetImage("assets/images/lights.gif"),
                        // ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: NiceButtons(
                      startColor: primaryColor,
                      endColor: Color.fromARGB(210, 11, 0, 0),
                      progressColor: Color.fromARGB(255, 223, 73, 73),
                      borderColor: Color.fromARGB(47, 235, 57, 57),
                      height: 150,
                      width: 150,
                      stretch: false,
                      gradientOrientation: GradientOrientation.Horizontal,
                      onTap: (finish) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    WeddingVenues()));
                        print('On tap called');
                      },
                      child: Text(
                        'Wedding Halls',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: NiceButtons(
                      startColor: primaryColor,
                      endColor: Color.fromARGB(210, 11, 0, 0),
                      progressColor: Color.fromARGB(255, 223, 73, 73),
                      borderColor: Color.fromARGB(47, 235, 57, 57),
                      height: 150,
                      width: 150,
                      stretch: false,
                      gradientOrientation: GradientOrientation.Horizontal,
                      onTap: (finish) {
                        print('On tap called');
                      },
                      child: Text(
                        'Conference Halls',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: NiceButtons(
                      startColor: primaryColor,
                      endColor: Color.fromARGB(210, 11, 0, 0),
                      progressColor: Color.fromARGB(255, 223, 73, 73),
                      borderColor: Color.fromARGB(47, 235, 57, 57),
                      height: 150,
                      width: 150,
                      stretch: false,
                      gradientOrientation: GradientOrientation.Horizontal,
                      onTap: (finish) {
                        print('On tap called');
                      },
                      child: Text(
                        'Birthday Halls',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: NiceButtons(
                      startColor: primaryColor,
                      endColor: Color.fromARGB(210, 11, 0, 0),
                      progressColor: Color.fromARGB(255, 223, 73, 73),
                      borderColor: Color.fromARGB(47, 235, 57, 57),
                      height: 150,
                      width: 150,
                      stretch: false,
                      gradientOrientation: GradientOrientation.Horizontal,
                      onTap: (finish) {
                        print('On tap called');
                      },
                      child: Text(
                        //  textAlign:TextAlign.left,
                        'Multipurpose Halls',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.red,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: _currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        // fabLocation: BubbleBottomBarFabLocation.end, //new
        // hasNotch: true, //new
        hasInk: true, //new, gives a cute ink effect
        inkColor: Colors.black12, //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.dashboard,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.dashboard,
                color: Colors.red,
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                Icons.access_time,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.access_time,
                color: Colors.deepPurple,
              ),
              title: Text("Logs")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.person_2,
                color: Colors.indigo,
              ),
              title: Text("Folders")),
          BubbleBottomBarItem(
              backgroundColor: Colors.green,
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.menu,
                color: Colors.green,
              ),
              title: Text("Menu"))
        ],
      ),
    );
  }

  // void changePage(int va) {
  //   return null;
  // }
}
