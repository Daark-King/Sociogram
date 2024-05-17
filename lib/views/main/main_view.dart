import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sociogram/state/auth/providers/auth_state_provider.dart';
import 'package:sociogram/state/image_upload/helpers/image_picker_helper.dart';
import 'package:sociogram/state/image_upload/models/file_type.dart';
import 'package:sociogram/state/post_settings/providers/post_settings_provider.dart';
import 'package:sociogram/views/components/dialogs/alert_dialog_model.dart';
import 'package:sociogram/views/components/dialogs/logout_dialog.dart';
import 'package:sociogram/views/constants/strings.dart';
import 'package:sociogram/views/create_new_post/create_new_post_view.dart';
import 'package:sociogram/views/tabs/search/search_view.dart';
import 'package:sociogram/views/tabs/users_posts/user_posts_view.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 49, 51, 52),
          title: const Text(
            Strings.appName,
          ),
          actions: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.film),
              onPressed: () async {
                final videoFile =
                    await ImagePickerHelper.pickVideoFromGallery();

                if (videoFile == null) {
                  return;
                }
                // ignore: unused_result
                ref.refresh(postSettingProvider);
                if (!mounted) {
                  return;
                }
                Navigator.push(
                  // ignore: use_build_context_synchronously
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateNewPostView(
                      fileToPost: videoFile,
                      fileType: FileType.video,
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.add_photo_alternate_outlined,
              ),
              onPressed: () async {
                final imageFile =
                    await ImagePickerHelper.pickImageFromGallery();

                if (imageFile == null) {
                  return;
                }
                // ignore: unused_result
                ref.refresh(postSettingProvider);
                if (!mounted) {
                  return;
                }
                Navigator.push(
                  // ignore: use_build_context_synchronously
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateNewPostView(
                      fileToPost: imageFile,
                      fileType: FileType.image,
                    ),
                  ),
                );
              },
            ),
            IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () async {
                  final shouldLogOut = await const LogoutDialog()
                      .present(context)
                      .then((value) => value ?? false);
                  if (shouldLogOut) {
                    await ref.read(authStateProvider.notifier).logOut();
                  }
                }),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.person,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.search,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.home,
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UserPostsView(),
            SearchView(),
            UserPostsView(),
          ],
        ),
      ),
    );
  }
}
