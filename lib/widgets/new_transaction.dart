import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;

  final inputController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = inputController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredAmount <= 0 || enteredTitle.isEmpty) {
      return;
    }

    addTx(
      inputController.text,
      double.parse(amountController.text), // takes string convert to double
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            controller: inputController,
            onSubmitted: (_) => submitData(),
            // onChanged: (val) {
            //   titleInput = val;
            // },
          ),
          TextField(
            decoration: InputDecoration(labelText: "Amount"),
            controller: amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => submitData(),
            // onChanged: (val) {
            //   amountInput = val;
            // },
          ),
          ElevatedButton(
            child: Text(
              'Add transaction',
              style: TextStyle(color: Colors.purple),
            ),
            onPressed: submitData,
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.white)),
          ),
        ]),
      ),
    );
  }
}
