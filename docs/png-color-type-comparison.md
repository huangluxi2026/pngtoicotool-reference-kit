# PNG color-type comparison

This dataset records one browser conversion run for four 64 × 64 opaque grayscale PNG encodings on pngtoicotool and ConvertICO.com on 2026-09-30 (Asia/Shanghai).

## Files

- [`../data/png-color-type-comparison.csv`](../data/png-color-type-comparison.csv) contains one row per converter and input encoding, including input and output SHA-256 hashes, ICO layer dimensions, output byte counts, decoded alpha counts, and a 64 × 64 source-pixel comparison result.

## Method

The four input PNGs used color types 0 (grayscale), 2 (truecolor RGB), 3 (indexed color), and 6 (truecolor with alpha set to 255). Their decoded 64 × 64 RGBA pixels were identical. Each was converted once in each browser tool. The downloaded ICO files were decoded locally with Pillow 12.3.0; frame dimensions and pixels were compared against the source.

## Observed result

In this run, each tool produced byte-identical ICO output across the four input encodings. Both outputs contained six layers (16, 32, 48, 64, 128, and 256 pixels), and their 64 × 64 decoded pixels matched the source exactly. The site's output files were 14,762 bytes; ConvertICO's were 370,070 bytes. All tested frames had zero fully transparent pixels, zero partial-alpha pixels, and zero non-gray pixels because the fixture artwork was opaque grayscale.

These observations apply only to these files, settings, sites, and run date. They do not establish behavior for transparent or colored artwork, other settings, future tool versions, or all PNG encodings. The input fixture binaries and downloaded ICO files are not included in this repository; hashes in the CSV identify the measured files. The CSV is an observation record, not a general format guarantee.

## Sources

The tested pages were [pngtoicotool](https://pngtoicotool.com/) and [ConvertICO](https://convertico.com/). The reference kit's independent PowerShell script can inspect ICO directory entries locally, but it was not used to decode image pixels for this comparison.
