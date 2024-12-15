import 'package:flutter/material.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var isSelected = false;
  var adultNum = 0.0;
  var childNum = 0.0;
  final controller = GroupController();

  DateTime checkInDate = DateTime.now();
  DateTime checkOutDate = DateTime.now();

  Future<Null> selectedDateIn(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: checkInDate,
        firstDate: DateTime(2024),
        lastDate: DateTime(2025)) as DateTime;

    if (picked != null && picked != checkInDate) {
      setState(() {
        checkInDate = picked;
      });
    }
  }

  Future<Null> selectedDateOut(BuildContext context) async {
    final DateTime pickedout = await showDatePicker(
        context: context,
        initialDate: checkOutDate,
        firstDate: DateTime(2024),
        lastDate: DateTime(2025)) as DateTime;

    if (pickedout != null && pickedout != checkOutDate) {
      setState(() {
        checkOutDate = pickedout;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                'Android ATC Hotel',
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
              backgroundColor: Colors.orangeAccent,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Card(
                      child: Image(
                          image: NetworkImage(
                              'https://img.pikbest.com/backgrounds/20210920/booking-luxury-hotel-banner-background-eps_6126596.jpg!bw700')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Check in Date: '),
                          Text(
                            '${checkInDate.year} - ${checkInDate.month} - ${checkInDate.day}',
                            style: TextStyle(color: Colors.blue),
                          ),
                          IconButton(
                              onPressed: () => {selectedDateIn(context)},
                              icon: Icon(
                                Icons.date_range,
                                color: Colors.orangeAccent,
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Check Out Date: '),
                          Text(
                              '${checkOutDate.year} - ${checkOutDate.month} - ${checkOutDate.day}',
                              style: TextStyle(color: Colors.blue)),
                          IconButton(
                              onPressed: () {
                                selectedDateOut(context);
                              },
                              icon: Icon(
                                Icons.date_range,
                                color: Colors.orangeAccent,
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Adults: $adultNum',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            child: Slider(
                              value: adultNum,
                              onChanged: (newRating) {
                                setState(() {
                                  adultNum = newRating;
                                });
                              },
                              divisions: 6,
                              label: '$adultNum Adult',
                              min: 0,
                              max: 6,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Children: $childNum',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            child: Slider(
                              value: childNum,
                              onChanged: (newRating) {
                                setState(() {
                                  childNum = newRating;
                                });
                              },
                              divisions: 6,
                              label: '$childNum Adult',
                              min: 0,
                              max: 6,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Extras",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        child: SimpleGroupedCheckbox<int>(
                      controller: controller,
                      itemsTitle: [
                        'Breakfast (10 USD/Day)',
                        'Internet WiFi (5 USD/Day)',
                        'Parking (5 USD/Day)',
                        'Swimming pool (10 USD/Day)',
                      ],
                      values: [1, 2, 3, 4],
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Views: ",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        child: SimpleGroupedCheckbox<int>(
                      controller: controller,
                      itemsTitle: [
                        'City View',
                        'Sea View',
                      ],
                      values: [1, 2],
                    )),
                    ElevatedButton(
                        onPressed: ()=>{
                          Navigator.pushNamed(context, 'roomsPanel')
                        },
                        child: Text(
                          'Check Rooms and Rates',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),
              ),
            )));
  }
}
