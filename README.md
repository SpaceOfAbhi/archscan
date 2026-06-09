# archscan

AI-powered Flutter architecture analyzer for the terminal.

`archscan` analyzes your Flutter project's structure, dependencies, and architecture signals to identify the architecture pattern being used and provide architecture-focused feedback.

---

## ✨ Features

- Detect Flutter architecture patterns
- Identify Feature-First, Clean Architecture, Riverpod, BLoC, MVVM, MVP, Provider, and GetX projects
- Analyze folder structure and dependencies
- Explain architecture detection with evidence
- Highlight architectural strengths and weaknesses
- Identify architecture-specific issues
- Generate actionable recommendations
- Simple terminal-based workflow

---

## 📦 Installation

Activate globally:

```bash
dart pub global activate archscan
```

Verify installation:

```bash
archscan version
```

---

## ⚙️ Setup

Configure your Groq API key:

```bash
archscan key
```

Enter your API key when prompted.

Your API key is stored locally on your machine and is never shared.

---

## 🚀 Usage

Navigate to any Flutter project:

```bash
cd my_flutter_project
```

Run analysis:

```bash
archscan
```

---

## 📖 Commands

| Command | Description |
|----------|-------------|
| `archscan` | Analyze the current Flutter project |
| `archscan key` | Update the stored Groq API key |
| `archscan help` | Display available commands |
| `archscan version` | Display installed version |

---

## 📝 Example Output

```text
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 ARCHITECTURE   Feature-First + Riverpod  [Confidence: High]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

 EVIDENCE
  Signals  : flutter_riverpod package, providers present
  Deps     : flutter_riverpod, dio, go_router
  Folders  : features/ at root
  Files    : home_provider.dart, turf_provider.dart

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

 STRENGTHS
  • Modular feature structure
  • Scalable state management
  • Clear separation of responsibilities

 WEAKNESSES
  • Shared services may grow over time

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

 RECOMMENDATIONS
  • Keep providers feature-scoped
  • Avoid cross-feature dependencies
```

---

## 🏗️ Supported Architectures

- Feature-First
- Clean Architecture
- Riverpod
- BLoC / Cubit
- MVVM
- MVP
- Provider
- GetX
- Hybrid Architectures

---

## 🔍 How It Works

`archscan` analyzes:

- Project dependencies
- Folder structure
- File naming conventions
- Architecture signals

The collected project metadata is sent to a Groq-hosted LLM, which performs architecture classification and generates a detailed architecture review.

---

## 🔒 Privacy

`archscan` focuses on project structure analysis.

The following information may be sent to the AI model:

- Dependency names
- Folder structure
- File names
- Generated architecture signals

Source code contents are **not intentionally analyzed or uploaded**.

---

## 📋 Requirements

- Dart SDK 3.0+
- Flutter project
- Groq API key

---

## 🛣️ Roadmap

### Current

- ✅ Architecture detection
- ✅ AI-powered architecture reviews
- ✅ Riverpod detection
- ✅ Feature-First detection
- ✅ Architecture recommendations

### Planned

- Monorepo support
- Report export
- CI/CD integration
- Additional architecture patterns
- Enhanced architecture signals

---

## 🤝 Contributing

Issues, suggestions, and pull requests are welcome.

If you find incorrect architecture detection, please open an issue with:

- Folder structure
- Dependencies
- Expected architecture
- Actual output

---

## 📄 License

MIT License

---

Built with ❤️ for Flutter developers.