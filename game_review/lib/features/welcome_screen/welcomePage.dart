import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned(
            top: -100,
            left: 0,
            right: 0,
            child: Image(
              image: AssetImage('lib/common/assets/images/Games.png'),
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SizedBox(height: 250),
              Image(image: AssetImage('lib/common/assets/images/Logo.png')),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: FilledButton(
                        onPressed: () {
                          //TODO: Implement on pressed navigation to login page
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Color.fromRGBO(42, 1, 68, 1),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          textStyle: TextStyle(
                            fontSize:
                                30, //TODO: These fixed values for size and colors should be changed for default theme values
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text("Login"),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 8.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: FilledButton(
                        onPressed: () {
                          //TODO: Implement on pressed navigation to login page
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          side: BorderSide(color: Colors.white),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          textStyle: TextStyle(
                            fontSize:
                                30, //TODO: These fixed values for size and colors should be changed for default theme values

                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text("Register"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
