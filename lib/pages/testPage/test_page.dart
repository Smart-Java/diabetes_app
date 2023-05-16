import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Radius drawerCurveRadius = const Radius.circular(30.0);
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: drawerCurveRadius,
            bottomRight: drawerCurveRadius,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.25,
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.247,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'asset/images/drawerPng/paramountStudentsBg.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                      // color: Colors.blue,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Image.asset(
                          'asset/images/drawerPng/paramountStudentsTxt.png',
                          height: 100.0,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.amber,
                    height: size.height * 0.003,
                    thickness: size.height * 0.003,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    drawerListItem(
                      context: context,
                      iconData: Icons.library_books_rounded,
                      target: () {},
                      title: 'Documents',
                    ),
                    drawerListItem(
                      context: context,
                      iconData: Icons.library_books_rounded,
                      target: () {},
                      title: 'Applications',
                    ),
                    drawerListItem(
                      context: context,
                      iconData: Icons.messenger_rounded,
                      target: () {},
                      title: 'Chats',
                    ),
                    drawerListItem(
                      context: context,
                      iconData: Icons.help,
                      target: () {},
                      title: 'Help and Support',
                    ),
                    drawerListItem(
                      context: context,
                      iconData: Icons.settings,
                      target: () {},
                      title: 'Settings',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 10.0,
                left: 10.0,
                top: 40.0,
              ),
              child: Expanded(
                child: Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.brown.shade100,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.orange,
                              width: 2.0,
                            ),
                            // image: const DecorationImage(
                            //   image: AssetImage(''),
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Mazeedah Yaqub',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'mazeeyaq@gmail.com',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: TextButton(
          child: const Text('open'),
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
    );
  }

  Widget drawerListItem({
    required BuildContext context,
    required String title,
    required IconData iconData,
    required VoidCallback target,
  }) {
    return GestureDetector(
      onTap: target,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 30.0,
          bottom: 10.0,
        ),
        child: Row(
          children: [
            Icon(
              iconData,
              color: Colors.black,
              size: 26.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
