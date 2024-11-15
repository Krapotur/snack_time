import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class BaseTextfield extends StatefulWidget {
  const BaseTextfield({
    super.key,
    required this.textController,
    required this.hintText,
    required this.onTap,
  });
  final TextEditingController? textController;
  final String hintText;
  final void Function() onTap;

  @override
  State<BaseTextfield> createState() => _BaseTextfieldState();
}

class _BaseTextfieldState extends State<BaseTextfield> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 50,
      child: TextField(
        maxLines: 5,
        maxLength: 40,
        controller: widget.textController,
        cursorColor: theme.primaryColor,
        style:
            const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 14),
        decoration: InputDecoration(
          labelText: widget.hintText,
          labelStyle: const TextStyle(fontSize: 14),
          counterText: '',
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
              color: Color.fromARGB(255, 119, 119, 119),
              fontWeight: FontWeight.normal),
          fillColor: Colors.white.withAlpha(235),
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade100, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: theme.primaryColor, width: 1.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        ),
        onChanged: (value) => widget.onTap(),
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
      ),
    );
  }

  // void _setValueVisibleKeyboard(bool visible) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('isVisible', visible);

  //   widget.callSetState();
  // }
}
