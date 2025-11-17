import 'package:blocker/app/modules/home/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:blocker/app/modules/home/widgets/list_view_widget.dart';
import 'package:blocker/app/modules/home/widgets/text_field_widget.dart';
import 'package:get/get.dart';
import 'package:get_shimmer/get_shimmer.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return GetShimmer.fromColors(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      // shrinkWrap: true,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      itemBuilder: (context, index) {
                        return ListTile(
                          isThreeLine: true,
                          leading: CircleAvatar(radius: 30),
                          title: Container(
                            margin: EdgeInsets.only(right: 20),
                            height: 15,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          trailing: Container(
                            width: 60,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          subtitle: Container(
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Column(
            children: [
              TextFieldWidget(
                controller: controller.searchController,
                onChanged: (value) => controller.searchQuery.value = value,
                onPressedClose: () => controller.clearSearch(),
              ),
              ListViewWidget(),
            ],
          );
        }
      }),
    );
  }
}
