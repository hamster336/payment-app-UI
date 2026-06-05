import 'package:flutter/material.dart';
import 'package:flutter_assignment/data/dummy_data.dart';
import 'package:flutter_assignment/models/payment.dart';
import 'package:flutter_assignment/widgets/snack_bar.dart';

class BillCategoryGrid extends StatelessWidget {
  const BillCategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GridView.builder(
        shrinkWrap: true,
        padding: .zero,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1.1,
        ),
        itemCount: billItems.length,
        itemBuilder: (context, index) {
          return buildSectionCard(context, billItems[index]);
        },
      ),
    );
  }

  static Widget buildSectionCard(BuildContext context, BillSectionItem item) {
    return InkWell(
      onTap: () =>
          showSnackBar(context, 'Opening ${item.label} bill payment....'),
      child: Card(
        margin: .zero,
        color: Colors.white,
        child: Column(
          mainAxisSize: .min,
          children: [
            Text(item.emoji, style: TextStyle(fontSize: 28)),
            SizedBox(height: 6),
            Text(
              item.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4A6FA5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
