import 'package:flutter/material.dart';
import 'package:quiz/constants/ui_constants.dart';
import 'package:quiz/view/widgets/custom_widgets/custom_button.dart';
import 'package:quiz/view/widgets/questions.dart';

class QuestionPanel extends StatefulWidget {
  const QuestionPanel({
    required this.sectionTitle,
    required this.questionCount,
    super.key,
  });
  final String sectionTitle;
  final int questionCount;

  @override
  State<QuestionPanel> createState() => _QuestionPanelState();
}

class _QuestionPanelState extends State<QuestionPanel> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int i, bool _) {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      elevation: 0,
      expandedHeaderPadding: EdgeInsets.zero,
      children: [
        ExpansionPanel(
          backgroundColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.1),
          canTapOnHeader: true,
          headerBuilder: (context, isExpanded) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: UIConstants.defaultPadding,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.sectionTitle,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            );
          },
          isExpanded: isExpanded,
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(
              UIConstants.defaultPadding * 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter each question information in the appropriate field and on the appropriate card. Alternatively, you can upload the document that has every detail related to the question.",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  "Download Sample Document",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                ),
                const SizedBox(
                  height: UIConstants.defaultHeight,
                ),
                CustomButton(
                  buttonWidth: 144,
                  buttonHeight: 32,
                  isLoading: false,
                  onPressed: () {},
                  buttonText: "Upload Document",
                ),
                const SizedBox(
                  height: UIConstants.defaultHeight,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.questionCount,
                  itemBuilder: (context, index) =>
                      Questions(questionTitle: "Question -${index + 1}"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
