# TRMNL Private Plugin / Recipe — Has The Rapture Happened?

## 1. Data source (already on the site after deploy)

Polling URL:

```
https://hastherapturehappened.com/status.json
```

Example payload:

```json
{
  "title": "Has The Rapture Happened?",
  "question": "Has The Rapture Happened?",
  "answer": "NO",
  "happened": false,
  "updated": "2025-01-20",
  "updated_iso": "2025-01-20T21:30:00Z",
  "url": "https://hastherapturehappened.com/",
  "prediction_url": "https://hastherapturehappened.com/current-prediction/"
}
```

To change the answer: edit front matter in `content/current-prediction.md`
(`answer` / `happened` / `date`), commit, and redeploy. Homepage + JSON stay in sync.

## 2. Create the Private Plugin

1. TRMNL → **Plugins** → **Private Plugin**
2. **Strategy:** Polling
3. **Polling URL:** `https://hastherapturehappened.com/status.json`
4. **HTTP method:** GET
5. Force Refresh, then open **Edit Markup**

## 3. Markup (full layout)

Paste into the Markup editor for the full-screen layout:

```html
<div class="layout layout--col">
  <div class="title">Has The Rapture Happened?</div>
  <div class="content content--center" style="flex: 1; display: flex; align-items: center; justify-content: center;">
    <span class="value value--xxlarge" style="font-size: 96px; font-weight: bold;">
      {{ answer }}
    </span>
  </div>
  <div class="label" style="text-align: center;">
    As of {{ updated }}
  </div>
</div>
```

Half vertical:

```html
<div class="layout layout--col">
  <div class="title">Rapture?</div>
  <div class="content content--center" style="flex: 1; display: flex; align-items: center; justify-content: center;">
    <span class="value value--xlarge" style="font-size: 64px; font-weight: bold;">{{ answer }}</span>
  </div>
  <div class="label">{{ updated }}</div>
</div>
```

Quadrant:

```html
<div class="layout layout--col">
  <div class="title">Rapture?</div>
  <div class="content content--center" style="flex: 1; display: flex; align-items: center; justify-content: center;">
    <span class="value value--large" style="font-size: 48px; font-weight: bold;">{{ answer }}</span>
  </div>
</div>
```

## 4. Publish as a Recipe (optional)

Once the private plugin looks good:

1. Note the Plugin ID from the edit URL
2. Email `team@trmnl.com` with the Recipe submission (plugin ID, short install demo video, why it should be public)
3. No OAuth / no extra server needed — Recipe is the right marketplace path for this
