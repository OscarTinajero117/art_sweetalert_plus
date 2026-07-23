import 'dart:convert';

import 'package:art_sweetalert_plus/art_sweetalert_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

/// The main entry point for the application.
class MyApp extends StatelessWidget {
  /// Constructs the [MyApp] instance.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Art SweetAlert Plus Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Art SweetAlert Plus Demo'),
    );
  }
}

/// The home page displaying all available alert types.
class MyHomePage extends StatefulWidget {
  /// Constructs the [MyHomePage] instance with the required [title].
  const MyHomePage({super.key, required this.title});

  /// The title displayed in the application bar.
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();
  late GlobalKey<ArtDialogState> _artDialogKey;

  @override
  void initState() {
    super.initState();
    _artDialogKey = GlobalKey<ArtDialogState>();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: colorScheme.inversePrimary,
        elevation: 0,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: <Widget>[
              _buildSectionTitle('Basic Alert Types', colorScheme),
              _buildCard(
                title: 'Success Message',
                subtitle: 'Displays a success icon with a message.',
                icon: Icons.check_circle_outline,
                color: Colors.green,
                onTap: () {
                  ArtSweetAlertPlus.show(
                    context: context,
                    artDialogArgs: ArtDialogArgs(
                      type: ArtSweetAlertPlusType.success,
                      title: 'A success message!',
                      text: 'Operation completed successfully.',
                    ),
                  );
                },
              ),
              _buildCard(
                title: 'Warning Message',
                subtitle: 'Displays a warning icon.',
                icon: Icons.warning_amber_rounded,
                color: Colors.orange,
                onTap: () {
                  ArtSweetAlertPlus.show(
                    context: context,
                    artDialogArgs: ArtDialogArgs(
                      type: ArtSweetAlertPlusType.warning,
                      title: 'A warning message!',
                      text: 'Please be cautious about this action.',
                    ),
                  );
                },
              ),
              _buildCard(
                title: 'Danger (Error) Message',
                subtitle: 'Displays an error icon.',
                icon: Icons.error_outline,
                color: Colors.red,
                onTap: () {
                  ArtSweetAlertPlus.show(
                    context: context,
                    artDialogArgs: ArtDialogArgs(
                      type: ArtSweetAlertPlusType.danger,
                      title: 'Oops...',
                      text: 'An error occurred during the process.',
                    ),
                  );
                },
              ),
              _buildCard(
                title: 'Question Message',
                subtitle: 'Displays a question mark icon.',
                icon: Icons.help_outline,
                color: Colors.blue,
                onTap: () {
                  ArtSweetAlertPlus.show(
                    context: context,
                    artDialogArgs: ArtDialogArgs(
                      type: ArtSweetAlertPlusType.question,
                      title: 'A question?',
                      text: 'Are you sure you want to proceed?',
                    ),
                  );
                },
              ),
              _buildCard(
                title: 'Info Message',
                subtitle: 'Displays an info icon.',
                icon: Icons.info_outline,
                color: Colors.cyan,
                onTap: () {
                  ArtSweetAlertPlus.show(
                    context: context,
                    artDialogArgs: ArtDialogArgs(
                      type: ArtSweetAlertPlusType.info,
                      title: 'Information',
                      text: 'This is an informational message.',
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              _buildSectionTitle('Advanced & Custom Dialogs', colorScheme),
              _buildCard(
                title: 'Dialog with Custom Image',
                subtitle: 'A dialog rendering a local asset image.',
                icon: Icons.image_outlined,
                color: colorScheme.primary,
                onTap: () {
                  ArtSweetAlertPlus.show(
                    context: context,
                    artDialogArgs: ArtDialogArgs(
                      title: 'A custom image!',
                      customColumns: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 12.0),
                          child: Image.asset('assets/nyan-cat.gif'),
                        ),
                      ],
                    ),
                  );
                },
              ),
              _buildCard(
                title: 'Confirm Dialog',
                subtitle: 'A dialog with confirm and cancel buttons.',
                icon: Icons.pan_tool_alt_outlined,
                color: colorScheme.primary,
                onTap: () async {
                  final ArtDialogResponse response =
                      await ArtSweetAlertPlus.show(
                        barrierDismissible: false,
                        context: context,
                        artDialogArgs: ArtDialogArgs(
                          denyButtonText: 'Cancel',
                          title: 'Are you sure?',
                          text: 'You will not be able to revert this action!',
                          confirmButtonText: 'Yes, delete it',
                          type: ArtSweetAlertPlusType.warning,
                        ),
                      );

                  if (response.isTapConfirmButton) {
                    if (context.mounted) {
                      ArtSweetAlertPlus.show(
                        context: context,
                        artDialogArgs: ArtDialogArgs(
                          type: ArtSweetAlertPlusType.success,
                          title: 'Deleted successfully!',
                        ),
                      );
                    }
                  }
                },
              ),
              _buildCard(
                title: 'Three Button Dialog',
                subtitle: 'A dialog with three interactive buttons.',
                icon: Icons.view_column_outlined,
                color: colorScheme.primary,
                onTap: () async {
                  final ArtDialogResponse response =
                      await ArtSweetAlertPlus.show(
                        barrierDismissible: false,
                        context: context,
                        artDialogArgs: ArtDialogArgs(
                          showCancelBtn: true,
                          denyButtonText: 'Do not save',
                          title: 'Do you want to save the changes?',
                          confirmButtonText: 'Save',
                        ),
                      );

                  if (!context.mounted) return;

                  if (response.isTapConfirmButton) {
                    ArtSweetAlertPlus.show(
                      context: context,
                      artDialogArgs: ArtDialogArgs(
                        type: ArtSweetAlertPlusType.success,
                        title: 'Saved!',
                      ),
                    );
                    return;
                  }

                  if (response.isTapDenyButton) {
                    ArtSweetAlertPlus.show(
                      context: context,
                      artDialogArgs: ArtDialogArgs(
                        type: ArtSweetAlertPlusType.info,
                        title: 'Changes were discarded.',
                      ),
                    );
                    return;
                  }
                },
              ),
              _buildCard(
                title: 'Custom Padding and Background',
                subtitle: 'Customized dialog styling.',
                icon: Icons.format_paint_outlined,
                color: colorScheme.primary,
                onTap: () {
                  ArtSweetAlertPlus.show(
                    context: context,
                    artDialogArgs: ArtDialogArgs(
                      dialogPadding: const EdgeInsets.all(60),
                      title: 'Custom styling applied.',
                      titleColor: Colors.black,
                      barrierColor: const Color.fromRGBO(0, 0, 123, 0.4),
                      decorationImage: const DecorationImage(
                        image: AssetImage('assets/trees.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
              _buildCard(
                title: 'Network Image Customization',
                subtitle: 'Dialog with a network image.',
                icon: Icons.wifi_tethering_outlined,
                color: colorScheme.primary,
                onTap: () {
                  ArtSweetAlertPlus.show(
                    context: context,
                    artDialogArgs: ArtDialogArgs(
                      title: 'Remote Image!',
                      text: 'Modal displaying an image from the network.',
                      customColumns: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 12.0),
                          child: Image.network('https://unsplash.it/400/200'),
                        ),
                      ],
                    ),
                  );
                },
              ),
              _buildCard(
                title: 'GitHub API Integration',
                subtitle: 'Submit a username to fetch an avatar.',
                icon: Icons.api_outlined,
                color: colorScheme.primary,
                onTap: () async {
                  final ArtDialogResponse
                  response = await ArtSweetAlertPlus.show(
                    artDialogKey: _artDialogKey,
                    context: context,
                    artDialogArgs: ArtDialogArgs(
                      title: 'Submit a GitHub username',
                      customColumns: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20.0),
                          child: CupertinoTextField(
                            controller: _textController,
                            placeholder: 'Username',
                          ),
                        ),
                      ],
                      onConfirm: () async {
                        _artDialogKey.currentState?.showLoader();
                        try {
                          final http.Response apiResponse = await http.get(
                            Uri.parse(
                              'https://api.github.com/users/${_textController.text}',
                            ),
                          );
                          if (apiResponse.statusCode != 200) {
                            _artDialogKey.currentState?.hideLoader();
                            _artDialogKey.currentState?.showErrors([
                              'Request failed. User may not exist.',
                            ]);
                            return;
                          }
                          final Map<String, dynamic> bodyJson = json.decode(
                            apiResponse.body,
                          );
                          _artDialogKey.currentState?.hideLoader();
                          _artDialogKey.currentState?.closeDialog(
                            data: {'image': bodyJson['avatar_url']},
                          );
                        } catch (e) {
                          _artDialogKey.currentState?.hideLoader();
                          _artDialogKey.currentState?.showErrors([
                            'An unexpected error occurred.',
                          ]);
                        }
                      },
                      onDispose: () {
                        _artDialogKey = GlobalKey<ArtDialogState>();
                      },
                    ),
                  );

                  if (response.isTapConfirmButton && context.mounted) {
                    ArtSweetAlertPlus.show(
                      context: context,
                      artDialogArgs: ArtDialogArgs(
                        customColumns: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 12.0),
                            child: Image.network(
                              response.data['image'] as String,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
