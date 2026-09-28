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

## Google Analytics

The page uses GA4 property `G-HVSY0T7752` (`GA_ID` near the top of the script; set it to `''` to turn analytics off).

- GA loads only after the player taps "ตกลง" in the cookie box, which appears under the start button (and on the result screen) until they choose. "ไม่เป็นไร" means GA never loads. The two buttons look the same on purpose. The choice is saved in the player's browser, and they can change it any time with the "ตั้งค่าคุกกี้" link at the bottom of the first screen and the result screen. Turning it off also deletes the `_ga` cookies.
- Google signals and ad personalization are off, and ad storage is denied.
- GA doesn't run when the page is opened as a local file. It does run on `localhost`, so local testing counts as real visits unless you filter it out.

Events sent (after consent only):

| Event | When | Parameters |
|---|---|---|
| `page_view` | GA loads | (automatic) |
| `game_start` | Start button, or restart | `start_type`: `new`, `resume`, `restart` |
| `rank_ruling` | Each tier tap | `ruling_id`, `drama_level` (4 = ทะเลาะ … 0 = เงียบ), `tier_name`, `step` (1–19) |
| `undo_rank` | Undo | `ruling_id`, `drama_level` (the level that was undone) |
| `move_ruling` | Moving a ruling to another tier on the board | `ruling_id`, `from_level`, `drama_level` (new level) |
| `game_complete` | Last ruling placed | `persona` |
| `share` | Native share, image download, Facebook/LINE/X link, copy link | `method`, `content_type` (`image` or `link`) |

GA's enhanced measurement also records clicks on the source links as outbound `click` events.

To use the custom parameters in GA reports, register them once in GA → Admin → Custom definitions → Create custom dimension (scope: Event): `ruling_id`, `drama_level`, `tier_name`, `step`, `from_level`, `start_type`, `persona`. `method` and `content_type` are standard for `share`. To see which rulings players rank as most dramatic, go to Explore, use `rank_ruling` events, and break them down by `ruling_id` and `drama_level`.

## Notes

- Progress and rankings are stored in the player's own browser (localStorage). If the player agrees to cookies, the events above are also sent to Google Analytics. Names and contact details are never collected.
- The ruling data is current to 28 Sep 2026 (28 ก.ย. 2569).
- The illustrations are AI-generated fictional characters, and the page says so.
