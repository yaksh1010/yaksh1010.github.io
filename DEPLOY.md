# Going live + running the site

Everything here is static — no server, no database, no monthly bill. Content lives in
`data.js`, you edit it through `admin.html`, and GitHub Pages serves the result.

---

## 1. Put it on the web (one time, ~10 minutes)

You already own `yaksh1010.github.io`, which is a **GitHub Pages user site**. Anything
pushed to that repo appears at `https://yaksh1010.github.io` within about 30 seconds.

### If the repo already exists

```bash
git clone https://github.com/yaksh1010/yaksh1010.github.io.git
cd yaksh1010.github.io
# copy every file from this folder in, then:
git add .
git commit -m "New portfolio"
git push
```

### If it doesn't exist yet

1. On GitHub click **New repository**.
2. Name it **exactly** `yaksh1010.github.io` — the name *is* what makes it a user site.
3. Public, no README.
4. Then:

```bash
cd <this folder>
git init
git add .
git commit -m "New portfolio"
git branch -M main
git remote add origin https://github.com/yaksh1010/yaksh1010.github.io.git
git push -u origin main
```

5. Repo → **Settings → Pages** → Source: **Deploy from a branch**, Branch: **main**, folder **/ (root)**.

Live at **https://yaksh1010.github.io** in under a minute.

### Files that must ship together

```
index.html                     the site
data.js                        all project + experience content
admin.html                     your editing console
me.jpg                         portrait
memoji*.png                    avatars
favicon.ico, favicon-*.png     tab icon
Yakshraj-Dalwadi-Resume.pdf    résumé download
images/                        project screenshots
```

### A custom domain later (optional)

Buy e.g. `yakshraj.dev`, add a file called `CNAME` containing just the domain, point your
registrar's DNS at GitHub, then tick **Enforce HTTPS** in Settings → Pages.

---

## 2. Analytics — how many people visit

GitHub Pages can't count visitors on its own (there's no server), so this uses
**GoatCounter**: free, no cookies, no consent banner, no personal data.

1. Sign up at <https://www.goatcounter.com/signup>, choose a code — say `yaksh1010`.
2. Open `admin.html` → **Analytics** tab → paste the code.
3. In GoatCounter: **Settings → Site settings → tick “Allow adding visitor counts to your website.”**
   Without this, the console can read nothing.
4. Export `data.js`, commit, push.

From then on:

- **Full dashboard** — `https://yaksh1010.goatcounter.com` (referrers, countries, pages, browsers)
- **Quick numbers** — the Analytics tab in `admin.html` shows total / 7-day / 30-day pageviews

Tracking is skipped automatically when you open the file locally, so your own testing
doesn't pollute the numbers.

---

## 3. Adding a new app

1. Open **`admin.html`** in your browser (double-click it).
2. **Projects → + Add project**.
3. Fill in name, tagline, stack.
4. Paste any of the three links you have:
   - **App Store** → renders a blue *View on App Store* button
   - **Play Store** → renders a blue *View on Play Store* button
   - **GitHub** → renders an outlined *View on GitHub* button

   Leave one blank and that button doesn't appear. All three blank shows *Links coming soon*.
5. **Screenshots → + Add screenshot**. Pick your files; the panel tells you the exact
   filename to use, e.g. `images/greengains-1.png`. Save the real files into `images/`
   with those names.
6. **Export data.js**, drop it in the repo replacing the old one.
7. `git add . && git commit -m "add GreenGains" && git push`

**The site does not go offline during any of this.** GitHub serves the previous version
until the new build is ready, then swaps atomically. Worst case a visitor mid-refresh
sees the old page.

Your edits are saved in the browser as you type, so closing the tab won't lose work — but
nothing reaches the live site until you export and push.

---

## 4. How the pieces fit

```
data.js  ──►  index.html   (renders work rail + timeline on page load)
   ▲
   └──────── admin.html    (edits it, exports a new copy)
```

`data.js` is loaded with a plain `<script>` tag rather than `fetch()` on purpose — it means
double-clicking `index.html` works locally, with no server needed.

**Is `admin.html` a security risk in a public repo?** No. It holds no passwords or API
keys, can't write to your site, and only produces a file for you to download. Anyone who
opens it just edits their own throwaway copy in their own browser. If you'd rather keep it
private anyway, delete it before pushing and keep it locally — the site doesn't need it.

---

## 5. Still to do

- Store links for each app (the buttons are ready and waiting)
- Real screenshots to replace the generated mock screens
- Case-study pages, if you want *View in detail* back as a third option
