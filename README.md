# 🪔 **Ponjika** – Traditional Bangla Calendar for Dart

### 📦 Package: `ponjika`

### ✨ Tagline (Free Palestine 🇵🇸):
> **Traditional Bangla Calendar, Modern API.**

---



### 📄 Overview
 
**Ponjika** is a lightweight and accurate Dart utility for converting Gregorian (English) dates into the traditional Bangla calendar—known as *Bongabdo*. With its modern, extensible API, Ponjika empowers developers to bring Bengali cultural context to their apps, including dates, months, seasons, and days of the week—formatted exactly the way you want.

Whether you're building a Bangla news app, event tracker, or calendar-based utility, **Ponjika** brings your users one step closer to home.

---

### ✅ Features

- 🔢 Converts English digits to Bangla numerals
- 🗓️ Converts any Gregorian date to traditional Bongabdo format
- 🌸 Includes **season** (`SS`) and **weekday** (`WW`) formatting
- 🎯 Fully customizable output format
- 🧪 Accurate leap year support (Falgun has 31 days in leap years)
- 🌐 Bangla text output with Bengali Unicode support
- 💡 Lightweight and dependency-free

---

### 🚀 Quick Start

#### 🕰️ Basic Usage

```dart
final result = Ponjika.format(date: DateTime(2025, 4, 17));
// Output: ৪ বৈশাখ, ১৪৩২
```

#### 📅 Custom Format

```dart
final custom = Ponjika.format(
  date: DateTime(2025, 4, 17),
  format: "DD MM, YY (WW) - SS",
  showSeason: true,
  showWeekDays: true,
);
// Output: ৪ বৈশাখ, ১৪৩২ (বৃহস্পতিবার) - গ্রীষ্ম
```


#### 🔢 Bangla Number Conversion Only

```dart
final banglaNumber = Ponjika.format(
  date: DateTime(2025, 4, 17),
  format: "YY",
);
// Output: ১৪৩২
```

---

### 🎭 Emojis for Seasons ( 🌤️)

Ponjika comes with a tiny helper to show **seasonal emojis** based on the current date:

```dart
final emoji = Ponjika.getSeasonEmoji(DateTime.now());
// Output: ☀️ (for গ্রীষ্ম)

final emojiWithName = Ponjika.getSeasonEmoji(DateTime.now(), showName: true);
// Output: ☀️ গ্রীষ্ম
```

---

### 📘 Format Tokens Reference

| Token | Description             | Example         |
|-------|-------------------------|-----------------|
| `DD`  | Bangla date             | ৪               |
| `MM`  | Bangla month name       | বৈশাখ          |
| `YY`  | Bangla year (Bongabdo)  | ১৪৩২            |
| `WW`  | Weekday (Bangla)        | বৃহস্পতিবার     |
| `SS`  | Season (Bangla)         | গ্রীষ্ম          |

> ⚠️ You must enable `showSeason` or `showWeekDays` to activate `SS` and `WW`.

---

### 🔍 Use Cases

- Bangla calendar or date picker
- News, event, or reminder apps
- Bengali astrology and cultural planners
- Educational tools for learning the traditional calendar

---

### 📚 License

Licensed under the Apache License 2.0. You are free to use this package in personal and commercial projects with proper attribution.


<svg width="600" height="100" xmlns="http://www.w3.org/2000/svg">
  <rect width="100%" height="100%" fill="#111827" />
  <text x="50%" y="50%" font-family="Arial, sans-serif" font-size="32" fill="#ffffff" dominant-baseline="middle" text-anchor="middle">
    🇵🇸 Free Palestine, Save Gaza 🇵🇸
  </text>
</svg>