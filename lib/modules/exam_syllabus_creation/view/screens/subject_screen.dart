import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../view/widgets/custom_widgets/custom_textformfield.dart';

import '../../../../constants/ui_constants.dart';
import '../../../../models/subject_model.dart';
import '../../../../view/widgets/custom_widgets/custom_elevated_button.dart';

import 'chapters_screen.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({
    required this.subjectCount,
    super.key,
  });
  final int subjectCount;

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<SubjectModel> subjectModelList = [];
  @override
  void initState() {
    super.initState();
    subjectModelList.addAll(
      List.generate(
        widget.subjectCount,
        (index) => SubjectModel(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Subjects",
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomElevatedButton(
        isLoading: false,
        onPressed: () {
          bool isFormValid = _formKey.currentState!.validate();
          if (isFormValid) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ChapterScreen(
                  subjectModelList: subjectModelList,
                ),
              ),
            );
          }
        },
        buttonText: "Submit",
      ),
      body: Form(
        key: _formKey,
        child: ListView.separated(
          padding: const EdgeInsets.all(UIConstants.defaultHeight * 2),
          itemCount: widget.subjectCount,
          separatorBuilder: (context, index) => const SizedBox(
            height: UIConstants.defaultHeight,
          ),
          itemBuilder: (context, index) => Subjects(
            subjectCount: "Subject - ${index + 1}",
            subjectModel: subjectModelList[index],
          ),
        ),
      ),
    );
  }
}

class Subjects extends StatefulWidget {
  const Subjects({
    required this.subjectCount,
    required this.subjectModel,
    super.key,
  });
  final String subjectCount;
  final SubjectModel subjectModel;

  @override
  State<Subjects> createState() => _SectionsState();
}

class _SectionsState extends State<Subjects> {
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
                  widget.subjectCount,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            );
          },
          isExpanded: isExpanded,
          body: Padding(
            padding: const EdgeInsets.all(UIConstants.defaultPadding),
            child: Column(
              children: [
                CustomTextFormField(
                  margin: const EdgeInsets.only(
                    bottom: UIConstants.defaultMargin * 2,
                  ),
                  onChanged: (value) {
                    widget.subjectModel.subjectTitle = value;
                  },
                  labelText: "Subject Title",
                  validator: (value) {
                    if (value == null) {
                      return "Field is required. Please enter subject title";
                    } else {
                      if (value.trim().isEmpty) {
                        return "Field is required. Please enter subject title";
                      } else {
                        return null;
                      }
                    }
                  },
                ),
                CustomTextFormField(
                  onChanged: (value) {
                    widget.subjectModel.subjectIcon = value;
                  },
                  margin: const EdgeInsets.only(
                    bottom: UIConstants.defaultMargin * 2,
                  ),
                  labelText: "Subject Icon",
                  validator: (value) {
                    if (value == null) {
                      return "Field is required. Please enter subject icon";
                    } else {
                      if (value.trim().isEmpty) {
                        return "Field is required. Please enter subject icon";
                      } else {
                        return null;
                      }
                    }
                  },
                ),
                CustomTextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    widget.subjectModel.chapters = int.parse(value);
                  },
                  labelText: "Chapters",
                  validator: (value) {
                    if (value == null) {
                      return "Field is required. Please enter chapter count";
                    } else {
                      if (value.trim().isEmpty) {
                        return "Field is required. Please enter chapter count";
                      } else {
                        return null;
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
