import 'package:flutter/material.dart';
import '../../../../widgets/empty_bag.dart';
import '../../../services/assets_manager.dart';
import '../../../widgets/title_text.dart';
import 'orders_widget.dart';
import 'package:tiklaal/screens/home_screen.dart';

class OrdersScreenFree extends StatefulWidget {
  static const routeName = '/OrderScreen';

  const OrdersScreenFree({super.key});

  @override
  State<OrdersScreenFree> createState() => _OrdersScreenFreeState();
}

class _OrdersScreenFreeState extends State<OrdersScreenFree> {
  bool isEmptyOrders = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitlesTextWidget(
          label: 'Mevcut Siparişler',
        ),
      ),
      body: isEmptyOrders
          ? EmptyBagWidget(
              imagePath: AssetsManager.orderBag,
              title: "Herhangi bir sipariş bulunmamaktadır",
              subtitle: "",
              buttonText: "Şimdi Al", onPressed: () { Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()), // yönlendirme işlemi
          ); },
            )
          : ListView.separated(
              itemCount: 15,
              itemBuilder: (ctx, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                  child: OrdersWidgetFree(),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  // thickness: 8,
                  // color: Colors.red,
                );
              },
            ),
    );
  }
}
