import 'package:countdown_timer/countDownText.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    DateTime nextMon = today.add(
      Duration(
        days: (DateTime.monday - today.weekday) % DateTime.daysPerWeek,
        hours: (24 - DateTime.now().hour),
        minutes: (60 - DateTime.now().minute),
        seconds: (60 - DateTime.now().second),
      ),
    );

    DateTime endDate = DateTime(2022, 12, 25);

    return Scaffold(
      appBar: AppBar(
        title: const Text("CountDown Timers"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //? tabular timer with short label
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepPurpleAccent,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                      ),
                    ]),
                child: CountDownText(
                  due: endDate,
                  finishedText: "done",
                  style: const TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              //? tabular timer long label
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.redAccent,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                      ),
                    ]),
                child: CountDownText(
                  due: endDate,
                  finishedText: "done",
                  longDateName: true,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              //? linear timer without labels
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.greenAccent,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                      ),
                    ]),
                child: CountDownText(
                  due: endDate,
                  isHorizontal: false,
                  finishedText: "done",
                  longDateName: true,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              //? linear timer with long labels
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                      ),
                    ]),
                child: CountDownText(
                  due: endDate,
                  showLabel: true,
                  isHorizontal: false,
                  finishedText: "done",
                  longDateName: true,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              //? linear timer with short labels
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.lightBlueAccent,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                      ),
                    ]),
                child: CountDownText(
                  due: endDate,
                  showLabel: true,
                  isHorizontal: false,
                  finishedText: "done",
                  longDateName: false,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
