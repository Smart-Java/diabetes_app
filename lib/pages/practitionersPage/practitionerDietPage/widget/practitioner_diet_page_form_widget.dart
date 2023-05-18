// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerDietPage/bloc/event/practitioner_diet_page_event.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerDietPage/bloc/practitioner_diet_page_bloc.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerDietPage/bloc/state/practitoner_diet_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class PractitionerDietPageFormWidget extends StatefulWidget {
  final String patientAccessCode;
  const PractitionerDietPageFormWidget(
      {Key? key, required this.patientAccessCode})
      : super(key: key);

  @override
  State<PractitionerDietPageFormWidget> createState() =>
      _PractitionerDietPageFormWidgetState();
}

class _PractitionerDietPageFormWidgetState
    extends State<PractitionerDietPageFormWidget> {
  bool loading = false;
  final TextEditingController dietTitleController = TextEditingController();
  final TextEditingController dietDateController = TextEditingController();
  final HtmlEditorController dietDetailsController = HtmlEditorController();

  final formStateKey = GlobalKey<FormState>();

  bool isThereErrorInDietTitle = false;
  bool isThereErrorInDietDate = false;
  bool isThereErrorInDietDetails = false;

  String selectedDate = '';

  Size deviceSize = const Size(0.0, 0.0);

  TextStyle errorTextStyle = const TextStyle(
    fontSize: 14.0,
  );

  bool hasDietDetailsBeenSent = false;

  String recommendDietDetails = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    setState(() {
      deviceSize = size;
    });
    return BlocListener<PractitionerDietPageBloc, PractitionerDietPageState>(
      listener: (context, state) {
        if (state.isLoading == true) {
          setState(() {
            loading = state.isLoading!;
          });
        } else {
          if (state.isLoading == false) {
            setState(() {
              loading = state.isLoading!;
            });
          }
        }

        if (state.isRequestSuccessful == true) {
          setState(() {
            hasDietDetailsBeenSent = state.isRequestSuccessful!;
          });
        } else {
          if (state.isRequestSuccessful == false) {
            setState(() {
              hasDietDetailsBeenSent = state.isRequestSuccessful!;
            });
          }
        }

        if (state.requestMessage != null && state.requestMessage!.isNotEmpty) {
          displayMessage(context, state.requestMessage!);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    children: [
                      Form(
                        key: formStateKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 30.0,
                              ),
                              child: TextField(
                                controller: dietTitleController,
                                keyboardType: TextInputType.text,
                                enabled: !loading,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.textFieldFilledColor,
                                  hintText: 'Enter Diet title',
                                  errorText: isThereErrorInDietTitle == true
                                      ? 'Diet title is required'
                                      : null,
                                  errorStyle: errorTextStyle,
                                  border: textFieldBorder,
                                  disabledBorder: textFieldBorder,
                                  enabledBorder: textFieldBorder,
                                  focusedBorder: textFieldBorder,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 30.0,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  selectDate();
                                },
                                child: TextField(
                                  controller: dietDateController,
                                  keyboardType: TextInputType.text,
                                  enabled: false,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.textFieldFilledColor,
                                    hintText: 'Enter Date',
                                    suffixIcon: const Icon(
                                      Icons.calendar_month,
                                      color: AppColors.primaryColor,
                                    ),
                                    errorText: isThereErrorInDietDate == true
                                        ? 'Date is required'
                                        : null,
                                    errorStyle: errorTextStyle,
                                    border: textFieldBorder,
                                    disabledBorder: textFieldBorder,
                                    enabledBorder: textFieldBorder,
                                    focusedBorder: textFieldBorder,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 30.0,
                              ),
                              child: HtmlEditor(
                                controller: dietDetailsController,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: loading == true
                            ? null
                            : () async {
                                await validateRequiredFields().then((value) {
                                  uploadComplain(context: context);
                                });
                              },
                        child: Container(
                          height: 56.0,
                          decoration: const BoxDecoration(
                              color: AppColors.formBackgroundButtonColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              )),
                          child: Center(
                            child: Text(
                              loading == true
                                  ? 'Recommending...'
                                  : 'Recommend Diet',
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void displayMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(message),
        ),
        duration: const Duration(
          seconds: 2,
        ),
        backgroundColor: AppColors.snackBarBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.only(
          bottom: deviceSize.height - 100,
          right: 10.0,
          left: 10.0,
        ),
      ),
    );
  }

  Future<void> validateRequiredFields() async {
    var dietTitle = dietTitleController.text;
    var dietDate = dietDateController.text;
    var dietDetails = await dietDetailsController.getText();

    if (dietTitle.isEmpty) {
      setState(() {
        isThereErrorInDietTitle = true;
      });
    } else {
      setState(() {
        isThereErrorInDietTitle = false;
      });
    }

    if (dietDate.isEmpty) {
      setState(() {
        isThereErrorInDietDate = true;
      });
    } else {
      setState(() {
        isThereErrorInDietDate = false;
      });
    }

    if (dietDetails.isEmpty) {
      setState(() {
        isThereErrorInDietDetails = true;
      });
    } else {
      setState(() {
        isThereErrorInDietDetails = false;
        recommendDietDetails = dietDetails;
        debugPrint('this is the value $recommendDietDetails');
      });
    }
  }

  OutlineInputBorder textFieldBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(5.0),
    ),
    borderSide: BorderSide(
      color: AppColors.primaryColor,
    ),
  );

  void selectDate() async {
    var today = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: today,
      lastDate: today.add(
        const Duration(days: 30 * 3),
      ),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat.yMMMMEEEEd().format(pickedDate);

      setState(() {
        dietDateController.text = formattedDate;
        selectedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  void uploadComplain({required BuildContext context}) {
    if (isThereErrorInDietDate == false &&
        isThereErrorInDietDetails == false &&
        isThereErrorInDietTitle == false) {
      BlocProvider.of<PractitionerDietPageBloc>(context)
          .add(AddNewDietDietPageEvent(
        dietDate: selectedDate,
        dietDetails: recommendDietDetails,
        dietTitle: dietTitleController.text,
        patientAccessCode: widget.patientAccessCode,
      ));
    } else {
      displayMessage(context, 'All fields are required');
    }
  }
}
