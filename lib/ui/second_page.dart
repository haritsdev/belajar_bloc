import 'package:belajar_bloc/bloc/color_bloc.dart';
import 'package:belajar_bloc/bloc/counter_bloc.dart';
import 'package:belajar_bloc/ui/draft_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc colorBloc = BlocProvider.of<ColorBloc>(context);
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return BlocBuilder<ColorBloc, Color>(
      builder: (context, color) => DraftPage(
        backgroundColor: color,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<CounterBloc, int>(
                builder: (context, number) => GestureDetector(
                  onTap: () {
                    counterBloc.add(number + 1);
                  },
                  child: Text(
                    number.toString(),
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    color: Colors.pink,
                    onPressed: () {
                      colorBloc.add(ColorEvent.toPink);
                    },
                    shape: (color == Colors.pink)
                        ? CircleBorder(
                            side: BorderSide(color: Colors.black, width: 3))
                        : CircleBorder(),
                  ),
                  MaterialButton(
                    color: Colors.amber,
                    onPressed: () {
                      colorBloc.add(ColorEvent.toAmber);
                    },
                    shape: (color == Colors.amber)
                        ? CircleBorder(
                            side: BorderSide(color: Colors.black, width: 3))
                        : CircleBorder(),
                  ),
                  MaterialButton(
                    color: Colors.purple,
                    onPressed: () {
                      colorBloc.add(ColorEvent.toPurple);
                    },
                    shape: (color == Colors.purple)
                        ? CircleBorder(
                            side: BorderSide(color: Colors.black, width: 3))
                        : CircleBorder(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
