import 'package:auto_route/auto_route.dart';
import 'package:diabetes_care/pages/authenticationPage/presentation/authentication_page.dart';
import 'package:diabetes_care/pages/getStartedPage/get_started_page.dart';
import 'package:diabetes_care/pages/patientPage/careTeamPage/care_team_page.dart';
import 'package:diabetes_care/pages/patientPage/dashboardPage/patient_dashboard_page.dart';
import 'package:diabetes_care/pages/patientPage/dietPage/diet_page.dart';
import 'package:diabetes_care/pages/patientPage/dietPage/widget/dietDetailsPage/diet_details_page.dart';
import 'package:diabetes_care/pages/patientPage/glucoseReadingPage/glucose_reading_page.dart';
import 'package:diabetes_care/pages/patientPage/glucoseReadingPage/widget/glucoseReadingViewPage/glucose_reading_view_page.dart';
import 'package:diabetes_care/pages/patientPage/homePage/home_page.dart';
import 'package:diabetes_care/pages/practitionersPage/carePatientDetailsPage/care_patients_details_page.dart';
import 'package:diabetes_care/pages/practitionersPage/dashboard/care_giver_dashboard_page.dart';
import 'package:diabetes_care/pages/practitionersPage/dashboard/dietitian_dashboard_page.dart';
import 'package:diabetes_care/pages/practitionersPage/dashboard/doctor_dashboard_page.dart';
import 'package:diabetes_care/pages/practitionersPage/patientsDetailsPage/patients_details_page.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerDietPage/practitioner_diet_page.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerHomePage/practitioner_home_page.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerPatientRecordPage/practitioner_patient_record_page.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerProfilePage/practitioner_profile_page.dart';
import 'package:diabetes_care/pages/practitionersPage/practitionerSchedulePage/practitioner_schedule_page.dart';
import 'package:diabetes_care/pages/profilePage/profile_page.dart';
import 'package:diabetes_care/pages/patientPage/recordPage/record_page.dart';
import 'package:diabetes_care/pages/patientPage/reminderPage/reminder_page.dart';
import 'package:diabetes_care/pages/testPage/test_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: AuthenticationPage,
    ),
    AutoRoute(
      page: GetStartedPage,
      initial: true,
    ),
    AutoRoute(
      page: PatientDashboardPage,
      children: [
        AutoRoute(
          page: HomePage,
        ),
        AutoRoute(
          page: ReminderPage,
        ),
        AutoRoute(
          page: RecordPage,
        ),
        AutoRoute(
          page: DietPage,
        ),
        AutoRoute(
          page: ProfilePage,
        ),
      ],
    ),
    AutoRoute(
      page: GlucoseReadingPage,
      children: [
        AutoRoute(
          page: GlucoseReadingViewPage,
        ),
        AutoRoute(
          page: ReminderPage,
        ),
        AutoRoute(
          page: RecordPage,
        ),
        AutoRoute(
          page: DietPage,
        ),
        AutoRoute(
          page: ProfilePage,
        ),
      ],
    ),
    AutoRoute(
      page: DoctorDashboardPage,
      children: [
        AutoRoute(
          page: PractitionerHomePage,
        ),
        AutoRoute(
          page: PractitionerSchedulePage,
        ),
        AutoRoute(
          page: PractitionerProfilePage,
        ),
      ],
    ),
    AutoRoute(
      page: DietitianDashboardPage,
      children: [
        AutoRoute(
          page: PractitionerHomePage,
        ),
        AutoRoute(
          page: PractitionerSchedulePage,
        ),
        AutoRoute(
          page: PractitionerProfilePage,
        ),
      ],
    ),
    AutoRoute(
      page: CareGiverDashboardPage,
      children: [
        AutoRoute(
          page: CarePatientDetailsPage,
        ),
        AutoRoute(
          page: PractitionerProfilePage,
        ),
      ],
    ),
    AutoRoute(
      page: CareTeamPage,
    ),
    AutoRoute(
      page: DietDetailsPage,
    ),
    AutoRoute(
      page: PatientsDetailsPage,
    ),
    AutoRoute(
      page: PractitionerDietPage,
    ),
    AutoRoute(
      page: PractitionerPatientsRecordPage,
    ),
    AutoRoute(
      page: TestPage,
      // initial: true,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
