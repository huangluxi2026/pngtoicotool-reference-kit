# Use the downloaded ICO as a website favicon

The `pngtoicotool` favicon page creates an ICO file from a PNG and lets you choose the size layers stored inside it.

## Save the file

Save the downloaded file as `favicon.ico` when your website expects that filename.

## Put it at the site root

Place `favicon.ico` in the same public root directory as the site's main page. The file should then be available at the site's root path:

```text
/favicon.ico
```

## Reference it explicitly

If you want to reference the icon from the page head, use:

```html
<link rel="icon" href="/favicon.ico" sizes="any">
```

The correct file path depends on the way the website is hosted. Check the final URL in a browser after publishing.
