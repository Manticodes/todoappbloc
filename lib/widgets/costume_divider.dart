import 'package:flutter/material.dart';

class CostumeDivider extends StatelessWidget {
  const CostumeDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Divider(
        thickness: 0.3,
      ),
    );
  }
}
