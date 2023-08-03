import 'package:flutter/cupertino.dart';


class CupertinoHomePage extends StatefulWidget {
  const CupertinoHomePage({super.key});

  @override
  State<CupertinoHomePage> createState() => _CupertinoHomePageState();
}

class _CupertinoHomePageState extends State<CupertinoHomePage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey3,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey3,
        middle: Text('Currency Converter'),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)} SEK',
                style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.white),
              ),
              SizedBox(
                height: 50,
                child: CupertinoTextField(
                  controller: textEditingController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(color: CupertinoColors.black),
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    border: Border.all(color: CupertinoColors.black),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  prefix: const Icon(CupertinoIcons.money_euro, color: CupertinoColors.black),
                  placeholder: 'Type in any value in EUR',
                  padding: const EdgeInsets.only(left: 16.0),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  onPressed: () {
                    setState(() {
                      result = double.parse(textEditingController.text) * 11.71;
                    });
                  },
                  color: CupertinoColors.black,
                  borderRadius: BorderRadius.circular(50),
                  child: const Text('Convert'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}