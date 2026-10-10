# PNG to ICO Reference Kit

Reusable reference data and a small Windows PowerShell utility for inspecting ICO files created from browser based image converters.

This kit accompanies [pngtoicotool](https://pngtoicotool.com/), a browser tool that reads one image locally and creates one ICO file with selected size layers. The live tool accepts PNG, JPG, GIF, and WEBP files that the browser can decode. It does not require an account, upload, or conversion history.

## Contents

- `data/ico-size-reference.csv` maps the size layers shown by the tool to practical display contexts.
- `data/supported-inputs.csv` records the input formats shown by the tool.
- `data/png-color-type-comparison.csv` records measured ICO outputs from a dated comparison of four equivalent PNG pixel images stored with different color types.
- `docs/favicon-installation.md` explains how to use the downloaded file as a website favicon.
- `docs/png-color-type-comparison.md` describes the measurement method, sources, and limits of the color type comparison.
- `tools/inspect-ico.ps1` reads an ICO directory and prints its embedded image entries as JSON.

## Inspect an ICO file

Run this on Windows PowerShell:

```powershell
.\tools\inspect-ico.ps1 -Path .\favicon.ico
```

The inspector checks the ICO header and reports each embedded width, height, bit depth, byte size, and data offset. It does not modify the file.

## Source note

The size and input tables reflect the public tool interface and page copy at [pngtoicotool.com](https://pngtoicotool.com/). The comparison data is a dated observation with explicit scope limits. The inspector is an independent local utility for checking the output file structure.
