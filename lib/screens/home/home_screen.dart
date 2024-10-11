import 'package:animation_2/constants.dart';
import 'package:animation_2/controllers/home_controller.dart';
import 'package:animation_2/models/Product.dart';
import 'package:animation_2/screens/deatils/details_screen.dart';
import 'package:animation_2/screens/home/components/cart_details_view.dart';
import 'package:animation_2/screens/home/components/cart_short_view.dart';
import 'package:animation_2/screens/home/components/product_card.dart';
import 'package:flutter/material.dart';

import 'components/header.dart';

class HomeScreen extends StatelessWidget {
  final controller = HomeController();
  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < 0.7) {
      controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12) {
      controller.changeHomeState(HomeState.normal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Color(0xFFEAEAEA),
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      AnimatedPositioned(
                        duration: panelTransition,
                        left: 0,
                        right: 0,
                        top: controller.homeState == HomeState.normal
                            ? headerHeight
                            : -(constraints.maxHeight -
                                cartBarHeight * 2 -
                                headerHeight),
                        height: constraints.maxHeight -
                            cartBarHeight -
                            headerHeight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(defaultPadding * 1.5),
                              bottomRight:
                                  Radius.circular(defaultPadding * 1.5),
                            ),
                          ),
                          child: GridView.builder(
                            itemCount: demo_products.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              mainAxisSpacing: defaultPadding,
                              crossAxisSpacing: defaultPadding,
                            ),
                            itemBuilder: (context, index) => ProductCard(
                              product: demo_products[index],
                              press: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 500),
                                      reverseTransitionDuration:
                                          const Duration(milliseconds: 500),
                                      pageBuilder: (context, animation,
                                          secondaryAnimation) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: DetailsScreen(
                                            product: demo_products[index],
                                            onProductAdd: () {
                                              controller.addProductToCart(
                                                  demo_products[index]);
                                            },
                                          ),
                                        );
                                      },
                                    ));
                              },
                            ),
                          ),
                        ),
                      ),
                      // Card Panel
                      AnimatedPositioned(
                        duration: panelTransition,
                        curve: Curves.linear,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        height: controller.homeState == HomeState.normal
                            ? cartBarHeight
                            : (constraints.maxHeight - cartBarHeight),
                        child: GestureDetector(
                          onVerticalDragUpdate: _onVerticalGesture,
                          child: Container(
                            padding: const EdgeInsets.all(defaultPadding),
                            color: Color(0xFFEAEAEA),
                            alignment: Alignment.topLeft,
                            child: AnimatedSwitcher(
                              duration: panelTransition,
                              child: controller.homeState == HomeState.normal
                                  ? CardShortView(controller: controller)
                                  : CartDetailsView(controller: controller),
                            ),
                          ),
                        ),
                      ),
                      // Header
                      AnimatedPositioned(
                        duration: panelTransition,
                        left: 0,
                        right: 0,
                        top: controller.homeState == HomeState.normal
                            ? 0
                            : -headerHeight,
                        height: headerHeight,
                        child: HomeHeader(),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
