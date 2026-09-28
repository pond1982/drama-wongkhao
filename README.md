# ดราม่าวงข้าว

A tier-list game where people rank 19 Thai Constitutional Court rulings from 2563–2569 (2020–2026) by how much drama each one caused at their family dinner table.

The game shows one ruling at a time. Each card has a short factual summary and a source link, and the player taps one of five drama levels. At the end they get a "what kind of household are you" result, their full tier list, and a picture to share. The picture includes the site's link. Players never type anything.

## Files

- `index.html`: the whole site in one file. Fonts load from Google Fonts.
- `get-art.sh`: optional. Copies the illustrations into `assets/` (see below).

The illustrations and the link-preview picture were made in your Higgsfield account. By default, the page loads them from Higgsfield's image server, so `index.html` works on its own.

## Put it on GitHub Pages

1. Create a public repository named `drama-wongkhao`.
2. Upload `index.html` to the root of the `main` branch.
3. Go to Settings → Pages → Build and deployment. Set Source to "Deploy from a branch", Branch to `main`, and folder to `/ (root)`, then Save.
4. After a minute or two the site is live at https://pond1982.github.io/drama-wongkhao/

**Using a different repo name?** Replace `drama-wongkhao` in `index.html` in three places: the `canonical` link, `og:url`, and `CANONICAL_URL` in the script.

**Link previews:** after publishing, paste the URL into Facebook's Sharing Debugger (https://developers.facebook.com/tools/debug/) once. That makes Facebook pick up the preview picture.

## Hosting the art yourself (recommended before a big launch)

This makes the site keep working even if the Higgsfield links ever change.

1. Run `sh get-art.sh` in the folder. It downloads the art into `assets/` and switches `index.html` to use it.
2. Upload the `assets` folder along with `index.html`.

## Changing rulings or labels

Near the top of the script in `index.html`:

- `RULINGS` holds each card's headline, summary, date, vote, short board label and source link.
- `TIERS` holds the five drama levels.
- `PERSONAS` holds the household results.

Keep each summary factual and give it a source link. The jokes live in the tier labels and household results, which are about the players' own families, not about the court.

## Notes

- Progress and rankings are stored only in the player's own browser (localStorage). Nothing is sent to a server.
- The ruling data is current to 28 Sep 2026 (28 ก.ย. 2569).
- The illustrations are AI-generated fictional characters, and the page says so.
