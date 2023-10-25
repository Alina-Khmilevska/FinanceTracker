import 'package:cpp_finance_tracker_plugin/cpp_finance_tracker_plugin.dart';
import 'package:flutter/material.dart';
//import 'package:finance_tracker_cpp_plugin/finance_tracker_cpp_plugin.dart';

class SampleItemListView extends StatefulWidget {
  const SampleItemListView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SampleItemListViewState createState() => _SampleItemListViewState();
}

class _SampleItemListViewState extends State<SampleItemListView> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _secondController = TextEditingController();
  int? _result;

  _computeSum() async {
    int firstNumber = int.parse(_firstController.text);
    int secondNumber = int.parse(_secondController.text);
    final plugin = CppFinanceTrackerPlugin();
    final sum = await plugin.addNumbers(firstNumber, secondNumber);

    setState(() {
      _result = sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Addition Using C++'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _firstController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "First number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _secondController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Second number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _computeSum,
              child: const Text("Compute Sum"),
            ),
            const SizedBox(height: 16.0),
            if (_result != null)
              Text("Result: $_result", style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    super.dispose();
  }
}
