import 'package:bapways_integrated_system/components/dashboard/summary_cocoa_distribution_card_desktop.dart';
import 'package:bapways_integrated_system/components/dashboard/summary_farmer_card_desktop.dart';
import 'package:bapways_integrated_system/components/dashboard/summary_farmers_by_officers_card_desktop.dart';
import 'package:bapways_integrated_system/components/dashboard/summary_officers_card_desktop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';

class DashboardScreenDesktop extends GetView {
  const DashboardScreenDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(
        title: Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.w100),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.only(left: 13),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: const [
                  SummaryFarmerCardDesktop(),
                  SummaryCocoaDistributionCardDesktop(),
                  SummaryOfficersCardDesktop()
                ],
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: const [SummaryFarmersByOfficersCardDesktop()],
            )
          ],
        ),
      ),
    );
  }
}
