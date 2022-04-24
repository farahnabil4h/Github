import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  //StatelessWidget cannot display data at UI so we change to stateful
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState(); //added
}

class _MyAppState extends State<MyApp> {
  double result = 0.0;
  TextEditingController numaEditingController = TextEditingController();
  TextEditingController numbEditingController = TextEditingController();
  //private element _ added
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          //main layout white section
          appBar: AppBar(
            //bahagian atas apa yg dalam dia in brackett ni
            title: const Text('App',
                style: TextStyle(color: Colors.black, fontSize: 25)),
            backgroundColor: const Color(0xFF0C9869),
          ),
          /* body: Container(
            //container can only accept one child
            color: Colors.grey,
            width: 300,
            height: 70,
            alignment: Alignment.center,
            child: Text('Hi!'),
          )*/
          body: Center(
            //wrap with center body: column initial

            /* child: Container(
              //container = grouping elements
              //wrap with container
              color: Colors.amber,
              height: 300, */

            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                /*children: const [
                    //we dont have any variable so set to constant
                    Text('Hello World'),
                    Text('Welcome to Flutter'),
                    Text('Flutter is fun'),*/
                children: [
                  const Text(
                    "Simple Calculator",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  //Text(name), labelling

                  const Text('Enter First Number:'),
                  TextField(
                    controller: numaEditingController,
                    decoration: InputDecoration(
                        hintText: 'First number', //tulisan blur suggestion tu
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    keyboardType: const TextInputType.numberWithOptions(),
                  ),
                  //), //user enter data; bila nak guna controller for retrieving the data, textfield no longer const
                  const SizedBox(height: 10.0),
                  const Text('Enter 2nd Number:'),
                  TextField(
                    controller: numbEditingController,
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceAround, //kedudukan button cantik
                    children: [
                      ElevatedButton(
                        //button cannot const because its doing something
                        onPressed: () {
                          setState(() {
                            double numa =
                                double.parse(numaEditingController.text);
                            double numb =
                                double.parse(numbEditingController.text);
                            result = numa + numb; //retrieve data
                          });

                          //print(name);
                          /*print("Hello World" +
                          name); //bila press button can see this in debug console; guna for debugging macam logic errors or button function or not
                    */
                        },
                        child: const Text('+'),
                      ),
                      ElevatedButton(
                        //button cannot const because its doing something
                        onPressed: () {
                          setState(() {
                            double numa =
                                double.parse(numaEditingController.text);
                            double numb =
                                double.parse(numbEditingController.text);
                            result = numa - numb; //retrieve data
                          });

                          //print(name);
                          /*print("Hello World" +
                          name); //bila press button can see this in debug console; guna for debugging macam logic errors or button function or not
                    */
                        },
                        child: const Text('-'),
                      ),
                    ],
                  ),
                  Text(
                    "Result: " + result.toStringAsFixed(2),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
