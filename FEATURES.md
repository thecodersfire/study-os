# Built-in features for Study-OS

Purpose: study and research, with office tools, reference management, flashcards, and ebook reading

1. **prepare study and research files** — run study-os-workspace. It creates ~/Documents/study-os-workspace/ with Notes, Sources, Assignments folders.
2. **plan a learning session** — run study-os-plan to open a purpose-specific Markdown plan, saved under ~/Documents/study-os-session-plans/.
3. **check study and source readiness** — run study-os-check for an interactive checklist. Answers are not saved or transmitted.

These local tools create folders, open a local note, or display prompts. They do not install packages, change system settings, or send data.

Install them from this repository:

    mkdir -p "$HOME/.local/bin"
    install -m 0755 features/study-os-workspace features/study-os-plan features/study-os-check "$HOME/.local/bin/"

## Preinstalled purpose software

The installer adds these three Flathub applications for study and research, with office tools, reference management, flashcards, and ebook reading:

1. **VSCodium** — com.vscodium.codium
2. **GNOME Builder** — org.gnome.Builder
3. **GNOME Maps** — org.gnome.Maps

They are installed from Flathub during setup. The repository contains application IDs and documentation, not third-party binaries; each publisher’s terms and licenses apply.
