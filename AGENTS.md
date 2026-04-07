# snippets

- Do NOT update files in `archive/` to follow the rules below.
- Ensure a single blank line at file end.
- Wrap plugin/theme names in "double quotes" EXCEPT built-in Obsidian features (e.g., Bases, Canvas).

## File name

ALWAYS:

- Use kebab-case. 
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

ALWAYS use exact capitalization:

- Live Preview
- Source view
- Reading view
- Quick switcher
- Command palette
- Bases
- Canvas
- Ribbon
- Properties [when referring to YAML frontmatter]

## Comments

- No articles (a/an/the).
- No contractions (e.g., 'do not' NOT 'don't').
- Drop linking verbs (is/are/was) when sentence remains clear without them.

## Metadata header

- Every `.css` snippet MUST start with a single-line `/* <Description> */` comment summarizing what the snippet does.
- Add `"<Add-on Name>":` prefix to description if plugin or theme is targeted. For multiple add-ons, join with ` + ` (e.g., `"Baseline" + "Pane Relief":`).
- Optionally follow with `/* Source: ... */`, separated by a blank line.
- Add one blank line between header comments and CSS.
- **Capitalize after colon**: When a comment starts with a lead-in followed by a colon (e.g., `"Baseline": Do x`), the first word after the colon MUST be capitalized.
- Keep the description accurate and up-to-date — when edits change a snippet's behavior or scope, update the header to reflect it.

Example:

```css
/* Hide the bookmark icon in the tab title bar */
/* Source: https://forum.obsidian.md/t/example/12345 */

.view-action[aria-label="Bookmark"] {
```
