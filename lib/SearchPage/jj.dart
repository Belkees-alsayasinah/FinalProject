// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:bloom_project/SearchPage/search_controller.dart';
//
// import '../Components/TextField.dart';
// import '../Style/constant.dart';
//
// class SearchPageView extends StatefulWidget {
//   const SearchPageView({Key? key}) : super(key: key);
//
//   @override
//   State<SearchPageView> createState() => _SearchPageViewState();
// }
//
// class _SearchPageViewState extends State<SearchPageView> {
//   final ReportController reportController = Get.put(ReportController(''));
//
//   final TextEditingController priceController = TextEditingController();
//
//   void _handleFilterOption(String value) {
//     if (value == 'price') {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('البحث حسب السعر'),
//             content: TextField(
//               controller: priceController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 hintText: 'أدخل السعر',
//               ),
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   reportController.getdata(priceController.text);
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('بحث'),
//               ),
//             ],
//           );
//         },
//       );
//     } else if (value == 'name') {
//       // Do something for name filter
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final Size screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         leading: Text(''),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Get.back();
//             },
//             icon: Icon(
//               Icons.arrow_forward_ios,
//               color: textColor,
//               size: 30,
//             ),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Center(
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 textDirection: TextDirection.rtl,
//                 children: [
//                   MyTextField(
//                     label: '',
//                     hint: '',
//                     textInputAction: TextInputAction.done,
//                     onsave: (value) {},
//                     keyboardType: TextInputType.text,
//                     blurRadius: 8,
//                     offset: 10,
//                     width: screenSize.width * 0.75,
//                     hieght: 62,
//                   ),
//                   PopupMenuButton<String>(
//                     icon: Icon(
//                       Icons.filter_alt,
//                       size: 40,
//                     ),
//                     onSelected: _handleFilterOption,
//                     itemBuilder: (BuildContext context) =>
//                     <PopupMenuEntry<String>>[
//                       PopupMenuItem<String>(
//                         value: 'price',
//                         child: Text('البحث حسب السعر'),
//                       ),
//                       PopupMenuItem<String>(
//                         value: 'name',
//                         child: Text('البحث حسب الاسم'),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: screenSize.width * 0.6,
//               ),
//               GetBuilder<ReportController>(
//                 builder: (controller) {
//                   if (controller.isLoad.value) {
//                     return CircularProgressIndicator();
//                   } else if (controller.models.isEmpty) {
//                     return Column(
//                       children: [
//                         Icon(
//                           Icons.search,
//                           size: 100,
//                           color: textColor,
//                         ),
//                         Text(
//                           controller.message,
//                           style: TextStyle(
//                             fontSize: 35,
//                             fontFamily: 'font1',
//                             color: textColor,
//                           ),
//                         ),
//                       ],
//                     );
//                   } else {
//                     // Display search results
//                     return Expanded(
//                       child: ListView.builder(
//                         itemCount: controller.models.length,
//                         itemBuilder: (context, index) {
//                           final model = controller.models[index];
//                           return ListTile(
//                             title: Text(model.name ?? ''),
//                             subtitle: Text(model.searchParameter?.toString() ?? ''),
//                           );
//                         },
//                       ),
//                     );
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
