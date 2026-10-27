# Windows setup for this fork

This modified version was verified on Windows with Python 3.11, an NVIDIA GeForce RTX 3050 Laptop GPU, and PyTorch 2.5.1 with CUDA 12.1 support. Model inference and webcam capture were checked successfully.

The changes add a separate Windows requirements file and let `run_windows.bat` use a local `.venv` without requiring Conda. The launcher sets its working directory automatically; existing Conda installations remain supported. The original requirements file also allows a newer OpenCV version.

## Install

Install Git, Python 3.11, and an NVIDIA driver compatible with CUDA 12.1. Then run these commands in PowerShell:

```powershell
git clone https://github.com/donnillionaire/avatarify-python.git
cd avatarify-python
py -3.11 -m venv .venv
.\.venv\Scripts\python.exe -m pip install --upgrade pip
.\.venv\Scripts\python.exe -m pip install -r requirements-windows.txt
git clone https://github.com/alievk/first-order-model.git fomm
Invoke-WebRequest -Uri 'https://openavatarify.s3-avatarify.com/weights/vox-adv-cpk.pth.tar' -OutFile 'vox-adv-cpk.pth.tar'
Get-FileHash .\vox-adv-cpk.pth.tar -Algorithm MD5
```

The model file's expected MD5 is `8a45a24037871c045fbb8a6a8aa95ebc`. Leave it in the project folder without unpacking it. The PyTorch download is approximately 2.3 GB; face detection and landmark models download automatically on first launch.

If using `uv` to install the requirements instead of pip, use:

```powershell
uv pip install --python .venv/Scripts/python.exe -r requirements-windows.txt --index-strategy unsafe-best-match
```

This allows version selection from both the PyPI and official PyTorch indexes configured by the requirements file.

## Run

From the project folder in PowerShell:

```powershell
.\run_windows.bat
```

You can also double-click `run_windows.bat` in File Explorer. If several cameras are available, select the camera you want. In the `cam` window, center your face in the rectangle and press **X**. The `avatarify` window then shows the animated avatar.

- **1–8:** Select one of the included avatars.
- **W / S:** Zoom the camera in or out.
- **X:** Recalibrate your face position.
- **I:** Show frame rate.
- **Esc:** Quit.

The `.venv`, downloaded model weights, `fomm` checkout, logs, and local camera selection are excluded from Git. Other machines must complete the installation steps before launching.

Upstream project: [alievk/avatarify-python](https://github.com/alievk/avatarify-python). The original [license](../LICENSE.md) is included unchanged.
