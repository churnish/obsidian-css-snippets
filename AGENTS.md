# snippets

## File name

ALWAYS use kebab-case. Format: `[addon]-[faulty]-[device]-[target]-[mode]-name`.

- `addon` — plugin or theme name.
- `faulty` — prefix for broken or non-functional snippets.
- `device` — `desktop`, `mobile`, `phone`, or `tablet`.
- `target` — UI area/element (e.g., `editor`, `sidebar`, `status-bar`).
- `mode` — view mode or snippet type (e.g., `helper`, `reading-view`).
- ALL prefixes are optional.
- Target-only and name-only file names are valid.
- Multiple addons are permissible — order them alphabetically.

## Metadata header

- Every `.css` snippet MUST start with a single-line `/* description */` comment summarizing what the snippet does.
- Optionally follow with `/* Source: URL */` on the next line.
- Add one blank line between header comments and CSS.
- Keep the description accurate — when edits change a snippet's scope, update the header to reflect the current behavior.

Example:

```css
/* Hide the bookmark icon in the tab title bar */
/* Source: https://forum.obsidian.md/t/example/12345 */

.view-action[aria-label="Bookmark"] {
```
