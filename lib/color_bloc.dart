import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ColorEvent { to_amber, to_light_blue }

class ColorBloc extends Bloc<ColorEvent, Color> {
  Color _color = Colors.amber;
  @override
  Color get initialState => Colors.amber;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    //kalau ada event kita mapping untuk mengubah state berdasarkan event tsb
    //map event to state akan mengembalikan stream
    _color = (event == ColorEvent.to_amber) ? Colors.amber : Colors.lightBlue;
    yield _color; //yield adalah perintah untuk memasukan data ke dalam stream
  }
}
