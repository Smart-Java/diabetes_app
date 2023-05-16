import 'package:auto_route/auto_route.dart';
import 'package:diabetes_care/config/appRouterHandler/app_router.dart';
import 'package:diabetes_care/config/appShimmerEffect/app_shimmer_effect.dart';
import 'package:diabetes_care/pages/patientPage/dietPage/bloc/diet_page_bloc.dart';
import 'package:diabetes_care/pages/patientPage/dietPage/bloc/state/diet_page_state.dart';
import 'package:diabetes_care/pages/patientPage/dietPage/widget/custom_diet_item_widget.dart';
import 'package:diabetes_care/util/listNotReadyWidget/list_not_ready_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DietListWidet extends StatefulWidget {
  const DietListWidet({Key? key}) : super(key: key);

  @override
  State<DietListWidet> createState() => _DietListWidetState();
}

class _DietListWidetState extends State<DietListWidet> {
  bool loadShimmer = true;
  bool dietListReady = false;
  String emptyDietList = 'No diet yet!';
  List dietList = [
    {'title': 'Hello', 'date': '12-01-2008', 'details': ''}
  ];
  @override
  void initState() {
    super.initState();
    if (dietList.isNotEmpty) {
      setState(() {
        dietListReady = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DietPageBloc, DietPageState>(builder: (context, state) {
      return loadShimmer == true
          ? ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5.0),
                  child: const AppShimmerEffect.rectangular(
                    height: 70,
                    width: double.infinity,
                  ),
                );
              })
          : (dietList.isNotEmpty && dietListReady == true)
              ? ListView.builder(
                  itemCount: dietList.length,
                  itemBuilder: (context, index) {
                    DateTime date = DateTime.parse(dietList[index]['date']);
                    return GestureDetector(
                      onTap: () {
                        context.router.push(DietDetailsRoute(
                          data: dietList[index]['details'],
                          title: dietList[index]['title'],
                        ));
                      },
                      child: CustomDietItemWidget(
                        date: '${date.day}-${date.month}-${date.year}',
                        title: dietList[index]['title'],
                      ),
                    );
                  },
                )
              : ListNotReadyWidget(
                  message: emptyDietList,
                );
    }, listener: (context, state) {
      if (state.dietDataList != null && state.dietDataList!.isNotEmpty) {
        setState(() {
          dietList = state.dietDataList!;
        });
      } else {
        setState(() {
          dietList = [];
        });
      }

      if (state.isListReady == true) {
        setState(() {
          dietListReady == state.isListReady;
        });
      }

      if (state.isLoading == true) {
        setState(() {
          loadShimmer = state.isLoading!;
        });
      } else {
        if (state.isLoading == false) {
          setState(() {
            loadShimmer = state.isLoading!;
          });
        }
      }
    });
  }
}
