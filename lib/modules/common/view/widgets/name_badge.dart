import 'package:flutter/material.dart';

import '../../../../constants/ui_constants.dart';

class NameBadge extends StatelessWidget {
  const NameBadge({
    required this.name,
    this.isVerifiedUser = false,
    super.key,
  });
  final String name;
  final bool isVerifiedUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Visibility(
          visible: isVerifiedUser,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: UIConstants.defaultWidth * 0.5,
              ),
              Icon(
                Icons.verified,
                size: UIConstants.defaultHeight * 1.2,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
