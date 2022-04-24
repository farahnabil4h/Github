import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ndialog/ndialog.dart';

class CryptoConvertScreen extends StatelessWidget {
  const CryptoConvertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const CryptoConvertPage(),
    );
  }
}

class CryptoConvertPage extends StatefulWidget {
  const CryptoConvertPage({Key? key}) : super(key: key);

  @override
  State<CryptoConvertPage> createState() => _CryptoConvertPageState();
}

class _CryptoConvertPageState extends State<CryptoConvertPage> {
  TextEditingController inputEditingController = TextEditingController();
  double input = 0.0, rate = 0.0, converted = 0.0;
  String selectUnit = "eth";
  List<String> unitList = [
    "eth",
    "ltc",
    "bch",
    "bnb",
    "eos",
    "xrp",
    "xlm",
    "link",
    "dot",
    "yfi",
    "usd",
    "aed",
    "ars",
    "aud",
    "bdt",
    "bhd",
    "bmd",
    "brl",
    "cad",
    "chf",
    "clp",
    "cny",
    "czk",
    "dkk",
    "eur",
    "gbp",
    "hkd",
    "huf",
    "idr",
    "ils",
    "inr",
    "jpy",
    "krw",
    "kwd",
    "lkr",
    "mmk",
    "mxn",
    "myr",
    "ngn",
    "nok",
    "nzd",
    "php",
    "pkr",
    "pln",
    "rub",
    "sar",
    "sek",
    "sgd",
    "thb",
    "try",
    "twd",
    "uah",
    "vef",
    "vnd",
    "zar",
    "xdr",
    "xag",
    "xau",
    "bits",
    "sats",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("BitCoin Converter",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black))),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: 250,
              child: Center(
                child: Image.asset('assets/images/logocrypto.png'),
              )),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(50.0, 12.0, 50.0, 12.0),
            child: TextField(
              controller: inputEditingController,
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                  hintText: "Enter Bitcoin Value",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0))),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton(
                itemHeight: 60,
                value: selectUnit,
                onChanged: (newValue) {
                  setState(() {
                    selectUnit = newValue.toString();
                  });
                },
                items: unitList.map((selectUnit) {
                  return DropdownMenuItem(
                    child: Text(
                      selectUnit,
                    ),
                    value: selectUnit,
                  );
                }).toList(),
              ),
              const SizedBox(width: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0XFFFFCD00),
                  onPrimary: Colors.black,
                ),
                onPressed: _convert,
                child: const Text("Convert",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        letterSpacing: 2.0)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Result",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 2.0)),
                const SizedBox(height: 10),
                Text(
                  converted.toStringAsFixed(2),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 32),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: const Color(0XFF3FC4C1),
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ],
      )),
    );
  }

  Future<void> _convert() async {
    ProgressDialog progressDialog = ProgressDialog(context,
        message: const Text("Progress"), title: const Text("Searching..."));
    progressDialog.show();

    input = double.parse(inputEditingController.text);
    var url = Uri.parse("https://api.coingecko.com/api/v3/exchange_rates");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      var parsedData = json.decode(jsonData);
      rate = parsedData['rates'][selectUnit]['value'];
      setState(() {
        converted = rate * double.parse(inputEditingController.text);
      });
      progressDialog.dismiss();
    }
  }
}
