import 'package:flutter/material.dart';

class ListNotReadyWidget extends StatelessWidget {
  final String message;
  const ListNotReadyWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: AlignmentDirectional.topCenter,
          child: Image.asset(
            'assets/images/noWaitingList/no_waiting_list.png',
            height: 150.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ],
    );
  }
}
