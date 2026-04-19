# Hanken Grotesk

<p align="center">
  <img src="https://custom-icon-badges.demolab.com/badge/-HANKEN%20GROTESK-black?logo=hanken-typeface&logoColor=white&labelColor=2d2d2d" alt="Hanken Grotesk">
  <img src="https://img.shields.io/github/license/marcologous/hanken-grotesk?color=2d2d2d" alt="License">
  <img src="https://img.shields.io/github/v/release/marcologous/hanken-grotesk?color=2d2d2d" alt="Release">
  <img src="https://img.shields.io/github/last-commit/marcologous/hanken-grotesk?color=2d2d2d" alt="Last Commit">
  <img src="https://img.shields.io/github/stars/marcologous/hanken-grotesk?color=2d2d2d" alt="Stars">
  <img src="https://img.shields.io/github/forks/marcologous/hanken-grotesk?color=2d2d2d" alt="Forks">
</p>

<div align="center">

## Technical Typeface Specification

A Neo-Grotesque sans-serif typeface engineered for digital and print applications.

<br>

**[Download Latest Release](https://github.com/marcologous/hanken-grotesk/releases)** · **[View Documentation](documentation/)** · **[Report Issue](https://github.com/marcologous/hanken-grotesk/issues)**

</div>

---

## 1. Typeface Overview

Hanken Grotesk is a Neo-Grotesque sans-serif typeface designed with a focus on geometric precision, optical balance, and modern readability. The design draws inspiration from classic Swiss grotesques while incorporating contemporary refinements optimized for today's digital ecosystem.

### Key Characteristics

| Attribute | Specification |
|-----------|---------------|
| **Designer** | Alfredo Marco Pradil |
| **Foundry** | Hanken Design Co. |
| **Classification** | Neo-Grotesque Sans-Serif |
| **Release Date** | January 2024 |
| **Version** | 2.001 |
| **License** | SIL Open Font License 1.1 |

---

## 2. Font Family

| Style | Weight | Width | Optical Sizing |
|-------|--------|-------|----------------|
| Light | 300 | Normal | Yes |
| Regular | 400 | Normal | Yes |
| Medium | 500 | Normal | Yes |
| SemiBold | 600 | Normal | Yes |
| Bold | 700 | Normal | Yes |
| Black | 900 | Normal | Yes |

### Variable Font

```
fonts/variable/HankenGrotesk-VF.ttf
```

The variable font implements weight axis (`wght`) for granular weight control between 300–900.

---

## 3. Technical Specifications

### Supported Formats

- **OpenType (OTF)** — `fonts/otf/`
- **TrueType (TTF)** — `fonts/ttf/`
- **Variable (TTF/VF)** — `fonts/variable/`
- **Web Open Font Format 2 (WOFF2)** — `fonts/web/`

### Character Set

- **Latin Basic** — U+0020–U+007F
- **Latin Extended-A** — U+0100–U+017F
- **Latin Extended-B** — U+0180–U+024F
- **Greek and Coptic** — U+0370–U+03FF
- **Cyrillic** — U+0400–U+04FF *(pending — see [#2](https://github.com/marcologous/hanken-grotesk/issues/2))*
- **Currency Symbols** — U+20A0–U+20CF
- **Mathematical Operators** — U+2200–U+22FF

### OpenType Features

| Feature | Tag | Description |
|---------|-----|-------------|
| Small Caps | `smcp` | Lowercase as small capitals |
| Case-Sensitive Forms | `case` | Adjusts punctuation for capitals |
| Tabular Figures | `tnum` | Monospaced numerals |
| Lining Figures | `lnum` | Uppercase-height numerals |
| Oldstyle Figures | `onum` | Text-height numerals |
| Fractions | `frac` | Diagonal fractions |
| Ordinals | `ordn` | Ordinal forms (1st, 2nd, 3rd) |
| Superscript | `sups` | Superscript characters |
| Subscript | `subs` | Subscript characters |
| slashed-zero | `zero` | Slashed zero variant |
| kern | `kern` | Kerning pairs |

---

## 4. Build Pipeline

### Prerequisites

- Python 3.8+
- fontmake
- gftools
- fonttools

### Installation

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### Build Commands

```bash
# Build static fonts
cd sources
gftools builder config.yml

# Build variable font
gftools builder config.yml --variable
```

### CI/CD

Automated builds run on every push to `master`. View workflow logs:

```
.github/workflows/build.yml
```

---

## 5. Project Structure

```
hanken-grotesk/
├── .github/
│   └── workflows/
│       └── build.yml
├── documentation/
│   └── SPECimen.md
├── fonts/
│   ├── otf/              # OpenType static
│   ├── ttf/              # TrueType static
│   ├── variable/        # Variable font
│   └── web/             # WOFF2 web fonts
├── images/
├── sources/              # Glyphs source files
├── AUTHORS.txt
├── CONTRIBUTORS.txt
├── OFL.txt
├── README.md
└── requirements.txt
```

---

## 6. Contributing

Contributions are welcome. Please review the [contribution guidelines](CONTRIBUTORS.txt) before submitting enhancements or bug fixes.

### Reporting Issues

For technical issues (missing glyphs, rendering bugs, build failures), please [open an issue](https://github.com/marcologous/hanken-grotesk/issues).

### Font Testing

Test files are available in `fonts/`. For web testing, use the WOFF2 files in `fonts/web/`.

---

## 7. License

Hanken Grotesk is distributed under the **SIL Open Font License 1.1**.

See [OFL.txt](OFL.txt) for full license text.

---

## 8. Version History

| Version | Date | Changes |
|---------|------|---------|
| 2.001 | 2024-01 | Initial release with 6 weights, variable font support |
| 1.x | 2023 | Development phase |

---

<div align="center">

### Related Projects

| Project | Description |
|---------|-------------|
| [hdc-typetester](https://github.com/marcologous/hdc-typetester) | Web-based type tester for Hanken Grotesk |
| [hanken-grotesk-web](https://github.com/marcologous/hanken-grotesk-web) | Webfont package (WOFF2) |
| [fontopia-viewer](https://github.com/marcologous/fontopia-viewer) | Desktop font viewer |

<br>

*Built by [Hanken Design Co.](https://hankendesign.co)* · [Follow on GitHub](https://github.com/marcologous)

</div>