import 'package:amplitude_flutter/amplitude.dart';
import 'package:amplitude_flutter/configuration.dart';
import 'package:amplitude_flutter/events/base_event.dart';
import 'package:experiment_sdk_flutter/types/experiment_exposure_tracking_provider.dart';
import 'package:experiment_sdk_flutter/types/experiment_variant.dart';

class AnalyticsExposureTrackingProvider implements ExperimentExposureTrackingProvider {
  @override
  Future<void> exposure(String flagkey, ExperimentVariant? variant, String apiKey) async {
    final properties = {'variant': variant?.value, 'flag_key': flagkey};

    if (variant == null) {
      properties.remove('variant');
    }

    final ampli = Amplitude(Configuration(apiKey: apiKey));
    await ampli.track(BaseEvent("\$exposure", eventProperties: properties));
    await ampli.flush();
  }
}
