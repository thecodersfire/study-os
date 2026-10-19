# Study OS

Study OS is a personal Ubuntu-based desktop focused on study and research, with office tools, reference management, flashcards, and ebook reading. It includes GNOME Software with Flathub, the apps listed in [apps.txt](apps.txt), and an original vector wallpaper created for this project.

## Install guides

- [Single boot](INSTALL_SINGLE_BOOT.md)
- [Dual boot](INSTALL_DUAL_BOOT.md)
- [VMware Workstation Pro](INSTALL_VMWARE.md)
- [GitHub publishing guide](GITHUB_GUIDE.md)
- [Copyright and software notes](COPYRIGHTS.md)

## Build the ISO

This repository contains the source customization, not an ISO. Start with the official Ubuntu 26.04 LTS Desktop ISO and use the Cubic ISO Creator on an Ubuntu 26.04 desktop. Follow the [Cubic installation guide](https://github.com/PJ-Singh-001/Cubic/wiki/Install-Cubic).

In Cubic, copy `study-os-wallpaper.svg` to `/usr/share/backgrounds/study-os-wallpaper.svg`, copy `customize.sh` into the chroot, and run it from Cubic's terminal. If package installation or Flatpak setup fails, stop and resolve the error before building. Alternatively, install stock Ubuntu and run `install.sh` as your normal desktop user.

The installer may retain Ubuntu wording. The installed system's display name changes to Study OS, while its Ubuntu compatibility ID stays `ubuntu` for package updates. Test the ISO in VMware before any physical install.

## Sharing limits

This source repository contains no generated ISO or third-party binaries. Keep generated images for personal testing unless you have completed the package-license and trademark review described in [COPYRIGHTS.md](COPYRIGHTS.md). Use the separate install guides and back up before changing physical disks.
## Purpose-specific built-in tools

See [FEATURES.md](FEATURES.md) for three local tools included for study and research, with office tools, reference management, flashcards, and ebook reading.


Blender is included in every setup, alongside the purpose-specific apps listed in [FEATURES.md](FEATURES.md).
