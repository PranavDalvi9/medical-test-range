import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_test_range/infrastructure/provider/provider_registration.dart';

class BarWidget extends ConsumerStatefulWidget {
  const BarWidget({super.key});

  @override
  ConsumerState<BarWidget> createState() => _BarWidgetState();
}

class _BarWidgetState extends ConsumerState<BarWidget> {
  @override
  Widget build(BuildContext context) {
    final homeProviderWatch = ref.watch(homeProvider);
    final homeProviderRead = ref.read(homeProvider);
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: 340,
            child: Row(
              children: [
                for (int i = 0; i < homeProviderRead.metaData.length; i++)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        i % 2 == 0
                            ? homeProviderRead.metaData[i].rangeEnd.toString()
                            : "",
                        style: const TextStyle(fontSize: 10),
                      ),
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
                      ),
                      Text(
                        i % 2 != 0
                            ? homeProviderRead.metaData[i].rangeEnd.toString()
                            : '',
                        style: const TextStyle(fontSize: 10),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 340 + 28,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: (340 /
                            homeProviderRead
                                .metaData[homeProviderRead.metaData.length - 1]
                                .rangeEnd) *
                        homeProviderWatch.displayValue),
                child: Column(
                  children: [
                    const Icon(
                      Icons.arrow_drop_up_sharp,
                    ),
                    Text(
                      homeProviderWatch.displayValue.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
