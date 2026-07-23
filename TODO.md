# TODO — Discoverability & SEO

Track follow-ups for making hastherapturehappened.com easier to find and share.

## Done

- [x] Add `robots.txt` (allow indexing; disallow `/counter` and `/status.json`; link sitemap) — see PR for `cursor/add-robots-txt-48ba` if not yet merged
- [x] Open Graph / Twitter preview image (`og:image`, `twitter:image`) via `/images/og-default.jpg`
- [x] Homepage meta description aligned with the site’s brand/answer
- [x] Homepage RSS feed re-enabled (`index.xml`)

## Next

### Submit the site to Google Search Console (and Bing)

1. Go to [Google Search Console](https://search.google.com/search-console) and add a property for `https://hastherapturehappened.com/`.
2. Verify ownership (DNS TXT record on the domain, or an HTML file upload / meta tag on the site).
3. After verification, open **Sitemaps** and submit: `https://hastherapturehappened.com/sitemap.xml`.
4. Optionally repeat with [Bing Webmaster Tools](https://www.bing.com/webmasters) (can import from Search Console).
5. Check **Pages** / coverage over the next days for indexing errors.

### Remaining site improvements

- [ ] Expose crawlable links to posts on the homepage (not only the JS overlay)
- [ ] Add JSON-LD structured data (`WebSite` on home, `Article` on posts)
- [ ] Add `<link rel="canonical">` on pages
- [ ] Turn About into a real `/about/` page (instead of only `static/about-content.html` fetched into the overlay)
- [ ] Per-post `description` in front matter (instead of relying on auto summaries)
- [ ] Optional: replace `/images/og-default.jpg` with a branded 1200×630 share card (title/answer text on the image)
- [ ] Drop unused `meta keywords` if it ever returns (major engines ignore it)

## Content / growth (ongoing)

- [ ] Publish timely pages when a prediction trends
- [ ] Add one strong evergreen explainer (e.g. history of failed rapture dates)
- [ ] Seek external mentions / backlinks (social, forums, news roundups, TRMNL gallery, etc.)
