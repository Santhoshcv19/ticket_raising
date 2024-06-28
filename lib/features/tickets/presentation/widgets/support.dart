import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_raising_management/core/styles/border_radius.style.dart';
import 'package:ticket_raising_management/core/styles/dimenstions.style.dart';
import 'package:ticket_raising_management/core/utils/buttons/secondary_button.dart';
import 'package:ticket_raising_management/core/utils/texts/body.text.dart';
import 'package:ticket_raising_management/core/widgets/image.dart';

class HmsSupport extends ConsumerWidget {
  final String data;
  final String? background;
  final String image;

  final Color color;

  const HmsSupport({
    super.key,
    required this.data,
    this.background,
    required this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: SecondaryButton(
        onTap: () {},
        elevation: 0,
        padding: Dimen.scaffoldMargin,
        shape: RoundedRectangleBorder(borderRadius: radius8),
        color: color,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SvgLite(svg: image, size: Dimen.icon * 2),
          const SizedBox(height: Dimen.space, width: double.infinity),
          const Spacer(),
          AppBodyText(data: data),
        ]),
      ),
    );
  }
}
