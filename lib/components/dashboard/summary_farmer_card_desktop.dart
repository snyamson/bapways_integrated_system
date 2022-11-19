import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;

class SummaryFarmerCardDesktop extends StatelessWidget {
  const SummaryFarmerCardDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Card(
        backgroundColor: Colors.white,
        child: SizedBox(
          width: 280,
          height: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              PageHeader(
                title: Text(
                  'Total Farmers',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.w100),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  '6000',
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 60,
                    color: material.Colors.black54,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
