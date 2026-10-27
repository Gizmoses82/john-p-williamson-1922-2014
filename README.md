# John P. Williamson (1922-2014): biography site

A small static website: a sourced biography of John Pritchard Williamson, a Toledo Edison executive, Toledo civic leader and Kent State University alumnus, prepared by the Williamson family. It has no build step and no scripts.

## Contents
- `index.html`: the biography page (inline CSS, schema.org JSON-LD)
- `img/`: the portrait and the John and Helen couple photo
- `downloads/`: the biography as PDF and Word (DOCX), and the one-page fact sheet (PDF)
- `williamson.json`: schema.org Person data (same as the JSON-LD in the page)
- `robots.txt`, `sitemap.xml`, `llms.txt`: crawler and language-model friendly files (all crawlers allowed)
- `set_domain.sh`: swaps the placeholder `https://gizmoses82.github.io/john-p-williamson-1922-2014` for your real address and adds the canonical, `og:url` and `og:image` tags
- `.nojekyll`: tells GitHub Pages to serve the files as they are

## Publish on GitHub Pages
1. Run `./set_domain.sh https://USER.github.io/REPO` once (the address your site will have).
2. Push the folder to the repository root; Settings -> Pages -> Deploy from a branch -> `main` / `(root)`.

## Also archived
Also archived at the Internet Archive: <https://archive.org/details/john-p-williamson-1922-2014-biography>

## License
The text of the biography is licensed under [Creative Commons Attribution 4.0 (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/). Photos are not covered by this license; they belong to their respective owners (see the photo credits on the page). The full-photo version of the page is kept separately; this site carries only the two credited photos.
