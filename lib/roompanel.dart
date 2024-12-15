import 'package:flutter/material.dart';

class RoomPanel extends StatefulWidget {
  @override
  State<RoomPanel> createState() => _RoomPanelState();
}

class NewItem {
  bool isExpanded;
  final Widget? header;
  final String? selection;
  final String? body;

  NewItem({
    this.isExpanded = false,
    this.header,
    this.selection,
    this.body,
  });
}

class _RoomPanelState extends State<RoomPanel> {
  List<NewItem> items = <NewItem>[
    NewItem(
        isExpanded: false,
        header: Container(
          child: Image(
              height: 100, width: 200, image: AssetImage('assets/bigroom.jpg')),
        ),
        selection: "King Room",
        body: "A room with a king-sized bed."),
    NewItem(
        isExpanded: false,
        header: Container(
          child: Image(
              height: 100,
              width: 200,
              image: AssetImage('assets/mediumroom.jpg')),
        ),
        selection: "Double Room",
        body: "A room assigned to two people"),
    NewItem(
        isExpanded: false,
        header: Container(
          child: Image(
              height: 100, width: 200, image: AssetImage('assets/kidroom.jpg')),
        ),
        selection: "Family Room",
        body: "A late room assigned to three or four people"),
  ];
  ListView? ListCriteria;

  @override
  Widget build(BuildContext context) {
    ListCriteria = ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                items[index].isExpanded = !items[index].isExpanded ;
                print('expanded');
                print(items[index].isExpanded);
              });
            },
            children: items.map((NewItem item) {
              return ExpansionPanel(
                  headerBuilder: (BuildContext, bool isExpanded) {
                    return ListTile(
                      leading: item.header,
                      title: Text(
                        item.selection as String,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 08.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent),
                      ),
                    );
                  },
                  isExpanded: item.isExpanded as bool,
                  body: Text(
                    item.body as String,
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ));
            }).toList(), // this one must be a List. collapse this to read better
          ),
        )
      ],
    );
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text(
          'Rooms List',
          style: TextStyle(fontSize: 25.0, color: Colors.white),
        ),
      ),
      body: ListCriteria,
      persistentFooterButtons: <Widget>[
        OverflowBar(
          alignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton(child: const Text('Button 1'), onPressed: () {}),
            TextButton(child: const Text('Button 2'), onPressed: () {}),
            TextButton(child: const Text('Button 3'), onPressed: () {}),
          ],
        )
      ],
    );
    return scaffold;
  }
}
