import 'package:flutter/material.dart';

class StatesWidgets extends StatelessWidget {
  const StatesWidgets({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'SIN ESTADOS',
            style: TextStyle(
              color: Color(0xff085078),
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image(
            image: AssetImage('assets/sad.png'),
            fit: BoxFit.contain,
            color: Color(0xff085078),
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.3,
          )
        ],
      ),
    );
  }
}
