import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'color_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ColorBloc>(
          create: (context) => ColorBloc(), child: MainPage()),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    //perintah mengambil objek bloc provider dari root nya
    //bloc provider juga akan menangani masalah dispose
    //kalau sudah tidak di pakai
    return Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                bloc.add(ColorEvent.to_amber);
              },
              backgroundColor: Colors.amber,
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                bloc.add(ColorEvent.to_light_blue);
              },
              backgroundColor: Colors.lightBlue,
            )
          ],
        ),
        appBar: AppBar(
          title: Text("Bloc dengan Flutter Bloc"),
        ),
        body: Center(
          child: BlocBuilder<ColorBloc, Color>(
            //tipe bloc,statenya
            builder: (context, currentColor) => AnimatedContainer(
              width: 100,
              height: 100,
              color: currentColor,
              duration: Duration(milliseconds: 500),
            ),
          ),
        ));
  }
}
