import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String? placeholderText;
  final String? initialValue;
  final bool isSecured;
  final bool isEnabled;
  final TextEditingController? controller;

  const CustomTextField(
      {Key? key,
      required this.labelText,
      this.placeholderText,
      required this.isSecured,
      this.initialValue,
      this.isEnabled = true,
      this.controller})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isSecured;
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(widget.labelText),
      SizedBox(height: 4),
      TextFormField(
        initialValue: widget.initialValue,
        controller: widget.controller,
        obscureText: _isObscured,
        enabled: widget.isEnabled,
        decoration: InputDecoration(
          filled: !widget.isEnabled,
          fillColor: Colors.grey,
          hintText: widget.placeholderText,
          suffixIcon: widget.isSecured
              ? IconButton(
                  icon: _isObscured
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(),
        ),
      ),
    ]);
  }
}
