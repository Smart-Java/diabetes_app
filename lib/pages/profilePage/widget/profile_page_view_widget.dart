import 'package:diabetes_care/config/appColors/app_colors.dart';
import 'package:diabetes_care/pages/profilePage/bloc/event/profile_page_event.dart';
import 'package:diabetes_care/pages/profilePage/bloc/profile_page_bloc.dart';
import 'package:diabetes_care/pages/profilePage/bloc/state/profile_page_state.dart';
import 'package:diabetes_care/pages/profilePage/widget/profile_page_form_widget.dart';
import 'package:diabetes_care/pages/profilePage/widget/profile_page_image_widget.dart';
import 'package:diabetes_care/util/pageHeaderWidget/patient_page_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePageViewWidget extends StatefulWidget {
  const ProfilePageViewWidget({Key? key}) : super(key: key);

  @override
  State<ProfilePageViewWidget> createState() => _ProfilePageViewWidgetState();
}

class _ProfilePageViewWidgetState extends State<ProfilePageViewWidget> {
  Size deviceSize = const Size(0, 0);
  bool isNewAccessCodeRequestInProgress = false;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfilePageBloc>(context)
        .add(const GetProfileDetailsProfilePageEvent());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    setState(() {
      deviceSize = size;
    });
    return BlocListener<ProfilePageBloc, ProfilePageState>(
      listener: (context, state) {
        if (state.isNewAccessCodeRequestCodeInProgress == true) {
          setState(() {
            isNewAccessCodeRequestInProgress =
                state.isNewAccessCodeRequestCodeInProgress!;
          });
        } else {
          if (state.isNewAccessCodeRequestCodeInProgress == false) {
            setState(() {
              isNewAccessCodeRequestInProgress =
                  state.isNewAccessCodeRequestCodeInProgress!;
            });
          }
        }

        if (state.requestMessage != null && state.requestMessage!.isNotEmpty) {
          _displayMessage(context, state.requestMessage!);
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
                  'Profile',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 150.0,
              right: 5.0,
              left: 5.0,
            ),
            child: Column(
              children: [
                const ProfilePageImageWidget(),
                const ProfilePageFormWidget(),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: isNewAccessCodeRequestInProgress == false
                          ? () {
                              BlocProvider.of<ProfilePageBloc>(context).add(
                                  const RequestNewAccessCodeProfilePageEvent());
                            }
                          : null,
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Text(
                            isNewAccessCodeRequestInProgress == true
                                ? 'Processing...'
                                : 'Request New Access Code',
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _displayMessage(BuildContext context, String message) {
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
