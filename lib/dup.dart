// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'dart:async';
// import 'package:tflite/tflite.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'dart:async';
// import 'package:tflite/tflite.dart';

// class DupClass extends StatefulWidget {
//   const DupClass({Key? key}) : super(key: key);

//   @override
//   _DupClassState createState() => _DupClassState();
// }

// class _DupClassState extends State<DupClass> {
//     XFile? _image;
//   bool _loading = false;
//   List<dynamic>? _outputs;

//   void initState() {
//     super.initState();
//     _loading = true;

//     loadModel().then((value) {
//       setState(() {
//         _loading = false;
//       });
//     });
//   }

// //Load the Tflite model
//   loadModel() async {
//     await Tflite.loadModel(
//       model: "assets/model1_tflite.tflite",
//       labels: "assets/labels.txt",
//     );
//   }

//   classifyImage(image) async {
//     var output = await Tflite.runModelOnImage(
//       path: image.path,
//       numResults: 2,
//       threshold: 0.5,
//       imageMean: 127.5,
//       imageStd: 127.5,
//     );
//     setState(() {
//       _loading = false;
//       //Declare List _outputs in the class which will be used to show the classified classs name and confidence
//       _outputs = output;
//     });
//   }

//   Future pickImage() async {
//     var image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image == null) return null;
//     setState(() {
//       _loading = true;
//       _image = image;
//     });
//     classifyImage(image);
//   }

//   final ImagePicker _picker = ImagePicker();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:Text('Insert image')
//       ),
//       body:Center(
//         child:Column(
//           children: [
//             ElevatedButton(
//             onPressed: (){},
//             child: const Text('Take Picture'),
//           ),
//           ElevatedButton(
//             onPressed: (){},
//             child: const Text('Select Picture'),
//           ),
//           ],
//         )
//       ),
//     );
//   }
// }
//   //camera method
//   Future<void> _optiondialogbox() {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             backgroundColor: Colors.green[200],
//             content: SingleChildScrollView(
//               child: ListBody(
//                 children: <Widget>[
//                   GestureDetector(
//                     child: Text(
//                       "Take a Picture",
//                       style: TextStyle(color: Colors.white, fontSize: 20.0),
//                     ),
//                     onTap: openCamera,
//                   ),
//                   Padding(padding: EdgeInsets.all(10.0)),
//                   GestureDetector(
//                     child: Text(
//                       "Select image ",
//                       style: TextStyle(color: Colors.white, fontSize: 20.0),
//                     ),
//                     onTap: openGallery,
//                   )
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   Future openCamera() async {
//     var image = await _picker.pickImage(source: ImageSource.camera);

//     setState(() {
//       _image = image;
//     });
//   }

//   //camera method
//   Future openGallery() async {
//     var piture = await _picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       _image = piture;
//     });
//     classifyImage(piture);
//   }
// }