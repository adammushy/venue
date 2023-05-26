import 'package:flutter/material.dart';

class ConferenceVenue extends StatefulWidget {
  const ConferenceVenue({super.key});

  @override
  State<ConferenceVenue> createState() => _ConferenceVenueState();
}

class _ConferenceVenueState extends State<ConferenceVenue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:  ;
      // drawer: Drawer(child: row),
      body: Container(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Drawer(),
            ],
          )
        ]),
      ),
    );
  }
}
