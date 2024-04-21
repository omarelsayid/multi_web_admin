import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:multi_web_admin/views/buyers/nav_screen/categoryies_screen.dart';
import 'package:multi_web_admin/views/buyers/nav_screen/dashboard_screen.dart';
import 'package:multi_web_admin/views/buyers/nav_screen/order_screen.dart';
import 'package:multi_web_admin/views/buyers/nav_screen/products_screen.dart';
import 'package:multi_web_admin/views/buyers/nav_screen/upload_screen.dart';
import 'package:multi_web_admin/views/buyers/nav_screen/vendors_screen.dart';
import 'package:multi_web_admin/views/buyers/nav_screen/withdrawal_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedItem = const DashboardScreen();

  screenSlector(item) {
    switch (item.route) {
      case DashboardScreen.routeName:
        setState(() {
          _selectedItem = const DashboardScreen();
        });

        break;
      case VendorScreen.routeName:
        setState(() {
          _selectedItem = const VendorScreen();
        });

        break;
      case WithDrawalScreen.routeName:
        setState(() {
          _selectedItem = const WithDrawalScreen();
        });

        break;
      case OrderScreen.routeName:
        setState(() {
          _selectedItem = const OrderScreen();
        });

        break;

      case ProductScreen.routeName:
        setState(() {
          _selectedItem = const ProductScreen();
        });

        break;

      case UpLoadScreen.routeName:
        setState(() {
          _selectedItem = const UpLoadScreen();
        });
        break;
      case CategoriesScreen.routeName:
        setState(() {
          _selectedItem = const CategoriesScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: 'DashBoard',
            icon: Icons.dashboard,
            route: DashboardScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Vendors',
            icon: CupertinoIcons.person_3,
            route: VendorScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Withdrawal',
            icon: CupertinoIcons.money_dollar,
            route: WithDrawalScreen.routeName,
          ),
           AdminMenuItem(
            title: 'orders',
            icon: CupertinoIcons.cart,
            route: OrderScreen.routeName,
          ),
          
          AdminMenuItem(
            title: 'categories',
            icon: Icons.category,
            route: CategoriesScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Products',
            icon: Icons.shop,
            route: ProductScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Upload',
            icon: CupertinoIcons.add,
            route: UpLoadScreen.routeName,
          ),
        ],
        selectedRoute: '',
        onSelected: (item) {
          screenSlector(item);
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'omar Store Panel',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'footer',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),

      body: _selectedItem,
      // backgroundColor: Colors.yellow.shade900,
      appBar: AppBar(
        title: const Text(
          'Managment',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}
