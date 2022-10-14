import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;

class SummaryOfficersCardDesktop extends StatelessWidget {
  const SummaryOfficersCardDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Card(
        backgroundColor: Colors.white,
        child: SizedBox(
          width: 280,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageHeader(
                title: Text(
                  'Officers',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.w100),
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    const Text(
                      '5',
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 60,
                        color: material.Colors.black54,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                            '  Administration:        10\n Technical Officers:     10\n  Purchasing Officers: 10'),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
