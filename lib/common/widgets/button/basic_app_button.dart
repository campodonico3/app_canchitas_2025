import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;

  const BasicAppButton({
    super.key,
    required this.title,
    this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return _initial(context);
  }

  Widget _loading(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: Colors.grey,
        minimumSize: Size(MediaQuery.of(context).size.width, 60),
      ),
      child: CircularProgressIndicator(color: Colors.white),
    );
  }

  Widget _initial(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        // boxShadow: [
        //   BoxShadow(
        //     color: const Color(0xff3461FD).withOpacity(0.8),
        //     offset: const Offset(0, 5),
        //     blurRadius: 17,
        //   ),
        // ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff3461FD),
          minimumSize: Size(
            width ?? MediaQuery.of(context).size.width,
            height ?? 60,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
