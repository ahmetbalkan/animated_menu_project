import 'package:flutter/material.dart';

const TextStyle menuStyle = TextStyle(color: Colors.white, fontSize: 20);
Color backgroundColor = const Color(0xFF333340);

class MenuDashboard extends StatefulWidget {
  const MenuDashboard({Key? key}) : super(key: key);

  @override
  State<MenuDashboard> createState() => _MenuDashboardState();
}

class _MenuDashboardState extends State<MenuDashboard> {
  late double ekranYuksekligi, ekranGenisligi;
  late bool menuAcikmi = false;

  @override
  Widget build(BuildContext context) {
    ekranYuksekligi = MediaQuery.of(context).size.height;
    ekranGenisligi = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [menuOlustur(context), dashboardOlustur(context)],
        ),
      ),
    );
  }

  Widget menuOlustur(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Dashboard",
              style: menuStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Messages",
              style: menuStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Utility Bills",
              style: menuStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Fund Transfer",
              style: menuStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Branches",
              style: menuStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget dashboardOlustur(BuildContext context) {
    return AnimatedPositioned(
      top: menuAcikmi ? 0.2 * ekranYuksekligi : 0,
      bottom: menuAcikmi ? 0.2 * ekranYuksekligi : 0,
      left: menuAcikmi ? 0.6 * ekranGenisligi : 0,
      right: menuAcikmi ? -0.4 * ekranGenisligi : 0,
      duration: const Duration(seconds: 1),
      child: Material(
        elevation: 8,
        color: backgroundColor,
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        menuAcikmi = !menuAcikmi;
                      });
                    },
                    child: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    "My Cards",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  const Icon(
                    Icons.add_circle_outline,
                    color: Colors.white,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
