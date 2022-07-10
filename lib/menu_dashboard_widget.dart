import 'package:flutter/material.dart';

const TextStyle menuStyle = TextStyle(color: Colors.white, fontSize: 20);
Color backgroundColor = const Color(0xFF333340);

class MenuDashboard extends StatelessWidget {
  const MenuDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    return Material(
      elevation: 8,
      color: backgroundColor,
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                Text(
                  "My Cards",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
