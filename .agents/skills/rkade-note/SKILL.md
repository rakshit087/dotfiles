---
name: rkade-note
description: Use when Rakshit asks to write, save, or create a note in his Obsidian vault — especially for the 97-ai folder. Triggers on phrases like "write a note about", "save a note", "note kar", "note bana", or any request to capture ideas/thoughts into the vault.
---

# rkade-note

## Overview

Writes short personal notes in Rakshit's style — Hindi/Hinglish, concise, introspective — and saves them to `/Users/rakshit/Obsidian/rkade/97-ai/`.

## Vault Context

**Working directory:** `/Users/rakshit/Obsidian/rkade/`

**97-ai folder** is for AI-generated notes: captured thoughts, concepts, documentation, quick ideas.

**Rakshit's writing style (from his vault):**
- Hindi or Hinglish — not English blog-post prose
- Short and direct — no unnecessary padding
- Personal, first-person feel — like writing to yourself
- Poetic when talking about life/ideas, structured when technical
- No filler phrases like "it is important to note that..."

## Exact Note Format

Every note MUST follow this structure precisely:

```markdown
---
date: YYYY-MM-DDTHH:MM
tags:
  - <relevant-tag>
  - ai
cssclasses:
  - center-titles
---

# "<Title in Title Case>"

### *Weekday, Month Dth, YYYY*

---

<note content here>
```

**Critical format rules:**
- `date` must include time: `2026-04-21T17:06` (not just `2026-04-21`)
- `tags` must be a YAML block list (one tag per line with `-`), always include `ai`
- `cssclasses` always includes `center-titles`
- Title wrapped in double quotes: `# "Why Chai Tastes Better Cold"`
- Date subtitle uses ordinal: `*Tuesday, April 21st, 2026*`
- Two blank lines between date subtitle and `---` separator
- No `title:` field in frontmatter

## Filename Convention

- Use a descriptive kebab-case name: `why-chai-tastes-better-cold.md`
- For project-specific notes: `knot - topic-here.md` or `projectname - topic.md`
- No numbering unless it's a sequential series

## Writing the Content

**Do:**
- Write in Hindi or Hinglish naturally — whichever fits the topic
- Use `---` dividers between sections
- Keep it under 300 words for "short notes"
- Match the register: poetic for feelings/ideas, structured (headers, bullets) for technical

**Don't:**
- Write English blog-post prose for personal/idea notes
- Use `## Heading` unless the note is technical and needs sections
- Add padding, summaries, or meta-commentary
- Use a `title:` key in frontmatter

## Example Note

**File:** `97-ai/consistency-vs-motivation.md`

```markdown
---
date: 2026-04-21T17:06
tags:
  - thoughts
  - ai
cssclasses:
  - center-titles
---

## Saving the File

Use the Write tool to save directly:
```
/Users/rakshit/Obsidian/rkade/97-ai/<filename>.md
```

After saving, confirm with: `"[filename] 97-ai में save कर दिया।"` — nothing more.

## Common Mistakes

| Mistake | Fix |
|---|---|
| `date: 2026-04-21` | Always include time: `2026-04-21T17:06` |
| `title: "My Note"` | Remove `title:` field entirely |
| `# My Note` | Wrap in quotes: `# "My Note"` |
| English blog-post prose | Write in Hindi/Hinglish |
| Missing `ai` tag | Always add `ai` to tags |
| `cssclasses: center-titles` (inline) | Use block list: `\n  - center-titles` |
