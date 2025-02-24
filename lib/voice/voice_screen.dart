import 'package:flutter/material.dart';
import 'voice.dart';

class VoiceScreen extends StatefulWidget {
  const VoiceScreen({super.key});

  @override
  _VoiceScreenState createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
  final VoiceService _voiceService = VoiceService();
  String _recognizedText = "음성을 인식하세요.";
  bool _isAuthenticated = false; // 음성 인증 여부

  @override
  void initState() {
    super.initState();
    _voiceService.init(); // 음성 서비스 초기화
  }

  void _startVoiceRecognition() {
    _voiceService.startListening((text) {
      setState(() {
        _recognizedText = text; // UI 업데이트
      });
    });
  }

  void _startRecording() async {
    await _voiceService.startRecording();
    setState(() {
      _recognizedText = "녹음 중...";
    });
  }

  void _stopRecordingAndAuthenticate() async {
    await _voiceService.stopRecording();
    String? recordedPath = _voiceService.savedVoicePath; // 🔥 수정된 부분 (getter 사용)

    if (recordedPath != null) {
      bool isValidUser = await _voiceService.authenticateUser(recordedPath);
      setState(() {
        _isAuthenticated = isValidUser;
        _recognizedText = isValidUser ? "✅ 인증 성공!" : "❌ 인증 실패!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.mic, size: 80, color: _isAuthenticated ? Colors.green : Colors.blue),
              onPressed: _startVoiceRecognition, // 음성 인식 시작
            ),
            SizedBox(height: 20),
            Text(
              _recognizedText,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: _startRecording,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text("🎙️ 음성 등록", style: TextStyle(fontSize: 18, color: Colors.black)),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _stopRecordingAndAuthenticate,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text("🔑 음성 인증", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
