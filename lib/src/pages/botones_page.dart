import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {
  const BotonesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            _fondoApp(),
            SingleChildScrollView(
              child: Column(
                children: [
                  _titulos(),
                  _botonesRedondeados(),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: _bottonNavigatorBar(context));
  }

  Widget _fondoApp() {
    final degradado = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(
                0.0,
                0.6,
              ),
              end: FractionalOffset(
                0.0,
                1.0,
              ),
              colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0),
          ])),
    );

    final caja = Transform.rotate(
      angle: -pi / 4.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90.0),
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(236, 90, 188, 1.0),
                Color.fromRGBO(241, 142, 182, 1.0)
              ],
            )),
      ),
    );

    return Stack(
      children: [
        degradado,
        Positioned(
          top: -100,
          child: caja,
        ),
      ],
    );
  }

  Widget _titulos() {
    final styleText = TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0);
    final styleSubText = TextStyle(color: Colors.white, fontSize: 20.0);

    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Classify transaction',
              style: styleText,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Classify this transaction into a particula category',
              style: styleSubText,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottonNavigatorBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(
                color: Color.fromRGBO(116, 117, 152, 1.0),
              ),
            ),
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Container(),
            icon: Icon(Icons.calendar_today, size: 30.0),
          ),
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Container(),
            icon: Icon(Icons.pie_chart_outlined, size: 30.0),
          ),
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Container(),
            icon: Icon(Icons.supervised_user_circle, size: 30.0),
          ),
        ],
      ),
    );
  }

  Widget _botonesRedondeados() {
    return Table(
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            _crearBotonRedondeado(
              Colors.blue,
              Icons.border_all,
              'General',
            ),
            _crearBotonRedondeado(
              Colors.purpleAccent,
              Icons.directions_bus,
              'Bus',
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            _crearBotonRedondeado(
              Colors.pinkAccent,
              Icons.shop,
              'Buy',
            ),
            _crearBotonRedondeado(
              Colors.orange,
              Icons.insert_drive_file,
              'File',
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            _crearBotonRedondeado(
              Colors.blueAccent,
              Icons.movie_filter,
              'Entretaiment',
            ),
            _crearBotonRedondeado(
              Colors.green,
              Icons.cloud,
              'Grocer',
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            _crearBotonRedondeado(
              Colors.redAccent,
              Icons.collections,
              'Photos',
            ),
            _crearBotonRedondeado(
              Colors.teal,
              Icons.help_outline,
              'Acerda de',
            ),
          ],
        ),
      ],
    );
  }

  Widget _crearBotonRedondeado(Color color, IconData icono, String texto) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2.0,
          sigmaY: 2.0,
        ),
        child: Container(
          height: 180,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: color,
                radius: 35.0,
                child: Icon(
                  icono,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              Text(
                texto,
                style: TextStyle(
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
