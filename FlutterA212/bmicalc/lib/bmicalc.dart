import 'package:flutter/material.dart';

//void main() => runApp(MyApp()); only one main method in flutter application

class BMIScreen extends StatelessWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calc'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                height: 200,
                //Flexible( - tak leh scroll kacau image
                //flex: 3, one way to control/divide layout
                child: Center(
                  //Container(color: Colors.green),
                  //wrapped center
                  child: Image.asset('assets/images/bmi.jpg'),
                )),
            Container(
                height: 500,
                //Flexible(flex: 7,
                child: const BmiForm()),
          ]),
        ),
      ),
    );
  }
}

class BmiForm extends StatefulWidget {
  const BmiForm({Key? key}) : super(key: key);

  @override
  State<BmiForm> createState() => _BmiFormState();
}

class _BmiFormState extends State<BmiForm> {
  TextEditingController heightEditingController = TextEditingController();
  TextEditingController weightEditingController = TextEditingController();
  double height = 0.0, weight = 0.0, bmi = 0.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            "BMI Calculator",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: heightEditingController,
            keyboardType: const TextInputType.numberWithOptions(),
            decoration: InputDecoration(
                hintText: "Height in Meter",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0))),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: weightEditingController,
            keyboardType: const TextInputType.numberWithOptions(),
            decoration: InputDecoration(
                hintText: "Weight in Kg",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0))),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: _bmiCalc, child: const Text("Calculate BMI")),
          const SizedBox(height: 10),
          Text(
            "Your BMI " + bmi.toStringAsPrecision(3),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  void _bmiCalc() {
    height = double.parse(heightEditingController.text);
    weight = double.parse(weightEditingController.text);
    setState(() {
      bmi = weight / (height * height);
    });
  }
}
