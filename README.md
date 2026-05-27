# Multi-Project Video Automation

📹 **Dev-Video-Pipeline**: A headless automation tool built with Playwright to record and synthesize live dynamic content for multiple projects.

---

## 🏗️ Architecture

```
dev-video-automation/
├── scenarios/            # Recording configurations per project
├── projects/             # Target project source codes (manually cloned here)
├── tools/                # Downloaded JDK & Maven binaries
├── videos/               # Output artifacts
```

## ⚠️ Prerequisites

### 1. Setup Java/Maven Tooling
Run this once to download the required JDK and Maven binaries into `tools/`:
```bash
npm run setup-tools
```

### 2. FFmpeg
Required for merging video and audio.
```bash
sudo apt install ffmpeg
```

### 3. NPM Dependencies
```bash
npm install
npx playwright install chromium
```

---

## 🚀 Setup a Project (e.g., Logistics AI Bridge)

1. **Clone the target project** into `projects/`:
   ```bash
   git clone <repo-url> projects/logistics-ai-bridge
   ```
2. **Configure Environment Variables**:
   Copy `.env.example` to `.env` in this directory and fill in your keys. The startup script will automatically copy it to the target project.
3. **Ensure a Scenario exists** in `scenarios/logistics-ai-bridge.js`.

---

## 🎬 Running the Pipeline

### 1. Start the Backend
Start the project's backend using the bundled JDK/Maven:
```bash
npm run start-backend -- logistics-ai-bridge
```

### 2. Build the Video
Execute the full audio generation, recording, and merging sequence:
```bash
npm run build-video -- --scenario logistics-ai-bridge
```

### 3. Stop the Backend
```bash
npm run stop-backend
```

### Or run steps individually:
1. `npm run generate-audio -- --scenario logistics-ai-bridge`: Creates TTS narration clips.
2. `npm run record -- --scenario logistics-ai-bridge`: Records the interaction.
3. `npm run merge -- --scenario logistics-ai-bridge`: Mixes video and audio.
