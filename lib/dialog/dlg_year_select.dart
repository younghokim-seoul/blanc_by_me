import 'package:blanc_f/global/colors.dart';
import 'package:flutter/material.dart';

/**
 *
 */
class YearSelectDialog extends StatefulWidget {
  String year;

  YearSelectDialog({Key? key, required this.year}) : super(key: key);

  @override
  _YearSelectDialogState createState() => _YearSelectDialogState();
}

class _YearSelectDialogState extends State<YearSelectDialog> {
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime(int.parse(widget.year), 1);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return Container(
            width: 328,
            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 300,
                  height: 300,
                  child: YearPicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    selectedDate: _selectedDate,
                    onChanged: (DateTime dateTime) {
                      _selectedDate = dateTime;
                      String year = _selectedDate.year.toString();
                      Navigator.pop(context, year);
                    },
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
