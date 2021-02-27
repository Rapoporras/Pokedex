import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';

var _apikey = "AIzaSyBGogQ0q3QV6fg85_vJfklrmX0AT2zYmrI";
AudioPlayer audioPlayer = AudioPlayer();

const String femalevoice = "cmn-CN-Standard-A";
const String malevoice = "cmn-CN-Standard-B";

Future<http.Response> texttospeech(String text, String voicetype) {
  String url =
      "https://texttospeech.googleapis.com/v1beta1/text:synthesize?key=$_apikey";

  var body = json.encode({
    "audioConfig": {"audioEncoding": "LINEAR16", "pitch": 0, "speakingRate": 1},
    "input": {"text": text},
    "voice": {"languageCode": "es-ES", "name": "es-ES-Wavenet-B"}
  });

  var response =
      http.post(url, headers: {"Content-type": "application/json"}, body: body);

  return response;
}

// Play male voice
playmalevoice(String text) async {
  var response = await texttospeech(text, malevoice);
  var jsonData = jsonDecode(response.body);

  String audioBase64 = jsonData['audioContent'];

  Uint8List bytes = base64Decode(audioBase64);

  String dir = (await getApplicationDocumentsDirectory()).path;
  File file =
      File("$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".mp3");

  await file.writeAsBytes(bytes);

  int result = await audioPlayer.play(file.path);
  audioPlayer.setPlaybackRate(playbackRate: 1);
  audioPlayer.setVolume(1);
  if (result == 1) {
    // success
  }
}

// play female voice
playfemalevoice(String text) async {
  var response = await texttospeech(text, femalevoice);
  var jsonData = jsonDecode(response.body);

  String audioBase64 = jsonData['audioContent'];

  Uint8List bytes = base64Decode(audioBase64);

  String dir = (await getApplicationDocumentsDirectory()).path;
  File file =
      File("$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".mp3");

  await file.writeAsBytes(bytes);

  int result = await audioPlayer.play(file.path);
  audioPlayer.setPlaybackRate(playbackRate: 1);
  audioPlayer.setVolume(1);
  if (result == 1) {
    // success
  }
}
