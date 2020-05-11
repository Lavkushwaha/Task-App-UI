import 'package:flutter/material.dart';

class Extra extends StatefulWidget {
  @override
  _ExtraState createState() => _ExtraState();
}

class _ExtraState extends State<Extra> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
            onPressed: () {}),
        title: Text(
          'Task',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.calendar_today,
                color: Colors.grey,
              ),
              onPressed: () {})
        ],
      ),
      body: ListView(
        children: <Widget>[horizontalListView(), taskList()],
      ),
      // body: horizontalListView(),
      floatingActionButton: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
        elevation: 4.0,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {},
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),

              // boxShadow: [BoxShadow(blurRadius: 6.0, color: Colors.grey)]
            ),
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  horizontalListView() {
    return Container(
      height: 200,
      color: Colors.grey.withOpacity(0.3),
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          singleTaskElement(Colors.blue),
          singleTaskElement(Colors.orange),
          singleTaskElement(Colors.purple),
          singleTaskElement(Colors.green),
        ],
      ),
    );
  }

  singleTaskElement(color) {
    return Container(
      // height: 100,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 6.0, color: Colors.grey)],
            color: color,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '4 Tasks',
                style: TextStyle(fontSize: 13, color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'All Tasks',
                style: TextStyle(
                    fontSize: 25,
                    // fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  taskList() {
    return Container(
      color: Colors.grey.withOpacity(0.3),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Today',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 10,
          ),
          TaskListElement(true, '12:00 Morning', 'Go to shop'),
          TaskListElement(false, '12:00 Morning', 'Go to shop'),
          TaskListElement(false, '12:00 Morning', 'Go to shop'),
          TaskListElement(true, '12:00 Morning', 'Go to shop'),
        ],
      ),
    );
  }

  taskListElement() {
    return Container(
      height: 80,
      // color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      // height: 60,
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Buy Aquarium',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '12:00 AM Present',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
          Icon(Icons.delete)
        ],
      ),
    );
  }
}

class TaskListElement extends StatefulWidget {
  var title;
  var time;
  var status;
  // final color;

  TaskListElement(this.status, this.time, this.title);
  @override
  _TaskListElementState createState() => _TaskListElementState();
}

class _TaskListElementState extends State<TaskListElement> {
  var taskStatus;

  @override
  void initState() {
    super.initState();
    taskStatus = widget.status ?? false;
  }

  _toggle() {
    print(widget.status);
    print(!widget.status);
    taskStatus = !taskStatus;
    this.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      // color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: taskStatus == true ? Colors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: taskStatus == false
                            ? Border.all(width: 3, color: Colors.grey)
                            : null),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          print('click');
                          _toggle();
                        },
                        child: taskStatus == true
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 14,
                              )
                            : Text(''),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      // height: 60,
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 16,
                        color: taskStatus == true ? Colors.grey : Colors.black,
                        decoration: taskStatus == true
                            ? TextDecoration.lineThrough
                            : null),
                  ),
                  Text(
                    widget.time,
                    style: TextStyle(
                        fontSize: 20,
                        color: taskStatus == true ? Colors.grey : Colors.black,
                        decoration: taskStatus == true
                            ? TextDecoration.lineThrough
                            : null),
                  ),
                ],
              )
            ],
          ),
          taskStatus == true
              ? Icon(
                  Icons.delete,
                  color: Colors.grey,
                )
              : Icon(
                  Icons.notifications_active,
                  color: Colors.grey,
                )
        ],
      ),
    );
  }
}
