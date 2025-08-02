import 'package:flutter/material.dart';

class EleButton extends StatelessWidget {
  const EleButton({
    super.key,
    required this.name,
    required this.onpressed,
  });
  final String name;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        onPressed: onpressed,
        child: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.withOpacity(0.5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      ),
    );
  }
}
