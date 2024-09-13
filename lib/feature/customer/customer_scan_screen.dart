import 'package:blanc_f/feature/customer/component/customer_scan_bar.dart';
import 'package:blanc_f/feature/customer/customer_list_view_model.dart';
import 'package:blanc_f/global/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomerScanScreen extends ConsumerWidget {
  const CustomerScanScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHasClinicData = ref.watch(customerListViewModelProvider.select((state) => state.isClinicId));
    final list = ref.watch(customerListViewModelProvider.select((state) => state.list));
    return Scaffold(
        body: SafeArea(
            child: AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: isHasClinicData
          ? CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(24.0),
                  sliver: SliverToBoxAdapter(
                      child: CustomerScanBar(onCancelTap: () {}, onSearchTap: (String query) {}, onRegisterTap: () {})),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => ListTile(
                            title: Text('Item #$index'),
                          ),
                      childCount: 100),
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(
                color: PrimaryColor,
              ),
            ),
    )));
  }
}
