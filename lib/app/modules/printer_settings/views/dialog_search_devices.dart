import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../controllers/printer_settings_controller.dart';

class DialogSearchDevices extends GetView<PrinterSettingsController> {
  const DialogSearchDevices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari Devices'),
        leading: const CloseButton(),
      ),
      body: Obx(
        () {
          return Column(
            children: [
              if (controller.isScanning.value) const LinearProgressIndicator(),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final item = controller.bluetoothDevices.elementAt(index);
                    final device = item.device;

                    Logger().d(
                        'debug: device ${device.advName}, isConnected = ${device.isConnected}');

                    return ListTile(
                      title: Text(device.advName),
                      subtitle: Text('${device.remoteId}'),
                      trailing: StreamBuilder(
                        stream: device.connectionState,
                        builder: (context, snapshot) {
                          final isConnected = snapshot.data ==
                              BluetoothConnectionState.connected;

                          Logger().d(
                            "debug: test = ${device.disconnectReason?.code} ${device.disconnectReason?.description}",
                          );

                          // Logger().d(
                          //     'debug: device ${device.advName}, ${snapshot.data}');

                          var icon = Icons.bluetooth_rounded;
                          var onPressed = () {
                            controller.connecting(item);
                          };

                          if (isConnected) {
                            icon = Icons.bluetooth_connected_rounded;
                            onPressed = () {
                              controller.disconnect(item);
                            };
                          }

                          return IconButton(
                            onPressed: onPressed,
                            icon: Icon(icon),
                          );
                        },
                      ),
                      onTap: () => controller.onTapPrinter(item),
                    );
                  },
                  itemCount: controller.bluetoothDevices.length,
                ),
              ),
            ],
          );
        },
      ),
      // body: StreamBuilder(
      //   stream: FlutterBluePlus.onScanResults,
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator.adaptive(),
      //       );
      //     }

      //     final data = snapshot.data;

      //     return ListView.builder(
      //       itemBuilder: (context, index) {
      //         final item = data?[index];
      //         final device = item?.device;

      //         return ListTile(
      //           title: (device != null)
      //               ? Text('${item?.device.advName}')
      //               : null,
      //           subtitle: Text('${item?.device.remoteId}'),
      //           onTap: () => controller.onTapPrinter(item),
      //         );
      //       },
      //       itemCount: data?.length,
      //     );
      //   },
      // ),
    );
  }
}
