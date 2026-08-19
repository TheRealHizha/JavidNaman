# 🥀 Javidnaman - جاویدنامان

<div align="center">
  <h3>🦁☀️ Remembering those who gave everything for the homeland</h3>
  
  [![Flutter](https://img.shields.io/badge/Flutter-3.x-blue.svg)](https://flutter.dev)
  [![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
</div>

---

## 🌟 About

**Javidnaman** (جاویدنامان - "Immortal Names") is a Flutter application dedicated to preserving the memory of those who sacrificed their lives for Iran. It presents an interactive experience combining statistics, a searchable database, Persian poetry, and multi-language support.

---

## 📦 Releases

Download the latest stable builds for your platform:

| Platform | Type | Download |
|----------|------|----------|
| <img src="https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white" alt="Android" width="100"/> | Universal APK (Compressed) | [⬇️ Download](https://github.com/TheRealHizha/JavidNaman/releases/download/v1.0.0/JavidNaman.rar) |
| <img src="https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white" alt="Windows" width="110"/> | Windows Version (Compressed) | [⬇️ Download](https://github.com/TheRealHizha/JavidNaman/releases/download/v1.0.0/javidnaman-windows.rar) |

> ℹ️ **Note:** All releases are signed and verified. Check the [Releases page](https://github.com/H1ZHA/javidnaman/releases) for older versions and changelogs.

---

## ✨ Features

- 🌍 **5 Languages**: Persian, English, Arabic, Kurdish, Azerbaijani
- 🎬 **Cinematic Intro** with synchronized subtitles and music
- 📊 **Statistics Dashboard** showing total, average age, age range, and top cities
- 🔍 **Search & Filter** by name, age group, and city
- 📖 **Poetry Collection** filterable by poet and subject
- 👤 **Detailed Profiles** for each martyr with photo and quotes
- 📱 **Responsive Design** for all screen sizes
- 🎨 **Dark Theme** with elegant gold accents

---

## 🛠️ Tech Stack

- **Flutter** - Cross-platform UI framework
- **Provider** - State management
- **Google Fonts** - Persian typography (Vazirmatn)
- **Infinite Scroll Pagination** - Efficient pagination
- **Cached Network Image** - Image optimization
- **Audio Players** - Background music

---

## 🚀 Installation

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.0+)

### Steps
```bash
# Clone repository
git clone https://github.com/H1ZHA/javidnaman.git
cd javidnaman

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Build for Platforms
```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release

# Web
flutter build web --release
```

---

## 📁 Project Structure

```
lib/
├── main.dart              # Entry point
├── pages/                 # All screens
│   ├── language_selection.dart
│   ├── intro_page.dart
│   ├── statistics_page.dart
│   ├── martyrs_list_page.dart
│   ├── detail_page.dart
│   ├── poems_page.dart
│   └── about_page.dart
├── models/               # Data models
└── utils/               # Helper functions

assets/
├── javidnams_data.json   # Main dataset
├── poems.json            # Poetry collection
└── images/              # Background images
```

---

## 📦 Data Configuration

### `javidnams_data.json`
```json
[
  {
    "name": "Martyr Name",
    "age": "۲۵",
    "place": "City, Province",
    "image": "https://example.com/image.jpg"
  }
]
```

### `poems.json`
```json
{
  "poems": [
    {
      "عنوان": "Poem Title",
      "شاعر": "Poet Name",
      "موضوع": ["Subject"],
      "مصرع_اول": "First hemistich",
      "مصرع_دوم": "Second hemistich"
    }
  ]
}
```

---

## 🌍 Localization

Supported languages with RTL support for Persian, Arabic, and Kurdish:

| Language | Code | Direction |
|----------|------|-----------|
| فارسی | fa | RTL |
| English | en | LTR |
| العربية | ar | RTL |
| کوردی | ckb | RTL |
| Azərbaycan | az | LTR |

---

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/amazing`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing`)
5. Open a Pull Request

---

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**H1ZHA**
- GitHub: [@H1ZHA](https://github.com/TheRealHizha)

---

<div align="center">
  <h4>🇮🇷 "نامشان جاویدان باد" 🥀</h4>
  <p><i>May their names be eternal</i></p>
</div>
