import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DietDetailsListWidet extends StatelessWidget {
  final String data;
  const DietDetailsListWidet({
    Key? key,
    required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Html(
        data: """
$data
""",
        style: {
          'p': Style(
            color: AppColors.blackColor,
            fontSize: FontSize(
              16.0,
            ),
            textAlign: TextAlign.justify,
            fontWeight: FontWeight.w600,
          ),
          'h': Style(
            color: AppColors.greenColor,
            fontSize: FontSize(
              18.0,
            ),
            textAlign: TextAlign.left,
            fontWeight: FontWeight.w600,
          ),
          'a': Style(
            color: AppColors.primaryColor,
            fontSize: FontSize(
              16.0,
            ),
            fontWeight: FontWeight.w600,
            textDecoration: TextDecoration.underline,
          ),
        },
        // onLinkTap: (String? url, RenderContext context,
        //     Map<String, String> attributes, element) async {
        //   if (url != null && url.isNotEmpty) {
        //     await launch_url.launchUrl(Uri.parse(url));
        //   }
        // },
      ),
    );
  }
}
