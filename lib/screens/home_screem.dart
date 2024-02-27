import 'package:flutter/material.dart';
import 'package:medical_test_range/screens/widget/bar_widget.dart';
import 'package:medical_test_range/screens/widget/input_with_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mediacal Test Range'),
        centerTitle: true,
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BarWidget(),
          SizedBox(height: 60),
          InputWithButton(),
        ],
      ),
    );
  }
}
