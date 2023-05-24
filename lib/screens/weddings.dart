import 'package:flutter/material.dart';
import 'package:venue/models/weddingmodel.dart';
import '../screens/details.dart';

class WeddingVenues extends StatefulWidget {
  const WeddingVenues({super.key});

  @override
  State<WeddingVenues> createState() => _WeddingVenuesState();
}

class _WeddingVenuesState extends State<WeddingVenues> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(180, 105, 109, 0.2),
      appBar: AppBar(title: Text("Weding venues")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Column(
                children: weddings.map((wed) {
                  return GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        child: Row(
                          children: <Widget>[
                            Container(
                                height: 80,
                                width: 80,
                                margin: EdgeInsets.symmetric(
                                  vertical: 1,
                                  horizontal: 15,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.purple,
                                    width: 2,
                                  ),
                                ),
                                padding: EdgeInsets.all(1),
                                child: Image.asset(wed.imgUrl)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  wed.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  wed.location,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DetailPage(wed.name,wed.location,wed.imgUrl)));
                    },
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
