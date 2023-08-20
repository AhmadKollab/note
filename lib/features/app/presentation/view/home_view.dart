import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:note/core/constants.dart';
import 'package:note/core/resources/manager_colors.dart';
import 'package:note/core/resources/manager_font_sizes.dart';
import 'package:note/core/resources/manager_height.dart';
import 'package:note/core/resources/manager_raduis.dart';
import 'package:note/core/resources/manager_strings.dart';
import 'package:note/core/resources/manager_width.dart';
import 'package:note/features/app/presentation/controller/HomeController.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController _homeController =
      Get.put<HomeController>(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ManagerColors.transparent,
        elevation: Constants.elevationZero,
        title: Text(
          ManagerStrings.appName,
          style: TextStyle(
              color: ManagerColors.white, fontSize: ManagerFontSizes.s20),
        ),
      ),
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        elevation: Constants.elevationZero,
        onPressed: () {},
        backgroundColor: ManagerColors.thirdColor,
        child: Icon(
          Icons.add,
          color: ManagerColors.white,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
            vertical: ManagerHeight.h14, horizontal: ManagerWidth.w14),
        color: ManagerColors.primaryColor,

        child:GetBuilder<HomeController>(builder: (controller)=>
            GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Card(
                  elevation: Constants.elevationZero,
                  color: ManagerColors.secondaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(ManagerRadius.r12)),
                ),
              );
            },
            itemCount: controller.notes.length,
          ))
      ),
    );
  }
}
