// import 'package:intl/intl.dart';

// String? formatDate(date) {
//   //...

//   if (date == null) return null;

//   final inputFormat = DateFormat(
//     'yyyy-MM-dd',
//   ); // Assuming the input format is "yyyy-MM-dd [HH:mm:ss]"
//   final outputFormat = DateFormat(
//     'd/M/yy',
//   ); // Desired output format

//   DateTime? dateTime;
//   String? formattedTime;

//   if (date is String) {
//     dateTime = inputFormat.parse(date);
//   } else if (date is DateTime) {
//     dateTime = date;
//   }

//   if (dateTime is DateTime) {
//     formattedTime = outputFormat.format(dateTime);
//   }

//   return formattedTime;
// }

// String? formatDate2(date) {
//   //...

//   if (date == null) return null;

//   final inputFormat = DateFormat(
//     'yyyy-MM-dd',
//   ); // Assuming the input format is "yyyy-MM-dd [HH:mm:ss]"
//   final outputFormat = DateFormat(
//     'EEE, MMM yy',
//   );
//   // 'Sun, Jun 16'
//   // Desired output format

//   DateTime? dateTime;
//   String? formattedTime;

//   if (date is String) {
//     dateTime = inputFormat.parse(date);
//   } else if (date is DateTime) {
//     dateTime = date;
//   }

//   if (dateTime is DateTime) {
//     formattedTime = outputFormat.format(dateTime);
//   }

//   return formattedTime;
// }
