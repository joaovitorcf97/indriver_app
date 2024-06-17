import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function(String value) onChanged;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.text,
    required this.icon,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextFormField(
        onChanged: (value) => onChanged(value),
        validator: validator,
        decoration: InputDecoration(
          label: Text(text),
          border: InputBorder.none,
          prefixIcon: SizedBox(
            width: 48,
            child: Align(
              alignment: Alignment.center,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  Icon(icon),
                  const SizedBox(width: 5),
                  Container(
                    height: 20,
                    width: 1,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
