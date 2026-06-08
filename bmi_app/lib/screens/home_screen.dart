import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Container(
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  iconColor: Colors.white,
                ),
                child: Icon(Icons.menu_open_rounded, size: 35),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  iconColor: Colors.white,
                ),
                child: Icon(Icons.loop_sharp, size: 35),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.green),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "BMI CALCULATOR",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Calculate your Body Mass Index",
                  style: TextStyle(letterSpacing: 3),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),

          Transform.translate(
            offset: Offset(0, -100),
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              margin: EdgeInsets.all(15),
              
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 199, 199, 199), width: 2),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.white,
                
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 15),
                  Text("GENDER", style: TextStyle(color: Colors.black)),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.male_outlined),
                          ),
                          Text("Male", style: TextStyle(color: Colors.black)),
                        ],
                      ),
                      SizedBox(width: 60),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.female_outlined),
                          ),
                          Text("Female", style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // height section
                  Column(
                    children: [
                      Text("HEIGHT", style: TextStyle(color: Colors.black)),

                      /// value of the height appears on the screen when change the bar value
                      Text("Value", style: TextStyle(color: Colors.black)),

                      // select height bar for the height
                    ],
                  ),
                  SizedBox(height: 20),

                  // weight section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text("WEIGHT", style: TextStyle(color: Colors.black)),
                          SizedBox(height: 10),
                          //weight value
                          Text(
                            "value kg",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "-",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "+",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Text("AGE", style: TextStyle(color: Colors.black)),
                          SizedBox(height: 10),
                          //weight value
                          Text(
                            "value Yrs",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "-",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "+",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  
                  ElevatedButton(onPressed: (){}, child:  Text("CALCULATE BMI", )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
