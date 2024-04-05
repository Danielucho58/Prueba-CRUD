import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final TextEditingController _controller;
  final String _label;
  TextBox(this._controller, this._label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextField(
        controller: this._controller,
        decoration: InputDecoration(
          filled: true,
          labelText: this._label,
          suffix: GestureDetector(
            child: Icon(Icons.close),
            onTap: () {
              _controller.clear();
            },
          )
        ),
        ),
    );
  }
}

class TextBox1 extends StatelessWidget {
  final TextEditingController _controller;
  final String _label;
  TextBox1(this._controller, this._label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextField(
        controller: this._controller,
        maxLines: 10,
        maxLength: 1000,
        decoration: InputDecoration(
          filled: true,
          labelText: this._label,
          suffix: GestureDetector(
            child: Icon(Icons.close),
            onTap: () {
              _controller.clear();
            },
          )
        ),
        ),
    );
  }
}

 
class listviewTextBox extends StatelessWidget {
  //const listviewTextBox({super.key});

  final TextEditingController _controller;
  final String _label;
  listviewTextBox(this._controller, this._label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextField(
        controller: this._controller,
        decoration: InputDecoration(
          filled: true,
          labelText: this._label,
        ),
        ),
    );
  }
}

class listviewTextBox1 extends StatelessWidget {
  final TextEditingController _controller;
  final String _label;
  listviewTextBox1(this._controller, this._label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextField(
        controller: this._controller,
        maxLines: 10,
        decoration: InputDecoration(
          filled: true,
          labelText: this._label,
        ),
        ),
    );
  }
}
