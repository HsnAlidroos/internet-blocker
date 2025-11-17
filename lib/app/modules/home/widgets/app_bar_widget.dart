import 'package:blocker/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shimmer/get_shimmer.dart';

class AppBarWidget extends GetView<HomeController>
    implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      title: const Text('VPN Blocker'),
      centerTitle: true,
      actions: [
        Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: controller.isLoading.value
                ? GetShimmer.fromColors(
                    baseColor: Colors.blue.shade100,
                    highlightColor: Colors.blueAccent.shade100,
                    child: Container(
                      width: 60,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  )
                : Switch(
                    value: controller.isVPNEnabled.value,
                    onChanged: controller.toggleVPN,
                  ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
