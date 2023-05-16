import 'package:auto_route/auto_route.dart';
import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/pages/patientPage/recordPage/bloc/event/record_page_event.dart';
import 'package:diabetes_care/pages/patientPage/recordPage/bloc/record_page_bloc.dart';
import 'package:diabetes_care/pages/patientPage/recordPage/bloc/state/record_page_state.dart';
import 'package:diabetes_care/util/appUIConstant/app_ui_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditRecordWidgetView extends StatefulWidget {
  final String cholesterolLevel;
  final String medications;
  final String weight;
  final String height;
  final String physicalActivities;
  final String insulinUsage;
  const EditRecordWidgetView({
    Key? key,
    required this.cholesterolLevel,
    required this.height,
    required this.insulinUsage,
    required this.medications,
    required this.physicalActivities,
    required this.weight,
  }) : super(key: key);

  @override
  State<EditRecordWidgetView> createState() => _EditRecordWidgetViewState();
}

class _EditRecordWidgetViewState extends State<EditRecordWidgetView> {
  final TextEditingController cholesterolLevelController =
      TextEditingController();
  final TextEditingController medicationsController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController physicalController = TextEditingController();
  final TextEditingController insulinController = TextEditingController();

  bool isLoading = false;

  bool isRequestSuccessful = false;

  String errorSuccessMessage = '';

  Size deviceSize = const Size(0, 0);

  @override
  void initState() {
    super.initState();
    setState(() {
      cholesterolLevelController.text = widget.cholesterolLevel;
      heightController.text = widget.height;
      weightController.text = widget.weight;
      insulinController.text = widget.insulinUsage;
      physicalController.text = widget.physicalActivities;
      medicationsController.text = widget.medications;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    setState(() {
      deviceSize = size;
    });
    return BlocConsumer<RecordPageBloc, RecordPageState>(
      listener: (context, state) {
        if (state.isUpdateRequestInProgress == true) {
          setState(() {
            isLoading = state.isUpdateRequestInProgress!;
          });
        } else {
          if (state.isUpdateRequestInProgress == false) {
            setState(() {
              isLoading = state.isUpdateRequestInProgress!;
            });
          }
        }

        if (state.requestMessage != null && state.requestMessage!.isNotEmpty) {
          setState(() {
            errorSuccessMessage = state.requestMessage!;
          });
        }

        if (state.isUpdateRequestSuccessful == true) {
          setState(() {
            isRequestSuccessful = true;
          });
          Navigator.pop(context);
          displayMessage(context, state.requestMessage!);
        }
      },
      builder: (context, state) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(15.0),
          title: Padding(
            padding: const EdgeInsets.only(
              top: 0.0,
              left: 5.0,
              bottom: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: GestureDetector(
                    onTap: () {
                      context.router.pop();
                    },
                    child: Container(
                      height: 60.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.center,
                          colors: [
                            AppColors.navContainerColor.withOpacity(0.68),
                            AppColors.navContainerColor.withOpacity(0.17),
                          ],
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 26.0,
                        color: AppColors.arrowBackColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Text(
                  'Record',
                  style: TextStyle(
                    color: AppColors.dashboardTextColor,
                    fontSize: 18.00,
                    fontWeight: FontWeight.w800,
                  ),
                )
              ],
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      errorSuccessMessage,
                      style: TextStyle(
                        color: isRequestSuccessful == true
                            ? AppColors.greenColor
                            : AppColors.redColor,
                        fontSize: 14.00,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                customTextFieldWidget(
                  hintText: 'Cholestrol Level',
                  textEditingController: cholesterolLevelController,
                ),
                customTextFieldWidget(
                  hintText: 'Medications',
                  textEditingController: medicationsController,
                ),
                customTextFieldWidget(
                  hintText: 'Height',
                  textEditingController: heightController,
                ),
                customTextFieldWidget(
                  hintText: 'Weight',
                  textEditingController: weightController,
                ),
                customTextFieldWidget(
                  hintText: 'Physical Activies',
                  textEditingController: physicalController,
                ),
                customTextFieldWidget(
                  hintText: 'Insulin Usage',
                  textEditingController: insulinController,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0,
                  ),
                  child: GestureDetector(
                    onTap: isLoading == false
                        ? () {
                            validateRequiredFields(context: context);
                          }
                        : null,
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Center(
                        child: Text(
                          isLoading == true ? 'Updating...' : 'Update',
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> validateRequiredFields({required BuildContext context}) async {
    if (cholesterolLevelController.text.isNotEmpty &&
        medicationsController.text.isNotEmpty &&
        heightController.text.isNotEmpty &&
        weightController.text.isNotEmpty &&
        physicalController.text.isNotEmpty &&
        insulinController.text.isNotEmpty) {
      await updateRecord(context: context);
    } else {
      setState(() {
        errorSuccessMessage = 'All fields are required';
      });
    }
  }

  Future<void> updateRecord({required BuildContext context}) async {
    BlocProvider.of<RecordPageBloc>(context).add(
      UpdateRecordRecordPageEvent(
        cholesterolLevel: cholesterolLevelController.text,
        height: heightController.text,
        insulinUsage: insulinController.text,
        medications: medicationsController.text,
        physicalActivities: physicalController.text,
        weight: weightController.text,
      ),
    );
  }

  Widget customTextFieldWidget({
    required TextEditingController textEditingController,
    required String hintText,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 5.0,
            ),
            child: Text(
              hintText,
              style: const TextStyle(
                color: AppColors.blackColor,
                fontSize: 16.0,
              ),
            ),
          ),
          TextField(
            controller: textEditingController,
            keyboardType: TextInputType.text,
            enabled: !isLoading,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: hintTextStyle,
              errorStyle: errorTextStyle,
              border: textFieldBorder,
              disabledBorder: textFieldBorder,
              enabledBorder: textFieldBorder,
              focusedBorder: textFieldBorder,
            ),
          ),
        ],
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
}
