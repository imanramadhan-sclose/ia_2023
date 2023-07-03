import 'package:flutter/material.dart';
import './controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text(
                  'Hallo',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              GridView.count(
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 4,
                  children: const [
                    MenuIcon(
                      icon: Icons.hotel,
                      iconColor: Colors.red,
                      label: 'Hotel',
                    ),
                    MenuIcon(
                      icon: Icons.flight,
                      iconColor: Colors.green,
                      label: 'Pesawat',
                    ),
                    MenuIcon(
                      icon: Icons.train,
                      iconColor: Colors.purple,
                      label: 'KAI',
                    ),
                    MenuIcon(
                      icon: Icons.holiday_village,
                      iconColor: Colors.indigo,
                      label: 'Liburan',
                    ),
                    MenuIcon(
                      icon: Icons.card_giftcard,
                      iconColor: Colors.orangeAccent,
                      label: 'Voucher',
                    ),
                    MenuIcon(
                      icon: Icons.monetization_on,
                      iconColor: Colors.pink,
                      label: 'point',
                    ),
                    MenuIcon(
                      icon: Icons.account_balance,
                      iconColor: Colors.deepPurple,
                      label: 'Account',
                    ),
                    MenuIcon(
                      icon: Icons.devices_other,
                      iconColor: Colors.indigo,
                      label: 'Lainnya',
                    ),
                  ])
            ]))
          ],
        ));
  }
}

class MenuIcon extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;
  final String? label;

  const MenuIcon({super.key, this.icon, this.iconColor, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
                color: (iconColor ?? Colors.red).withOpacity(.2),
                borderRadius: BorderRadiusDirectional.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                (icon ?? Icons.close),
                color: (iconColor ?? Colors.red),
              ),
            )),
        const SizedBox(
          height: 10,
        ),
        Text(label ?? 'No Icon')
      ],
    );
  }
}
