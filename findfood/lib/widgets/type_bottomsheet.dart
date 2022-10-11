import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TypeInBottomSheet extends StatelessWidget {
  final String? name;
  const TypeInBottomSheet({super.key, this.name});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 24,
          width: 72,
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: BorderSide(width: 1, color: Colors.black45))),
          child: DefaultTextStyle(
            style: TextStyle(),
            child: Center(
              child: Text(
                name!,
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
