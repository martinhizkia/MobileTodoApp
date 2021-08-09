// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class InputTextField extends StatefulWidget {
//   final TextEditingController controller;
//   InputTextField({Key? key, required this.controller}) : super(key: key);

//   @override
//   _InputTextFieldState createState() => _InputTextFieldState();
// }

// class _InputTextFieldState extends State<InputTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextFormField(
//             controller: widget.controller,
//             cursorColor: Color(0xFF60D6B4),
//             initialValue: 'Title',
//             maxLength: 20,
//             decoration: InputDecoration(
//               // icon: Icon(Icons.favorite),
//               labelText: 'Title',

//               suffixIcon: Icon(
//                 Icons.check_circle,
//               ),

//               disabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.grey),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Color(0xFF60D6B4)),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.grey),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
