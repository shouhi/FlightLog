import 'package:flutter/material.dart';
import 'package:flight_log/importer.dart';

class Welcome extends StatelessWidget {
  @override

   Widget build(BuildContext context) {
    return new Scaffold(
        body:  Stack(
          children: <Widget>[
             Container(
              decoration:  BoxDecoration(
                image:  DecorationImage(
                  image: AssetImage('assets/landscape.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //  FadeAnimation(1.5, Container(
            //   decoration:  BoxDecoration(
            //     image:  DecorationImage(
            //       image: AssetImage('assets/welcome-page-title.png'),
            //     ),
            //   ),
            //  ),
            // ),
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FadeAnimation(1.5, MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Const.utilColor["white"]
                        ),
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Text("アカウント作成", style: TextStyle(
                        fontWeight: FontWeight.w600, 
                        fontSize: 18,
                        color: Const.utilColor["white"],
                      ),),
                    )),
                  ],
                ),
              )
          ],
        )
    );
  }
}