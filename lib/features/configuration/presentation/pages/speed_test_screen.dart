import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indubatch_movil/core/components/custom_loading.dart';
import 'package:indubatch_movil/core/components/primary_button.dart';
import 'package:indubatch_movil/core/theme/colors.dart';
import 'package:indubatch_movil/core/theme/fonts.dart';
import 'package:indubatch_movil/features/configuration/presentation/bloc/configuration_bloc.dart';
import 'package:indubatch_movil/features/configuration/presentation/widgets/radial_non_linear.dart';
import 'package:indubatch_movil/injection_container.dart.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:speed_test_dart/classes/server.dart';
import 'package:speed_test_dart/speed_test_dart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SpeedTestScreen extends StatefulWidget {
  const SpeedTestScreen({super.key});
  static const routeName = "/speedTest";

  @override
  State<SpeedTestScreen> createState() => _SpeedTestScreenState();
}

class _SpeedTestScreenState extends State<SpeedTestScreen> {
  SpeedTestDart tester = SpeedTestDart();
  List<Server> bestServersList = [];

  double downloadRate = 0;
  double uploadRate = 0;

  bool readyToTest = false;
  bool loading = false;

  final ConfigurationBloc configurationBloc = getIt<ConfigurationBloc>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      configurationBloc.add(SetServersListSpeedTestEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider.value(
          value: configurationBloc,
          child: BlocConsumer<ConfigurationBloc, ConfigurationState>(
            listener: (context, state) async {
              if (state is LoadingSetServersListSpeedTestState) {
                loading = true;
                readyToTest = false;
              }
              if (state is LoadingTestDownloadSpeedState ||
                  state is LoadingTestUploadSpeedState) {
                loading = true;
              }
              if (state is SuccesSetServersListSpeedTestState) {
                setState(() {
                  bestServersList = state.responseEntity;
                });
                loading = false;
                readyToTest = true;
              }
              if (state is SuccesTestDownloadSpeedState) {
                //TODO implementar servicio de coneccion con el api
                setState(() {
                  downloadRate = state.responseEntity;
                });
                loading = false;
              }
              if (state is SuccesTestUploadSpeedState) {
                //TODO implementar servicio de coneccion con el api
                setState(() {
                  uploadRate = state.responseEntity;
                });
                loading = false;
              }
            },
            builder: (context, state) =>
                loading ? const CustomLoadingPage() : _principalBody(),
          ),
        ),
      ),
    );
  }

  Widget _principalBody() {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context)!.downloadTest,
                style: textBlackStyleSubTitle(Adaptive.sp(20)),
              ),
              SizedBox(
                height: 30.h,
                child: RadialNonLinear(
                  percentageValue: downloadRate,
                ),
              ),
              Text(
                '${AppLocalizations.of(context)!.downloadResult} ${downloadRate.toStringAsFixed(2)} Mb/s',
                style:
                    textStyleInput(primaryColor, size.width > 700 ? 2.w : 4.w),
              ),
              SizedBox(
                width: 50.w,
                height: 4.h,
                child: PrimaryButton(
                  onPressed: () {
                    if (!readyToTest || bestServersList.isEmpty) return;
                    configurationBloc
                        .add(TestDownloadSpeedEvent(servers: bestServersList));
                  },
                  height: 6.h,
                  child: Text(AppLocalizations.of(context)!.start,
                      style: textWhiteStyleButton),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                AppLocalizations.of(context)!.uploadTest,
                style: textBlackStyleSubTitle(Adaptive.sp(20)),
              ),
              SizedBox(
                height: 30.h,
                child: RadialNonLinear(
                  percentageValue: uploadRate,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                  '${AppLocalizations.of(context)!.uploadResult} ${uploadRate.toStringAsFixed(2)} Mb/s',
                  style: textStyleInput(
                      primaryColor, size.width > 700 ? 2.w : 4.w)),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 50.w,
                height: 4.h,
                child: PrimaryButton(
                  onPressed: () {
                    if (!readyToTest || bestServersList.isEmpty) return;
                    configurationBloc
                        .add(TestUploadSpeedEvent(servers: bestServersList));
                  },
                  height: 6.h,
                  child: Text(AppLocalizations.of(context)!.start,
                      style: textWhiteStyleButton),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
