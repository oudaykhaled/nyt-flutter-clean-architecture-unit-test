# 🎯 Prerequisites & Setup

> **Essential requirements and environment setup for Flutter Clean Architecture learning**

---

## 📋 **Required Knowledge**

Before starting this learning journey, ensure you have:

### **Programming Fundamentals**
- [ ] **Basic Dart programming** (variables, functions, classes, async/await)
- [ ] **Object-oriented programming** concepts (inheritance, polymorphism, encapsulation)
- [ ] **Basic understanding of mobile app concepts** (activities, lifecycle, navigation)
- [ ] **REST API fundamentals** (HTTP methods, JSON, API endpoints)

### **Optional but Helpful**
- [ ] Basic understanding of design patterns
- [ ] Experience with any state management solution
- [ ] Familiarity with testing concepts

---

## 💻 **Development Environment Setup**

### **1. Flutter SDK Installation**

#### **macOS:**
```bash
# Using Homebrew (recommended)
brew install --cask flutter

# Or download directly from flutter.dev
# Extract to desired location and add to PATH
export PATH="$PATH:`pwd`/flutter/bin"
```

#### **Windows:**
```bash
# Download Flutter SDK from flutter.dev
# Extract to C:\src\flutter
# Add C:\src\flutter\bin to PATH environment variable
```

#### **Linux:**
```bash
# Download and extract Flutter SDK
sudo snap install flutter --classic
# Or extract tar file and add to PATH
export PATH="$PATH:/path/to/flutter/bin"
```

#### **Verify Installation:**
```bash
flutter --version
flutter doctor
```

### **2. IDE Setup**

#### **Option A: Visual Studio Code (Recommended for beginners)**
```bash
# Install VS Code
# Install Flutter extension
# Install Dart extension
```

**Essential VS Code Extensions:**
- Flutter
- Dart
- Bracket Pair Colorizer
- Material Icon Theme
- Flutter Widget Snippets

#### **Option B: Android Studio**
```bash
# Download Android Studio
# Install Flutter plugin
# Install Dart plugin
```

### **3. Device Setup**

#### **Android Emulator:**
```bash
# In Android Studio:
# Tools > AVD Manager > Create Virtual Device
# Choose Pixel 4 with API level 30+

# Verify emulator is detected
flutter devices
```

#### **iOS Simulator (macOS only):**
```bash
# Install Xcode from App Store
# Open Xcode > Preferences > Components > Install iOS Simulator

# Verify simulator is detected
flutter devices
```

#### **Physical Device:**
```bash
# Android: Enable Developer Options and USB Debugging
# iOS: Trust developer certificate

# Verify device is connected
flutter devices
```

---

## 🔑 **API Key Setup**

### **NY Times API Key**

1. **Register at NY Times Developer Portal:**
   - Go to [https://developer.nytimes.com/signup](https://developer.nytimes.com/signup)
   - Create account and verify email
   - Create a new app
   - Enable "Most Popular API"

2. **Get Your API Key:**
   ```
   Your API Key: [COPY_YOUR_KEY_HERE]
   ```

3. **Test API Key:**
   ```bash
   curl "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json?api-key=YOUR_API_KEY"
   ```

---

## 📦 **Project Setup**

### **1. Clone the Project**
```bash
git clone https://github.com/oudaykhaled/nyt-flutter-clean-architecture-unit-test.git
cd nyt-flutter-clean-architecture-unit-test
```

### **2. Install Dependencies**
```bash
flutter clean
flutter pub get
```

### **3. Generate Code**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### **4. Configure API Key**
Edit `lib/common/constant.dart`:
```dart
const String apiKey = 'YOUR_NY_TIMES_API_KEY_HERE'; // Replace with your actual key
const String baseUrl = 'https://api.nytimes.com/svc/';
const String defaultImage = 'https://cdn.pixabay.com/photo/2019/12/14/07/21/mountain-4694346_960_720.png';
```

### **5. Test the Setup**
```bash
flutter run
```

---

## 🛠️ **Additional Tools**

### **Code Generation Tools**
```bash
# For watching file changes during development
flutter pub run build_runner watch --delete-conflicting-outputs
```

### **Testing Tools**
```bash
# Install LCOV for coverage (macOS/Linux)
# macOS:
brew install lcov

# Linux:
sudo apt-get install lcov

# Windows: Use WSL or skip coverage reports
```

### **Optional Tools**
```bash
# Debugging tool for Android
sudo apt install scrcpy  # Linux
brew install scrcpy      # macOS

# Git hooks for code quality
flutter pub global activate pre_commit
```

---

## ✅ **Verification Checklist**

Run these commands to verify your setup:

### **Environment Check:**
```bash
# Flutter version should be 3.10.0+
flutter --version

# Should show no issues
flutter doctor

# Should list your devices
flutter devices

# Should show available packages
flutter pub deps
```

### **Project Check:**
```bash
# Should build without errors
flutter analyze

# Should generate necessary files
flutter pub run build_runner build

# Should start the app
flutter run
```

### **API Check:**
- [ ] NY Times API key obtained
- [ ] API key added to `lib/common/constant.dart`
- [ ] Test API call successful

---

## 🔧 **Troubleshooting**

### **Common Issues:**

#### **Flutter Doctor Issues:**
```bash
# Android toolchain issues
flutter doctor --android-licenses

# iOS toolchain issues (macOS only)
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
```

#### **Dependency Issues:**
```bash
# Clear pub cache
flutter pub cache clean
flutter pub get

# Clear build cache
flutter clean
flutter pub get
```

#### **Code Generation Issues:**
```bash
# Delete generated files and regenerate
find . -name "*.g.dart" -delete
find . -name "*.freezed.dart" -delete
flutter pub run build_runner build --delete-conflicting-outputs
```

#### **API Issues:**
- Verify API key is correct
- Check internet connection
- Ensure API key has proper permissions
- Test API directly in browser/Postman

---

## 📚 **Next Steps**

Once your environment is set up and verified:

1. ✅ **Read**: [Project Overview](02-project-overview.md)
2. ✅ **Explore**: Navigate through the project structure
3. ✅ **Run**: Test the app on your device/emulator
4. ✅ **Verify**: All features work correctly

---

## 💡 **Pro Tips**

- **Keep Flutter updated**: `flutter upgrade`
- **Use hot reload**: Save time during development
- **Enable verbose logging**: Add `--verbose` flag for debugging
- **Setup IDE shortcuts**: Speed up common tasks
- **Use version control**: Commit frequently

---

**Ready?** Let's move to [Project Overview](02-project-overview.md) to understand what we're building! 🚀 