import 'package:blanc_f/feature/customer/component/customer_scan_bar.dart';
import 'package:blanc_f/feature/customer/customer_list_view_model.dart';
import 'package:blanc_f/global/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomerScanScreen extends HookConsumerWidget {
  const CustomerScanScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useScrollController();

    final isHasClinicData = ref.watch(
        customerListViewModelProvider.select((state) => state.isClinicId));
    final list =
        ref.watch(customerListViewModelProvider.select((state) => state.list));

    final needLoadMore =
        ref.watch(customerListViewModelProvider.select((state) {
      return state.isEndOfList == false && state.list.isNotEmpty;
    }));

    useEffect(() {
      controller.addListener(() {
        if (controller.position.pixels >=
            controller.position.maxScrollExtent - 100) {
          ref.read(customerListViewModelProvider.notifier).loadMore();
        }
      });
      return null;
    }, []);

    print("isHasClinicData: $isHasClinicData");

    return Scaffold(
        body: SafeArea(
            child: AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: isHasClinicData
          ? CustomScrollView(
              controller: controller,
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(24.0),
                  sliver: SliverToBoxAdapter(
                      child: CustomerScanBar(
                          onCancelTap: () {},
                          onSearchTap: (String query) {
                            ref
                                .read(customerListViewModelProvider.notifier)
                                .loadMore();
                          },
                          onRegisterTap: () {})),
                ),
                // SliverList(
                //   key: const ValueKey("loaded"),
                //   delegate: SliverChildBuilderDelegate((context, index) => ListTile(
                //             title: Text('Item #$index'),
                //           ),
                //       childCount: 100),
                // ),
                SliverList.builder(
                  key: const ValueKey("loaded"),
                  itemCount: list.length + (needLoadMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == list.length) {
                      return const SizedBox(
                        height: 90,
                        child: Center(
                          child: SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator()),
                        ),
                      );
                    } else {
                      return ListTile(
                          title: Container(
                        height: 90,
                        child: Center(
                          child: Text('Item # ${list[index].attributes.name} => ${list[index].id}'),
                        ),
                      ));
                    }
                  },
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
