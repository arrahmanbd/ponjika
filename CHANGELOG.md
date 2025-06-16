## 1.1.0

### Fixed
- 🐞 Fixed an issue where Bangla date displayed as `০` on new month start
- ✅ Dates are now correctly 1-based and clamped within valid range

> Note: This version does NOT include timezone-based sunrise adjustment,but prepared. That will be added in a future release.


## v1.0.0

### ✨ Features

📅 Gregorian to Bangla Date Conversion
Accurately converts any Gregorian date into the traditional Bangla calendar format following the Ponjika system.

🌅 Sunrise Adjustment Logic
Supports day-shift logic by subtracting 6 hours to align with the Bengali day starting at sunrise.

🔢 Bangla Digit Formatting
Automatically converts all English numerals in the output to Bangla digits for fully localized display.
