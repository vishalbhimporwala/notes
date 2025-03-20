# 📝 Notes App - Flutter

## 📌 Overview
The **Notes App** is a Flutter application that connects to a Node.js backend, allowing users to **register, log in, and manage notes** efficiently. It uses **Dio & Retrofit** for API requests and **Provider** for state management.

---

## 🛠️ Installation & Setup
### 1️⃣ Prerequisites
- Install **Flutter**: [Flutter Install Guide](https://docs.flutter.dev/get-started/install)
- Install **Android Studio**
- Install **Dart & Flutter Plugins** in Android Studio

### 2️⃣ Clone the Repository
```sh
git clone https://github.com/vishalbhimporwala/Flutter-Notes-App.git
cd Flutter-Notes-App
```

### 3️⃣ Install Dependencies
```sh
flutter pub get
```

### 4️⃣ Configure API Base URL
Update `baseUrl` in `api_service.dart`:
```dart
@RestApi(baseUrl: "http://YOUR_BACKEND_IP:3025/api/v1/")
abstract class ApiServices {
```

### 5️⃣ Generate API Service Files
If you encounter an error like `api_service.g.dart` missing, run the following command:
```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

### 6️⃣ Run the App
```sh
flutter run
```

---

## 📡 API Endpoints
### 🔑 Authentication
- **Register:** `POST /user/register`
- **Login:** `POST /user/login`

### 📝 Notes Management
- **Create Note:** `POST /note/create`
- **Update Note:** `POST /note/update`
- **Fetch Notes:** `GET /note/fetch`
- **Delete Note:** `DELETE /note/delete/{noteId}`

---

## 📜 License
This project is **open-source** and free to use.

---

## ✨ Author
**Vishal Bhimporwala**  
🚀 GitHub: [@vishalbhimporwala](https://github.com/vishalbhimporwala)