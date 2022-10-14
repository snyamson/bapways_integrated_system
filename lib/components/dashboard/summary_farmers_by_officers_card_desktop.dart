import 'package:fluent_ui/fluent_ui.dart';

class SummaryFarmersByOfficersCardDesktop extends StatelessWidget {
  const SummaryFarmersByOfficersCardDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        padding: const EdgeInsets.all(15),
        child: Card(
          backgroundColor: Colors.white,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PageHeader(
                  title: Text(
                    'Farmers By Officer',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.w100),
                  ),
                ),
                const Divider(),
                Table(
                  children: const [
                    TableRow(children: [
                      TableCell(child: Text('1')),
                      TableCell(child: Text('1'))
                    ]),
                    TableRow(children: [
                      TableCell(child: Text('1')),
                      TableCell(child: Text('1'))
                    ])
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
