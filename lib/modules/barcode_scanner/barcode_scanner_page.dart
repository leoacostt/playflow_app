import 'package:flutter/material.dart';
import 'package:playflow_app/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:playflow_app/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:playflow_app/shared/themes/app_colors.dart';
import 'package:playflow_app/shared/themes/app_text_styles.dart';
import 'package:playflow_app/shared/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:playflow_app/shared/widgets/set_label_buttons.dart/set_label_buttons.dart';

class BarcodeScannerPage extends StatefulWidget {
  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();
  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.popAndPushNamed(context, "/insert_boleto");
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.showCamera) {
                  return Container(
                    child: status.cameraController!.buildPreview(),
                  );
                } else {
                  return Container();
                }
              }),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.black,
                centerTitle: true,
                title: Text(
                  'Escanie o código de barras do boleto',
                  style: TextStyles.buttonBackground,
                ),
                leading: BackButton(
                  color: AppColors.background,
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.black.withOpacity(0.6),
                  )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.transparent,
                      )),
                  Expanded(
                      child: Container(
                    color: Colors.black.withOpacity(0.6),
                  )),
                ],
              ),
              bottomNavigationBar: SetLabelButtons(
                primaryLabel: 'Inserir código do boleto',
                primaryOnPressed: () {},
                secondaryLabel: 'Adicionar da galeria',
                secondaryOnPressed: () {},
              ),
            ),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.hasError) {
                  return BottomSheetWidget(
                      primaryLabel: 'Escanear Novamente',
                      primaryOnPressed: () {
                        controller.getAvailableCameras();
                      },
                      secondaryLabel: 'Digitar código',
                      secondaryOnPressed: () {},
                      title: 'Não foi possível identificar um código de barras',
                      subtitle:
                          'Tente escanear novamente ou digite o código de barras');
                } else {
                  return Container();
                }
              })
        ],
      ),
    );
  }
}
