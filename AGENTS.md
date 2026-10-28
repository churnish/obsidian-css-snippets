# snippets

- Do NOT update files in `archive/` to follow the rules below.
- Ensure a single blank line at file end.
- snippets/ is a public git repo: **NEVER put personal information in any file or commit message** — names, email addresses, home-directory paths, vault note titles or content.
- **No history rewrites**: NEVER amend, rebase or otherwise rewrite a commit — fix mistakes with a new commit.
- Obsidian applies CSS snippet edits instantly on file save — no reload required.

## CSS

- **CSS limits**: When a snippet needs state CSS cannot select on, propose a Templater startup script in `Utility/Templates/` and register it in Templater `startup_templates`. ALWAYS read existing `startup-*.md` scripts first for house conventions. Add JS ONLY for parts CSS cannot express. NEVER port working CSS to JS.
- **Avoid `:has()`**: Use ONLY when no `:has()`-free CSS renders the same, and ONLY after an A/B on Android shows no performance dip — desktop hides the cost.
	- **A/B**: In one run, swap the snippet's `<style>` text between versions and time re-appending the elements it targets plus a forced style recalc. Compare only within one run; absolute times drift between runs.
	- **Hot shape**: A catch-all child behind a `:has()` ancestor (`> *`, `> :not(…)`) cost about 10 ms per Quick switcher redraw on Android, against 0.2 ms with the children named. Name the children first.
	- **Attribute tests**: NEVER test `style` or `class` substrings inside `:has()`. Measured cost on desktop: 13 ms per inline-style write and 16 ms per class change anywhere.
	- **On a dip no rewrite removes**: Propose a Templater startup script that stamps a class CSS can select on (see **CSS limits**). This is the ONLY case where CSS may move to JS.
- **Avoid `!important`**: Override by raising selector specificity or by setting the CSS variable the target rule reads. Use `!important` ONLY against inline styles or another `!important` declaration.

## Device gates

- **Gates**: Use these `@media` queries verbatim, each with a one-line `/* <Name> gate: See AGENTS.md Device gates */` comment directly above it. Obsidian sets `is-tablet` from `matchMedia("(min-width: 600px) and (min-height: 600px)")` (window size) and freezes it while the soft keyboard is visible.
	- **Phone**: `(any-pointer: coarse) and (not ((min-width: 600px) and (min-height: 600px)))`. The exact complement of Obsidian's window-size test, so a narrow iPad Split View, which Obsidian classes as a phone, matches. A phone's window never reaches 600 px on both sides, so no screen-size clause is needed.
	- **Tablet**: `(any-pointer: coarse) and (min-device-width: 600px) and (min-device-height: 600px)`. Uses screen size, so it stays on while the keyboard shrinks the window.
	- **Mobile**: `(any-pointer: coarse)`.
	- **Desktop**: `(pointer: fine)`. Uses the primary pointer, so touchscreen laptops keep their desktop snippets.
- **Wrap**: Wrap every rule whose selector tests `.is-phone`, `.is-tablet`, `.is-mobile` or `:not(.is-mobile)` in its gate, keeping the inner body class for Obsidian's exact test. A non-matching `@media` drops its rules from the style engine; a body-class prefix alone still costs every style change.
- **File names**: A file named with a device token gets that gate on all its rules.
- **Combined gates**: For rules that target two device classes, join both gates with a comma in one `@media`, name both in its comment (`/* Desktop and Tablet gates: … */`), and leave the device token out of the file name.
- **Hover**: Hide-until-hover rules take the Desktop gate, or the Desktop and Tablet gates when a tap should reveal them on iPad: Obsidian's iPad app applies `:hover` on tap. Safari in the iOS Simulator does not, so confirm a tap reveal on the device. On phones hover only supplements touch, so revealed content stays visible there.
- **Desktop testing**: Desktop checks of phone rules need CDP touch emulation (`emulate` viewport `…,mobile,touch`), because `app.emulateMobile` alone leaves the pointer fine.
- **Known gap**: On an iPad, widening a narrow Split View past 600 px while the keyboard is up drops phone rules until Obsidian next re-checks its phone class.

## File name

ALWAYS:

- Use kebab-case (all lowercase).
- Use format: `[add-on]-[faulty]-[device]-[target]-[mode]-name`.
	- `add-on` — plugin or theme name.
	- `faulty` — prefix for broken or non-functional snippets.
	- `device` — `desktop`, `mobile`, `phone`, or `tablet`.
	- `target` — UI area/element (e.g., `editor`, `sidebar`, `status-bar`).
	- `mode` — view mode or snippet type (e.g., `helper`, `reading-view`).
- ALL prefixes are optional.
- Target-only and name-only file names are valid.
- Multiple addons are permissible — order them alphabetically.

## Obsidian feature names

In comments (but not file names), ALWAYS use this exact capitalization:

- Live Preview
- Source view
- Reading view
- Quick switcher
- Command palette
- Bases
- Canvas
- Ribbon
- Properties [when referring to YAML frontmatter block at top of notes]

NEVER wrap these feature names in 'quotes'.

## Comments

- No articles (a/an/the).
- No contractions (e.g., 'do not' NOT 'don't').
- Drop linking verbs (is/are/was) when sentence remains clear without them.
- Place rule-specific comment directly above its rule. NEVER leave blank line between comment and its rule.
- Place file-level notes — scope, rationale, deliberate omissions — with header comments, NEVER at file end.

## Metadata header

- Every CSS snippet MUST start with a single-line `/* <Description> */` comment summarizing what the snippet does.
- Add `<Add-on Name>:` prefix to description if plugin or theme is targeted. For multiple add-ons, join with ` + ` (e.g., `Baseline + Pane Relief:`).
- Optionally follow with `/* Source: https://github.com/churnish/obsidian-css-snippets */`, separated by a blank line. `Source:` MUST link **ONLY to this repo**.
- **Upstream credit**: For snippets derived from upstream code, ALWAYS add the `Source:` line, then one `/* Extracted from <Project>: <URL> | <License notice> */` line per upstream, each separated by a blank line. Append ` | <License notice>` ONLY when upstream ships a license, copied from its LICENSE (e.g., `| MIT License, Copyright (c) 2020-2024 Steph Ango (@kepano)`). Credit a color palette as `/* Palette: <URL> */` directly below its `Extracted from` line.
- Add one blank line between header comments and CSS.
- When a comment starts with a lead-in followed by a colon (e.g., `Baseline: Set x to y`), the first word after the colon MUST be capitalized.
- Keep descriptions accurate and up-to-date — when edits change a snippet's behavior or scope, update the header to reflect it (without superfluous details).

## Snippet example

```css
/* Hide bookmark icon in tab title bar */

/* Source: https://github.com/churnish/obsidian-css-snippets */

.view-header .clickable-icon.view-action.mod-bookmark {
    display: none;
}
```
