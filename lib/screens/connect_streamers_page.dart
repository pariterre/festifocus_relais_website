import 'package:festifocus_relais_website/managers/twitch_manager.dart';
import 'package:festifocus_relais_website/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:twitch_manager/twitch_app.dart';

class ConnectStreamersPage extends StatefulWidget {
  const ConnectStreamersPage({super.key});

  static const route = '/connect-streamers-page';

  @override
  State<ConnectStreamersPage> createState() => _ConnectStreamersPageState();
}

class _ConnectStreamersPageState extends State<ConnectStreamersPage> {
  final List<TextEditingController> _streamerControllers = [];
  final Map<TextEditingController, bool> _isStreamerConnected = {};

  @override
  void initState() {
    super.initState();
    _reloadStreamers();
  }

  Future<void> _reloadStreamers() async {
    final preferences = await SharedPreferences.getInstance();
    final listOfStreamerNames = preferences.getStringList('streamers') ?? [];
    for (final streamerName in listOfStreamerNames) {
      _addStreamerToControllers(streamerName);
    }

    setState(() {});
  }

  void _addStreamerToControllers([String? streamerName]) {
    final controller = TextEditingController(text: streamerName)
      ..addListener(() => _saveStreamers());

    _streamerControllers.add(controller);
    _isStreamerConnected[controller] = false;
  }

  @override
  void dispose() {
    _isStreamerConnected.clear();
    for (final controller in _streamerControllers) {
      controller.dispose();
    }
    _streamerControllers.clear();
    super.dispose();
  }

  Future<void> _saveStreamers() async {
    final preferences = await SharedPreferences.getInstance();
    final listOfStreamerNames = <String>[];
    for (final controller in _streamerControllers) {
      if (controller.text.isEmpty) continue;
      listOfStreamerNames.add(controller.text);
    }
    preferences.setStringList('streamers', listOfStreamerNames);
  }

  void _connectStreamer({required String streamerName}) async {
    final manager = await showTwitchAppAuthenticationDialog(
      context,
      appInfo: TwitchManager.instance.appInfo,
      reload: true,
      saveKey: streamerName,
      useMocker: TwitchManager.instance.useMock,
      debugPanelOptions: TwitchManager.instance.debugOptions,
    );
    if (!mounted || manager == null) return;

    final streamer = await TwitchManager.instance.streamerFromManager(
      manager: manager,
    );
    if (streamer == null) return;

    TwitchManager.instance.addStreamer(streamer: streamer, manager: manager);
    final controller = _streamerControllers.firstWhere(
      (controller) => controller.text == streamerName,
    );
    _isStreamerConnected[controller] = true;
    await _saveStreamers();
    if (!mounted) return;

    if (_streamerControllers.isNotEmpty &&
        TwitchManager.instance.streamers.length ==
            _streamerControllers.length) {
      Navigator.of(context).pushReplacementNamed(MainPage.route);
      return;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              const SizedBox(height: 24),
              Text(
                'Connect the streamers',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 12),
              for (int i = 0; i < _streamerControllers.length; i++)
                _buildStreamerButton(streamerIndex: i),
              const SizedBox(height: 24),
              _buildAddStreamer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddStreamer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Add a streamer',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(width: 12),
        InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () => setState(() => _addStreamerToControllers()),
          child: const Icon(
            Icons.add_circle_outlined,
            color: Colors.green,
            size: 35,
          ),
        ),
      ],
    );
  }

  Widget _buildStreamerButton({required int streamerIndex}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: 350,
          child: TextField(
            decoration: const InputDecoration(labelText: 'Streamer save id'),
            controller: _streamerControllers[streamerIndex],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed:
                    _isStreamerConnected[_streamerControllers[streamerIndex]] ==
                        true
                    ? null
                    : () => _connectStreamer(
                        streamerName: _streamerControllers[streamerIndex].text,
                      ),
                child: Text('Connect streamer ${streamerIndex + 1}'),
              ),
              const SizedBox(width: 4),
              InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () => setState(() {
                  _streamerControllers.removeAt(streamerIndex);
                  _saveStreamers();
                }),
                child: const SizedBox(
                  width: 35,
                  height: 35,
                  child: Icon(Icons.delete, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
