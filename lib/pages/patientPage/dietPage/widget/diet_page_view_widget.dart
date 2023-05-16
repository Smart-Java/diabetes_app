import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/pages/patientPage/dietPage/bloc/diet_page_bloc.dart';
import 'package:diabetes_care/pages/patientPage/dietPage/bloc/event/diet_page_event.dart';
import 'package:diabetes_care/pages/patientPage/dietPage/bloc/state/diet_page_state.dart';
import 'package:diabetes_care/pages/patientPage/dietPage/widget/diet_list_widget.dart';
import 'package:diabetes_care/util/pageHeaderWidget/patient_page_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DietPageViewWidget extends StatefulWidget {
  const DietPageViewWidget({Key? key}) : super(key: key);

  @override
  State<DietPageViewWidget> createState() => _DietPageViewWidgetState();
}

class _DietPageViewWidgetState extends State<DietPageViewWidget> {
  bool openDailog = false;
  bool showAddButton = false;

  bool isDietRequestInProgress = false;

  Size deviceSize = const Size(0, 0);
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DietPageBloc>(context).add(const GetAllDietDietPageEvent());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    setState(() {
      deviceSize = size;
    });
    return BlocListener<DietPageBloc, DietPageState>(
      listener: (context, state) {
        if (state.isLoading == false) {
          setState(() {
            showAddButton = true;
          });
        }

        if (state.isDietRequestInProgress == true) {
          setState(() {
            isDietRequestInProgress = state.isDietRequestInProgress!;
          });
        } else {
          if (state.isDietRequestInProgress == false) {
            setState(() {
              isDietRequestInProgress = state.isDietRequestInProgress!;
            });
          }
        }

        if (state.requestMessage != null && state.requestMessage!.isNotEmpty) {
          if (state.isDietRequestSuccessful == true ||
              state.isDietRequestSuccessful == false) {
            displayMessage(context, state.requestMessage!);
          }
        }
      },
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: PatientPageHeaderWidget(
              childWidget: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Diet',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 150.0,
              right: 5.0,
              left: 5.0,
            ),
            child: DietListWidet(),
          ),
          showAddButton == false
              ? Container()
              : Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: isDietRequestInProgress == false
                          ? () {
                              BlocProvider.of<DietPageBloc>(context)
                                  .add(const RequestForDietDietPageEvent());
                            }
                          : null,
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: openDailog == false
                              ? AppColors.secondaryColor
                              : AppColors.dividerColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add_circle_outline,
                              color: AppColors.whiteColor,
                              size: 20.0,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              isDietRequestInProgress == true
                                  ? 'Requesting...'
                                  : 'Request Diet',
                              style: Theme.of(context).textTheme.button,
                            ),
                          ],
                        ),
                      ),
                    ),
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
