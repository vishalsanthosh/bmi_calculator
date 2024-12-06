import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  TextEditingController weightC = TextEditingController();

  TextEditingController heightC = TextEditingController();
  String bmiResult = '';
  String bmi = '';

  void calBmi(String weight, String height) {
    double weightDouble = double.parse(weight);
    double heightDouble = double.parse(height);
    setState(() {
      bmi = (weightDouble / (heightDouble * heightDouble)).toStringAsFixed(2);
      String bmiCategory = getCategory(bmi);
      bmiResult = "you are in $bmiCategory category";
    });
  }

  String getCategory(String bmi) {
    double bmiDouble = double.parse(bmi);
    String Category = "";
    if (bmiDouble < 18.5) {
      Category = "Under Weight";
    } else if (18.5 <= bmiDouble && bmiDouble < 24.9) {
      Category = "Healthy";
    } else if (bmiDouble >= 25 && bmiDouble < 24.9) {
      Category = "OverWeight";
    } else {
      Category = "Obese";
    }
    return Category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("BMI Calculator"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Height",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            TextField(
                controller: heightC,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    hintText: "Enter Your Height in m")),
            SizedBox(
              height: 18,
            ),
            Text(
              "Weight",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            TextField(
                controller: weightC,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    hintText: "Enter Your weight in Kg")),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                calBmi(weightC.text, heightC.text);
              },
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  "Calculate BMI",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 60,
              width: 160,
              decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                bmi,
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              bmiResult,
              style: TextStyle(color: Colors.red[500]),
            )
          ],
        ),
      ),
    );
  }
}
