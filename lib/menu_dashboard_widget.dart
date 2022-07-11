import 'package:flutter/material.dart';

const TextStyle menuStyle = TextStyle(color: Color(0xFFB7B7B7), fontSize: 16);
Color backgroundColor = const Color(0xFFFAFCFD);

class MenuDashboard extends StatefulWidget {
  const MenuDashboard({Key? key}) : super(key: key);

  @override
  State<MenuDashboard> createState() => _MenuDashboardState();
}

class _MenuDashboardState extends State<MenuDashboard>
    with SingleTickerProviderStateMixin {
  late double ekranYuksekligi, ekranGenisligi;
  late int _secilenMenu;
  late bool isMenuOpen = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _scaleMenuAnimation;
  late Animation<Offset> _menuOffsetAnimation;
  final Duration _duration = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);
    _scaleAnimation = Tween(begin: 1.0, end: 0.85).animate(_controller);
    _scaleMenuAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _menuOffsetAnimation = Tween(
            begin: const Offset(-1, 0), end: const Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _secilenMenu = 0;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ekranYuksekligi = MediaQuery.of(context).size.height;
    ekranGenisligi = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: Theme(
          data: ThemeData(canvasColor: Colors.white),
          //alt kısımda bulunan bottom navigation bölümü seçilen sayfayı _secilenmenu içerisine atıyor oradan Navigation edilebilir.
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "",
                  backgroundColor: Colors.black),
              BottomNavigationBarItem(
                  icon: Icon(Icons.change_circle),
                  label: "",
                  backgroundColor: Colors.black),
              BottomNavigationBarItem(
                  icon: Icon(Icons.content_cut),
                  label: "",
                  backgroundColor: Colors.black),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: "",
                  backgroundColor: Colors.black),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "",
                  backgroundColor: Colors.black)
            ],
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                _secilenMenu = index;
              });
            },
            currentIndex: _secilenMenu,
          )),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [menuOlustur(context), dashboardOlustur(context)],
        ),
      ),
    );
  }

  //Sol tarafta stackte altta bulunan menünün oluşturulması.
  Widget menuOlustur(BuildContext context) {
    return SlideTransition(
      position: _menuOffsetAnimation,
      child: ScaleTransition(
        scale: _scaleMenuAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(400),
                      child: Image.asset(
                        "assets/ahmet.jpg",
                        scale: 3.0,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    "Ahmet BALKAN",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Text(
                    "İstanbul / Turkey",
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.wallet),
                        ),
                        Text(
                          "Dashboard",
                          style: menuStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.messenger_outline_sharp),
                        ),
                        Text(
                          "Messages",
                          style: menuStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.add_card),
                        ),
                        Text(
                          "Utility Bills",
                          style: menuStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.auto_mode_rounded),
                        ),
                        Text(
                          "Fund Transfer",
                          style: menuStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.apartment),
                        ),
                        Text(
                          "Branches",
                          style: menuStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //stackte üstte bulunan ana dizinin oluşturulması.
  Widget dashboardOlustur(BuildContext context) {
    return AnimatedPositioned(
      //menuyu sağ tarafa almak için isMenuOpendan faydalanıyoruz. isMenuOpen default değeri false tıklandığında ust kısımda bulunan stack küçülerek sağa geçiyor.
      top: 0,
      bottom: 0,
      left: isMenuOpen ? 0.4 * ekranGenisligi : 0,
      right: isMenuOpen ? -0.4 * ekranGenisligi : 0,
      duration: _duration,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          elevation: 8,
          borderRadius:
              isMenuOpen ? BorderRadius.circular(40) : BorderRadius.circular(0),
          //menu kapalıyken border radius verilmemesi için kullanılıyor.
          color: backgroundColor,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 8, bottom: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (isMenuOpen) {
                              _controller.reverse();
                            } else {
                              _controller.forward();
                            }
                            isMenuOpen = !isMenuOpen;
                          });
                        },
                        child: const Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        "My Cards",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      const Icon(
                        Icons.add_circle_outline,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 220,
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.blue.shade200, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.all(8),
                          color: Colors.blueAccent,
                          elevation: 5,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30.0, right: 30.0, top: 10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(top: 15.0),
                                          child: Text(
                                            "Current Balance",
                                            style: TextStyle(
                                                color: Colors.white38,
                                                fontSize: 10),
                                          ),
                                        ),
                                        Image.asset("assets/tankbank.png"),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: const [
                                        Text(
                                          "\$12.432.32",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Row(
                                        children: const [
                                          Text(
                                            "**** **** **** 1505",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text("Card Holder",
                                                  style: TextStyle(
                                                      color: Colors.white54,
                                                      fontSize: 8)),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10.0),
                                                child: Text("Ahmet BALKAN",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white,
                                                        fontSize: 15)),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text("Expires",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.white54,
                                                      fontSize: 8)),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10.0),
                                                child: Text("05/20",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color: Colors.white,
                                                        fontSize: 15)),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Image.asset(
                                                  "assets/mastercard.png")),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.blue.shade200, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.all(8),
                          color: Colors.redAccent,
                          elevation: 5,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30.0, right: 30.0, top: 10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(top: 15.0),
                                          child: Text(
                                            "Current Balance",
                                            style: TextStyle(
                                                color: Colors.white38,
                                                fontSize: 10),
                                          ),
                                        ),
                                        Image.asset("assets/tankbank.png"),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: const [
                                        Text(
                                          "\$1.235.32",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Row(
                                        children: const [
                                          Text(
                                            "**** **** **** 7707",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text("Card Holder",
                                                  style: TextStyle(
                                                      color: Colors.white54,
                                                      fontSize: 8)),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10.0),
                                                child: Text("Ahmet BALKAN",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white,
                                                        fontSize: 15)),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text("Expires",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.white54,
                                                      fontSize: 8)),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 10.0),
                                                child: Text("08/23",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color: Colors.white,
                                                        fontSize: 15)),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Image.asset(
                                                  "assets/visalogo.png")),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Transactions",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.tune),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Today",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListView.builder(
                        physics: const ScrollPhysics(
                            parent: BouncingScrollPhysics()),
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                leading: const Icon(
                                  Icons.apple,
                                  color: Colors.black,
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Macbook Pro 15' $index",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 12),
                                    ),
                                    const Text("Apple",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                            color: Colors.black54))
                                  ],
                                ),
                                trailing: Text("-2499\$",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: index % 2 == 0
                                            ? Colors.green
                                            : Colors.red)),
                              ),
                            ),
                          );
                        }),
                        itemCount: 2),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Yesterday",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListView.builder(
                        physics: const ScrollPhysics(
                            parent: BouncingScrollPhysics()),
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                leading: const Icon(
                                  Icons.apple,
                                  color: Colors.black,
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Macbook Pro 15' $index",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 12),
                                    ),
                                    const Text("Apple",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                            color: Colors.black54))
                                  ],
                                ),
                                trailing: Text("-2499\$",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: index % 2 == 0
                                            ? Colors.green
                                            : Colors.red)),
                              ),
                            ),
                          );
                        }),
                        itemCount: 3),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
