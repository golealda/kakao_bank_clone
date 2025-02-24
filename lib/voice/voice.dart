import 'dart:io';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class VoiceService {
  final stt.SpeechToText _speech = stt.SpeechToText();
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  bool _isListening = false;
  bool _isRecording = false;
  String recognizedText = "";
  String? _savedVoicePath; // 녹음된 음성 파일 경로

  // 🔥 [추가] 녹음된 파일 경로를 반환하는 Getter
  String? get savedVoicePath => _savedVoicePath;

  // 음성 인식 및 녹음 초기화
  Future<void> init() async {
    await _speech.initialize();
    await _initRecorder();
  }

  // 녹음기 초기화
  Future<void> _initRecorder() async {
    await Permission.microphone.request();
    await _recorder.openRecorder();
  }

  // 음성 인식 시작
  void startListening(Function(String) onResult) {
    if (!_isListening) {
      _speech.listen(
        onResult: (result) {
          recognizedText = result.recognizedWords;
          onResult(recognizedText); // 콜백 함수로 UI 업데이트
        },
        listenFor: Duration(seconds: 10),
        pauseFor: Duration(seconds: 3),
        partialResults: true,
      );
      _isListening = true;
    }
  }

  // 음성 인식 중지
  void stopListening() {
    _speech.stop();
    _isListening = false;
  }

  // 음성 녹음 시작
  Future<void> startRecording() async {
    if (!_isRecording) {
      Directory appDir = await getApplicationDocumentsDirectory();
      String filePath = "${appDir.path}/user_voice.wav";

      await _recorder.startRecorder(toFile: filePath);
      _isRecording = true;
      _savedVoicePath = filePath; // 🔥 저장된 음성 파일 경로 설정
    }
  }

  // 음성 녹음 중지
  Future<void> stopRecording() async {
    if (_isRecording) {
      await _recorder.stopRecorder();
      _isRecording = false;
    }
  }

  // 사용자의 음성 인증 (녹음된 음성과 비교)
  Future<bool> authenticateUser(String recordedPath) async {
    if (_savedVoicePath == null) {
      return false; // 등록된 음성이 없으면 인증 실패
    }

    File recordedFile = File(recordedPath);
    File savedFile = File(_savedVoicePath!);

    // 단순 비교 (실제 음성 인증 모델이 필요함)
    if (await recordedFile.length() == await savedFile.length()) {
      return true; // 파일 크기가 같다면 같은 음성으로 가정 (실제 비교는 AI 모델 필요)
    }
    return false;
  }
}
