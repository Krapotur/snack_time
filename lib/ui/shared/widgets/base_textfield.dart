import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseTextfield extends StatefulWidget {
  const BaseTextfield(
      {super.key,
      required this.textController,
      required this.hintText,
      required this.callSetState});
  final TextEditingController textController;
  final String hintText;
  final void Function() callSetState;

  @override
  State<BaseTextfield> createState() => _BaseTextfieldState();
}

class _BaseTextfieldState extends State<BaseTextfield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextField(
        maxLines: 5,
        maxLength: 100,
        controller: widget.textController,
        cursorColor: Colors.grey.shade400,
        style: TextStyle(color: Colors.grey.shade600),
        decoration: InputDecoration(
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey),
          fillColor: Colors.white.withAlpha(235),
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade100, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        ),
        onTap: () => _setValueVisibleKeyboard(true),
        onTapOutside: (event)=> FocusScope.of(context).unfocus(),
      ),
    );
  }

  void _setValueVisibleKeyboard(bool visible) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isVisible', visible);

    widget.callSetState();
  }
}
