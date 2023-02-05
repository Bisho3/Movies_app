import 'package:flutter/material.dart';
import 'package:movie_app/movies/presentation/screen/movies_screen.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
              return const MoviesScreen();
            }));
          },
          child: Text('navidkhjk',style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
