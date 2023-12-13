import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:flutter_sound_lite/public/flutter_sound_player.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List ringtones = [];
  var player = FlutterSoundPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (ringtones.isNotEmpty) ...[
              Expanded(
                child: ListView.builder(
                  itemCount: ringtones.length,
                  itemBuilder: (context, index) {
                    final ringtone = ringtones[index];
                    return ListTile(
                      onTap: () async {
                        player = (await player.openAudioSession())!;
                        player.startPlayer(
                          fromURI:
                              '/system/media/audio/ringtones/$ringtones.ogg',
                          codec: Codec.opusOGG,
                        );
                      },
                      title: Text(ringtone),
                    );
                  },
                ),
              ),
            ],
            ElevatedButton(
              onPressed: () async {
                ringtones = await getRingtones();
                setState(() {});
                print('ringtones = $ringtones');
              },
              child: Text('Get Ringtones'),
            ),
          ],
        ),
      ),
    );
  }

  Future getRingtones() async {
    const _channel = MethodChannel("flutter_channel");
    try {
      var ringtones = await _channel.invokeMethod('getRingtones');
      // print(ringtones.toString());
      return ringtones;
    } catch (e) {
      print("Error getting ringtones: $e");
    }
  }
}
