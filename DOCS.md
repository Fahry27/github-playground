# 🎮 GitHub Playground — Dokumentasi Lengkap

> Koleksi 27+ tools AI, coding bot, promo scanner & resources developer — semua gratis, penjelasan Bahasa Indonesia.

**Live:** [playground.kairosos.xyz](https://playground.kairosos.xyz) · **Source:** [github.com/Fahry27/github-playground](https://github.com/Fahry27/github-playground)

---

## Daftar Isi

- [Semua Repo & Penjelasan](#-semua-repo--penjelasan)
  - [🤖 Tools AI Coding Gratis](#-tools-ai-coding-gratis-9-repo)
  - [💰 Promo & Diskon AI](#-promo--diskon-ai-3-repo)
  - [🧠 AI Memory & Agent](#-ai-memory--agent-2-repo)
  - [🌐 Otomasi & E-commerce](#-otomasi--e-commerce-2-repo)
  - [💬 Tools CLI AI](#-tools-cli-ai-1-repo)
  - [📱 Messaging & Komunikasi](#-messaging--komunikasi-2-repo)
  - [📚 Belajar AI](#-belajar-ai-3-repo)
  - [💳 Pembayaran & Fintech](#-pembayaran--fintech-1-repo)
  - [🔧 Produktivitas Dev](#-produktivitas-dev-4-repo)
- [Struktur Proyek](#struktur-proyek)
- [Setup & Deploy](#setup--deploy)
- [Maintenance](#maintenance)

---

## 🤖 Tools AI Coding Gratis (9 Repo)

### 1. [ollama](https://github.com/ollama/ollama) ⭐ 176K

**Apa ini?** Jalankan model AI (DeepSeek, Qwen, Gemma, Llama, dll) langsung di laptop lo — 100% gratis, tanpa API key, tanpa batas request.

**Kenapa penting:** Ini fondasi buat AI coding gratis. Lo install ollama, pull model, langsung jalan. Ga perlu bayar API. Cocok dipake sama tools kayak Cursor, Continue, atau coding agent lain.

**Cara pakai:**
```bash
# Install macOS
brew install ollama

# Pull model
ollama pull deepseek-coder-v2
ollama pull qwen2.5-coder

# Jalankan
ollama run deepseek-coder-v2
```

**Stack:** Go · Linux/macOS/Windows

---

### 2. [free-claude-code](https://github.com/Alishahryar1/free-claude-code) ⭐ 40K

**Apa ini?** Pake Claude Code & OpenAI Codex GRATIS — dari terminal, VSCode, atau Discord. Support voice command juga.

**Kenapa penting:** Claude Code biasanya butuh Anthropic API key yang mahal. Ini bypass-nya — lo bisa pake fitur agentic coding (file edit, terminal, multi-file) tanpa bayar.

**Cara pakai:**
```bash
git clone https://github.com/Alishahryar1/free-claude-code
cd free-claude-code
pip install -r requirements.txt
python main.py
```

**Stack:** Python · Terminal/VSCode/Discord

---

### 3. [9router](https://github.com/decolua/9router) ⭐ 22K

**Apa ini?** Router AI coding GRATIS — hubungin Claude Code, Cursor, Codex ke 40+ provider gratis. Auto-fallback kalo satu provider down, hemat token 40%.

**Kenapa penting:** Ini yang dipake di Hermes/Kairos sekarang. Bikin 1 endpoint OpenAI-compatible yang nge-route ke banyak provider. Lo set `base_url` ke 9router, langsung bisa pake model apapun.

**Cara pakai:**
```bash
git clone https://github.com/decolua/9router
cd 9router
npm install
node index.js
# Server jalan di port 20128
```

**Config Hermes:**
```yaml
model:
  base_url: https://router.kairosos.xyz/v1
  provider: custom
```

**Stack:** JavaScript · Node.js

---

### 4. [qwen-code](https://github.com/QwenLM/qwen-code) ⭐ 26K

**Apa ini?** AI coding agent open-source dari Alibaba/Qwen — jalan di terminal, gratis. Alternatif Claude Code tapi pake model Qwen.

**Kenapa penting:** Qwen punya model coding yang sangat kuat (qwen2.5-coder). Ini official coding agent-nya — bisa edit file, run terminal, multi-file refactor.

**Cara pakai:**
```bash
git clone https://github.com/QwenLM/qwen-code
cd qwen-code
pip install -e .
qwen-code
```

**Stack:** Python · Terminal

---

### 5. [plandex](https://github.com/plandex-ai/plandex) ⭐ 16K

**Apa ini?** AI coding agent open-source buat proyek gede — bisa handle banyak file sekaligus, cocok buat refactor besar.

**Kenapa penting:** Kebanyakan AI coding tools bagus buat 1-2 file. Plandex dirancang buat proyek ribuan file — bisa plan perubahan, review, lalu apply sekaligus.

**Cara pakai:**
```bash
curl -sL https://raw.githubusercontent.com/plandex-ai/plandex/main/install.sh | bash
plandex init
plandex tell "refactor auth module"
```

**Stack:** Go · Terminal

---

### 6. [emdash](https://github.com/generalaction/emdash) ⭐ 5.1K

**Apa ini?** IDE agentic open-source (YC W26) — jalanin banyak coding agent paralel dari provider manapun.

**Kenapa penting:** Bisa jalanin Claude Code, Codex, dan agent lain SEKALIGUS dalam tab terpisah. Kayak VSCode tapi optimized buat AI coding.

**Stack:** TypeScript · Electron

---

### 7. [mimoclaude](https://github.com/ahmadghaisanfad2/mimoclaude) ⭐ 1

**Apa ini?** Jalankan Claude Code pake Xiaomi MiMo API — jauh lebih murah dari Anthropic langsung. Install satu command.

**Kenapa penting:** Kalo lo udah punya MiMo API key (yang harganya ~90% lebih murah dari Anthropic), ini cara pake Claude Code tanpa bayar mahal.

**Cara pakai:**
```bash
curl -fsSL https://raw.githubusercontent.com/ahmadghaisanfad2/mimoclaude/main/install.sh | bash
# Pilih Token Plan, masukin API key
mimoclaude
```

**Model mapping:** `mimo-v2.5-pro` (opus), `mimo-v2.5` (sonnet/haiku)

**Stack:** Shell/PowerShell

---

### 8. [pi-commandcode-provider](https://github.com/patlux/pi-commandcode-provider) ⭐ 61

**Apa ini?** Plugin buat Pi coding tool yang hubungin ke Command Code API — 18 model (Claude, GPT, DeepSeek, Qwen, dll).

**Kenapa penting:** Command Code nawarin 4x usage DeepSeek V4 Pro dan 2x Qwen 3.7 Max. Plugin ini bikin Pi bisa akses semua model itu.

**Cara pakai:**
```bash
pi install pi-commandcode-provider
/login  # pilih Command Code
```

**Stack:** TypeScript · Plugin

---

### 9. [OpenMonoAgent.ai](https://github.com/StartupHakk/OpenMonoAgent.ai) ⭐ 1.6K

**Apa ini?** Coding agent GRATIS 100% open-source yang jalan pakai LLM lokal — unlimited token, install satu command.

**Kenapa penting:** Ga butuh API key apapun. Pake model lokal (via ollama) buat coding agentic. Zero cost.

**Stack:** Python · Ollama

---

## 💰 Promo & Diskon AI (3 Repo)

### 1. [gpt-promo-scanner](https://github.com/JUk1-GH/gpt-promo-scanner) ⭐ 680

**Apa ini?** Scanner otomatis promo code ChatGPT Team/Business — scan 17 negara, 34 kode valid, diskon sampai 71%!

**Kenapa penting:** ChatGPT Team biasanya $25/bulan. Dengan promo code, bisa dapet diskon 30-71%. Scanner ini otomatis cari kode yang valid.

**Cara pakai:**
```bash
git clone https://github.com/JUk1-GH/gpt-promo-scanner
cd gpt-promo-scanner
pip install -r requirements.txt

# Ambil accessToken dari chatgpt.com (F12 → Console)
# Paste ke config.toml

python auto_scan.py          # Scan semua negara
python auto_scan.py GB       # Scan UK aja
python discover_codes.py --cross  # Matrix cross-scan
```

**Output:** `stripe_urls.txt` (payment links) + `scan_results.json`

**Requirements:** Clash Verge (proxy), ChatGPT account (gratis)

**Stack:** Python · Clash Proxy

---

### 2. [ai-coding-deals](https://github.com/codertesla/ai-coding-deals) ⭐ 56

**Apa ini?** Panduan hemat AI coding: free tier, diskon, referral credits & alternatif open-source.

**Kenapa penting:** Daftar lengkap semua free tier dan diskon buat tools AI coding (Cursor, Copilot, Claude, dll). Kayak "PriceBook" tapi buat AI tools.

**Stack:** Markdown · Panduan

---

### 3. [free-ai-coding](https://github.com/inmve/free-ai-coding) ⭐ 754

**Apa ini?** Daftar tools AI coding yang ngasih Claude Opus/Sonnet, GPT-5, Gemini Pro GRATAS — dikurasi & terverifikasi.

**Kenapa penting:** Komplementer sama ai-coding-deals — fokus ke "mana yang beneran gratis" buat model premium.

**Stack:** Markdown · Kurasi

---

## 🧠 AI Memory & Agent (2 Repo)

### 1. [ponytail](https://github.com/DietrichGebert/ponytail) ⭐ 81K

**Apa ini?** Bikin AI agent mikir kayak senior dev paling males — kode terbaik adalah kode yang ga pernah ditulis. Anti over-engineering.

**Kenapa penting:** Plugin/skill buat Claude Code & Cursor yang bikin agent:
- Ga over-engineer solusi
- Nolak fitur yang ga perlu (YAGNI)
- Pilih solusi paling minimalis
- Nanya dulu sebelum nambah kompleksitas

**Cara pakai:** Install sebagai skill/rule di Claude Code atau Cursor.

**Stack:** JavaScript · Prompt Engineering

---

### 2. [1Mbrain](https://github.com/mrizkiiy04/1Mbrain) ⭐ 26

**Apa ini?** Memory layer grafik semantik buat AI agent — bikin agent bisa "ingat" percakapan lama secara cerdas.

**Kenapa penting:** Kebanyakan AI agent lupa konteks setelah session habis. Ini bikin persistent memory berbasis graf — agent bisa recall informasi dari percakapan minggu lalu.

**Stack:** TypeScript · Graph Database

---

## 🌐 Otomasi & E-commerce (2 Repo)

### 1. [AionUi](https://github.com/iOfficeAI/AionUi) ⭐ 30K

**Apa ini?** Aplikasi Cowork GRATIS 24/7 buat jalanin banyak AI coding agent sekaligus: Claude Code, Codex, Gemini CLI, dll.

**Kenapa penting:** Bisa monitor & kontrol banyak agent dari 1 UI. Kayak dashboard buat semua coding agent lo.

**Stack:** Multi-platform · Dashboard

---

### 2. [Shopee-flashsale-bot](https://github.com/MRHRTZ/Shopee-flashsale-bot) ⭐ 272

**Apa ini?** Bot auto-checkout Shopee flash sale — countdown realtime, begitu sale buka langsung beli.

**⚠️ Status:** Sudah terdeteksi anti-bot Shopee. Perlu update anti-detection kalo mau dipake.

**Stack:** Python · Selenium

---

## 💬 Tools CLI AI (1 Repo)

### 1. [perplexity-cli](https://github.com/dawid-szewc/perplexity-cli) ⭐ 173

**Apa ini?** Tanya jawab dari terminal pake Perplexity API — lengkap dengan sumber/sitasi.

**Kenapa penting:** Perplexity punya web search built-in yang bagus buat riset factual. Dari terminal, lo bisa dapet jawaban + sumber tanpa buka browser.

**Cara pakai:**
```bash
curl -s https://raw.githubusercontent.com/dawid-szewc/perplexity-cli/main/perplexity.py > ~/.local/bin/perplexity
chmod +x ~/.local/bin/perplexity
export PERPLEXITY_API_KEY="***"

perplexity "Apa itu quantum computing?"
perplexity -uc -m sonar-pro "Explain relativity"  # + usage + citations
```

**Stack:** Python · CLI

---

## 📱 Messaging & Komunikasi (2 Repo)

### 1. [whatsmeow](https://github.com/tulir/whatsmeow) ⭐ 6.7K

**Apa ini?** Library Go buat WhatsApp API (multidevice) — bikin WA bot yang stabil & legit.

**Kenapa penting:** Ini library WA bot paling mature. Dipake banyak project besar (termasuk bridge Matrix-WhatsApp). Support multidevice (ga perlu scan QR terus).

**Stack:** Go · WhatsApp Web API

---

### 2. [9remote](https://github.com/decolua/9remote) ⭐ 398

**Apa ini?** Terminal di kantong lo — kontrol Claude Code, Codex, Gemini CLI dari HP atau browser.

**Kenapa penting:** Lo bisa coding dari HP. Buka browser, langsung akses terminal & coding agent. Cocok buat review PR dari mobile.

**Stack:** Web · Remote Terminal

---

## 📚 Belajar AI (3 Repo)

### 1. [generative-ai-for-beginners](https://github.com/microsoft/generative-ai-for-beginners) ⭐ 113K

**Apa ini?** 21 pelajaran GRATIS dari Microsoft: cara bikin aplikasi pake Generative AI. Dari nol sampai bisa.

**Kenapa penting:** Kurikulum paling populer di GitHub buat belajar Gen AI. Ada Jupyter notebooks yang bisa langsung dijalanin. Support 50+ bahasa termasuk Bahasa Indonesia.

**Materi:**
1. Introduction to Gen AI & LLMs
2. Exploring & comparing different LLMs
3. Using Gen AI responsibly
4. Understanding prompt engineering
5. Creating advanced prompts
6. Building text generation apps
7. Building chat apps
8. Building image generation apps
9. Building search apps (vector databases)
10. Building AI agents
11. Integrating AI into apps
12-21. Advanced topics & projects

**Stack:** Python · Jupyter Notebook

---

### 2. [AI-For-Beginners](https://github.com/microsoft/AI-For-Beginners) ⭐ 52K

**Apa ini?** Kurikulum AI lengkap 12 minggu dari Microsoft: Neural Networks, Computer Vision, NLP, Transformers.

**Kenapa penting:** Lebih deep dari generative-ai-for-beginners. Covers fondasi AI: perceptron, CNN, RNN, GAN, Transformers, BERT, LLM. Ada labs di setiap topik.

**Kurikulum:**
| Minggu | Topik |
|---|---|
| 1 | Intro & Sejarah AI |
| 2 | Symbolic AI (Expert Systems) |
| 3-5 | Neural Networks (PyTorch/TensorFlow) |
| 6-8 | Computer Vision (CNN, GAN, Object Detection) |
| 9-11 | NLP (Word2Vec → Transformers → BERT → LLM) |
| 12 | Genetic Algorithms, Deep RL, Multi-Agent, Ethics |

**Stack:** Python · Jupyter Notebook · PyTorch/TensorFlow

---

### 3. [ai-dev-tools-zoomcamp](https://github.com/DataTalksClub/ai-dev-tools-zoomcamp) ⭐ 1.2K

**Apa ini?** Kursus GRATIS: cara pake AI tools buat nulis kode lebih cepat & bagus. Format cohort (ada jadwal & komunitas).

**Kenapa penting:** Bukan cuma materi — ada komunitas, mentor, dan jadwal. Belajar bareng lebih efektif.

**Stack:** Video · Komunitas

---

## 💳 Pembayaran & Fintech (1 Repo)

### 1. [DynaQRIS](https://dynaqris.pages.dev) (Web)

**Apa ini?** API QRIS Dinamis GRATIS & instan — ubah QRIS statis jadi dinamis via REST API.

**Kenapa penting:** QRIS statis ga bisa set nominal — pembeli harus input manual. Dengan DynaQRIS, generate QR yang udah locked ke nominal tertentu. Cocok buat:
- Bot pembayaran
- E-commerce custom
- Payment gateway sendiri

**Cara pakai:**
```
POST /api/v1/convert

Request:
{
  "qrisId": "uuid-...",
  "amount": 50000
}

Response:
{
  "qrisCode": "000201010...",
  "qrisImage": "data:image/svg+xml..."
}
```

**Flow:** Daftar → Simpan QRIS statis (dapat UUID) → Panggil API dengan nominal → Dapat QR dinamis + SVG

**Stack:** REST API · QRIS · Indonesia

---

## 🔧 Produktivitas Dev (4 Repo)

### 1. [cmux](https://github.com/manaflow-ai/cmux) ⭐ 24K

**Apa ini?** Terminal macOS khusus buat AI coding agent — tab vertikal, notifikasi, multitasking. Kayak iTerm tapi di-desain buat AI.

**Kenapa penting:** Kalo lo jalanin beberapa agent sekaligus (Claude Code + Codex + Gemini), cmux bikin manajemennya gampang — tab terpisah, notifikasi kalo agent selesai.

**Stack:** Rust · macOS

---

### 2. [codeburn](https://github.com/getagentseal/codeburn) ⭐ 8.6K

**Apa ini?** Tracker GRATIS buat pantau berapa token & biaya yang lo habisin di 31 AI tools (Claude Code, Cursor, Codex, dll).

**Kenapa penting:** Biaya AI tools bisa liar kalo ga dipantau. Codeburn kasih dashboard real-time: berapa token terpakai, berapa biaya, per tool.

**Cara pakai:**
```bash
npx codeburn
```

**Stack:** TypeScript · CLI/Dashboard

---

### 3. [claude-devtools](https://github.com/matt1398/claude-devtools) ⭐ 3.7K

**Apa ini?** DevTools buat Claude Code — inspeksi session log, tool calls, token usage, subagent, dan context window dalam UI visual.

**Kenapa penting:** Kalo lo pake Claude Code dan penasaran "kenapa response-nya lambat?" atau "berapa token yang kepake?", ini tools-nya. Kayak Chrome DevTools tapi buat Claude Code.

**Stack:** TypeScript · Visual Inspector

---

### 4. [CodexScope](https://github.com/JUk1-GH/CodexScope) ⭐ 51

**Apa ini?** Alat benchmarking buat OpenAI Codex — test performa & bandingin hasil.

**Kenapa penting:** Sebelum commit ke Codex, lo bisa benchmark dulu: seberapa cepat? seberapa akurat? Worth the cost?

**Stack:** JavaScript · Benchmarking

---

## Struktur Proyek

```
github-playground/
├── index.html              # Halaman utama (dark theme, Tailwind)
├── data/
│   └── repos.json          # Database 27 repo (single source of truth)
├── .github/
│   └── workflows/
│       └── update-stars.yml # Auto-update star counts tiap Minggu
├── CNAME                   # playground.kairosos.xyz
└── README.md               # Deskripsi repo
```

## Setup & Deploy

### Local Development
```bash
git clone https://github.com/Fahry27/github-playground
cd github-playground
python3 -m http.server 8080
# Buka http://localhost:8080
```

### Deploy (sudah dilakukan)
1. Code push ke GitHub → auto-deploy ke GitHub Pages
2. DNS: `playground.kairosos.xyz` → `fahry27.github.io` (Cloudflare proxied)
3. HTTPS: Auto-provisioned oleh GitHub Pages

### Tambah Repo Baru
Edit `data/repos.json`, tambah entry:
```json
{
  "name": "nama-repo",
  "url": "https://github.com/author/repo",
  "author": "author",
  "description": "Penjelasan Bahasa Indonesia",
  "stars": 1234,
  "language": "Python",
  "category": "ai-coding",
  "tags": ["tag1", "tag2"],
  "highlight": false
}
```
Lalu push. Done.

### Kategori yang Tersedia
| Key | Nama |
|---|---|
| `ai-coding` | 🤖 Tools AI Coding Gratis |
| `deals` | 💰 Promo & Diskon AI |
| `agents` | 🧠 AI Memory & Agent |
| `automation` | 🌐 Otomasi & E-commerce |
| `cli-tools` | 💬 Tools CLI AI |
| `messaging` | 📱 Messaging & Komunikasi |
| `learning` | 📚 Belajar AI |
| `fintech` | 💳 Pembayaran & Fintech |
| `devtools` | 🔧 Produktivitas Dev |

## Maintenance

- **Star counts:** Auto-update tiap Minggu via GitHub Actions
- **Tambah repo:** Edit `data/repos.json` + push
- **Tambah kategori:** Edit `data/repos.json` (tambah key di `categories`) + edit `index.html` (tambah warna di `catColor` & `catBadge`)
- **Custom domain:** Sudah setup di `CNAME` + Cloudflare DNS

---

*Terakhir update: 2026-07-13 · Dibuat oleh [Fahry Ramadhan](https://github.com/fahryramadhan)*
