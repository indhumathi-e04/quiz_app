import "package:flutter/material.dart";

import "../../constants/ui_constants.dart";
import "../widgets/sections.dart";

class SectionsScreen extends StatelessWidget {
  SectionsScreen({
    required this.sectionCount,
    super.key,
  });
  final int sectionCount;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sections",
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView.separated(
          padding: const EdgeInsets.all(UIConstants.defaultHeight * 2),
          itemCount: sectionCount,
          separatorBuilder: (context, index) => const SizedBox(
            height: UIConstants.defaultHeight,
          ),
          itemBuilder: (context, index) => Sections(
            sectionsTitle: "Section-${index + 1}",
          ),
        ),
      ),
    );
  }
}
