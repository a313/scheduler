# Hướng dẫn Setup Firebase AI Chat

## Tổng quan

Tính năng chat AI đã được tích hợp vào ứng dụng sử dụng `firebase_ai` package thay vì `google_generative_ai`. Điều này cung cấp tính bảo mật cao hơn và tích hợp tốt hơn với Firebase ecosystem.

## Các bước setup

### 1. Tạo Firebase Project

1. Truy cập [Firebase Console](https://console.firebase.google.com/)
2. Tạo project mới hoặc sử dụng project có sẵn
3. Nâng cấp lên Blaze plan (pay-as-you-go) - bắt buộc cho Firebase AI

### 2. Kích hoạt Firebase AI Logic

1. Trong Firebase Console, chuyển đến "Build with Gemini" tab
2. Click vào "Vertex AI in Firebase" card
3. Làm theo hướng dẫn để kích hoạt:
   - Kích hoạt Vertex AI API
   - Kích hoạt Compute Engine API (nếu cần)
   - Setup billing

### 3. Chọn Gemini API Provider

Bạn có 2 lựa chọn:

#### Option A: Gemini Developer API (Recommended cho development)
- Không cần billing (Spark plan)
- Dễ setup
- API key được tạo tự động

#### Option B: Vertex AI Gemini API (Recommended cho production)  
- Cần Blaze plan
- Bảo mật cao hơn
- Không cần API key ở client

### 4. Setup Firebase trong Flutter App

App đã được cấu hình sẵn với `firebase_options.dart`. Nếu bạn muốn sử dụng project khác:

```bash
# Cài đặt FlutterFire CLI
dart pub global activate flutterfire_cli

# Setup Firebase cho app
flutterfire configure
```

### 5. Setup App Check (Recommended cho production)

1. Trong Firebase Console, chuyển đến "Build" > "App Check"
2. Đăng ký app của bạn với App Check
3. Chọn provider phù hợp:
   - **Android**: Play Integrity hoặc SafetyNet
   - **iOS**: Device Check hoặc App Attest
   - **Web**: reCAPTCHA

### 6. Test tính năng Chat

1. Build và chạy app:
```bash
flutter pub get
flutter run
```

2. Chuyển đến Gemini page trong app
3. Gửi tin nhắn để test chat functionality

## Cấu trúc Code

### Models
- `ChatMessage`: Sealed class cho các loại tin nhắn (text, data, file, typing)
- `ChatUser`: Model cho user và Gemini bot

### Architecture
- `AiRepo`: Abstract repository cho AI operations
- `AiRepoImpl`: Implementation sử dụng Firebase AI
- `AiUsecases`: Use cases layer cho AI functionality
- `GeminiController`: GetX controller quản lý chat state

### UI Components
- `GeminiPage`: Main chat screen
- `InputComponent`: Input field với attachment support
- `MessagesBuilder`: Hiển thị messages với type-specific widgets
- `TextMessageWidget`: Hiển thị text messages với markdown support

## Features

✅ **Multi-turn chat**: Duy trì context qua nhiều tương tác
✅ **Rich text display**: Support markdown formatting
✅ **File attachments**: Gửi images và files
✅ **Copy/paste support**: Paste text và files từ clipboard
✅ **Typing indicators**: Hiển thị khi AI đang trả lời
✅ **Message actions**: Copy, save, read aloud

## Troubleshooting

### Lỗi "API not enabled"
- Đảm bảo đã enable Vertex AI API trong Google Cloud Console
- Kiểm tra billing đã được setup

### Lỗi authentication  
- Kiểm tra `firebase_options.dart` đã đúng
- Chạy lại `flutterfire configure`

### Lỗi quota exceeded
- Kiểm tra usage trong Firebase Console
- Nâng cấp quota nếu cần

### Lỗi API key (nếu dùng Gemini Developer API)
- API key được tự động tạo, không cần add vào code
- Nếu có lỗi, recreate API key trong Firebase Console

## Model Options

App được configure để sử dụng `gemini-2.0-flash-exp`. Bạn có thể thay đổi model trong `AiRepoImpl`:

```dart
_model = ai.generativeModel(model: 'gemini-2.0-flash'); // Stable version
_model = ai.generativeModel(model: 'gemini-2.0-flash-exp'); // Experimental version  
_model = ai.generativeModel(model: 'gemini-1.5-pro'); // Pro version
```

## Security Notes

- 🔒 Firebase AI đã handle authentication tự động
- 🔒 API key không được expose ở client
- 🔒 App Check cung cấp thêm layer bảo mật
- 🔒 All requests đi qua Firebase infrastructure

## Cost Considerations

- Gemini Developer API: Free tier có sẵn
- Vertex AI: Pay per request/token
- Kiểm tra pricing tại [Firebase Pricing](https://firebase.google.com/pricing)

## Support

Nếu gặp issues, kiểm tra:
1. [Firebase AI Documentation](https://firebase.google.com/docs/vertex-ai)
2. [Flutter Firebase Documentation](https://firebase.flutter.dev/)
3. App logs để debug chi tiết 