import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('lib/common/assets/images/Games.png'),
          fit: BoxFit.cover,),
          Image(image: AssetImage('lib/common/assets/images/Logo.png')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: FilledButton(onPressed: () {

                    },
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),

                        ),
                      ),

                      child: Text("Login",
                        style: TextStyle(fontSize: 20,
                            color: Colors.deepPurple),),),

                  )
              )
            ],
          ),

          SizedBox(height: 8.0,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child:
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: FilledButton(onPressed: () {

                },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),

                    ),
                  ),

                  child: Text("Register",
                      style: TextStyle(fontSize: 20,
                          color: Colors.white),),),

                )
                  )
               )
            ],
          ),
        ],
      ),
    );
  }
}
