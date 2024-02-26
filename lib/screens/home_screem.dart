import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_test_range/infrastructure/provider/provider_registration.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeProviderWatch = ref.watch(homeProvider);
    final homeProviderRead = ref.read(homeProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              width: 340,
              height: 50,
              child: Row(
                children: [
                  for (int i = 0; i < homeProviderRead.metaData.length; i++)
                    Container(
                      height: 40,
                      width: (340 /
                              homeProviderRead
                                  .metaData[
                                      homeProviderRead.metaData.length - 1]
                                  .rangeEnd) *
                          (homeProviderRead.metaData[i].rangeEnd -
                              homeProviderRead.metaData[i].rangeStart),
                      color: homeProviderRead.metaData[i].color,
                    )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 340 + 24,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: (340 /
                              homeProviderRead
                                  .metaData[
                                      homeProviderRead.metaData.length - 1]
                                  .rangeEnd) *
                          0),
                  child: const Icon(Icons.arrow_drop_up_sharp),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
