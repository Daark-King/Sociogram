import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sociogram/state/post_settings/models/post_setting.dart';
import 'package:sociogram/state/post_settings/notifers/post_settings_notifier.dart';

final postSettingProvider =
    StateNotifierProvider<PostSettingsNotifier, Map<PostSetting, bool>>((ref) {
  return PostSettingsNotifier();
});
