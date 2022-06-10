import 'package:belajar_bloc/color_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ColorBloc bloc = ColorBloc();
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    bloc.eventSink.add(ColorEvent.to_amber);
                  },
                  backgroundColor: Colors.amber,
                ),
                SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  onPressed: () {
                    bloc.eventSink.add(ColorEvent.to_light_blue);
                  },
                  backgroundColor: Colors.lightBlue,
                ),
              ],
            ),
            appBar: AppBar(
              title: Text("Bloc tanpa Library"),
            ),
            body: Center(
                child: StreamBuilder(
              stream: bloc.stateStream,
              initialData: Colors.amber,
              builder: (context, snapshot) {
                return AnimatedContainer(
                  width: 100,
                  height: 100,
                  color: snapshot.data,
                  duration: Duration(microseconds: 500),
                );
              },
            ) //membuild widget setiap kali mendapat update dari stream
                )));
  }
}
