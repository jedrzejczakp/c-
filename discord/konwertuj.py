#!/usr/bin/env python3
"""Zamienia eksport JSON z DiscordChatExporter na zwarte pliki Markdown.

Użycie: python3 discord/konwertuj.py [katalog_eksportu] [katalog_wyjścia]
Domyślnie czyta discord/export/ i zapisuje do discord/surowe/.
"""
import json
import re
import sys
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parent
SRC = Path(sys.argv[1]) if len(sys.argv) > 1 else ROOT / "export"
DST = Path(sys.argv[2]) if len(sys.argv) > 2 else ROOT / "surowe"

SKIP_TYPES = {"ChannelPinnedMessage", "GuildMemberJoin", "ThreadCreated",
              "RecipientAdd", "RecipientRemove", "ChannelNameChange"}


def slug(text):
    text = re.sub(r"[^\w\-]+", "-", text.strip().lower(), flags=re.UNICODE)
    return text.strip("-") or "bez-nazwy"


def author_name(author):
    return author.get("nickname") or author.get("name") or "?"


def render_message(msg, by_id):
    parts = []
    content = (msg.get("content") or "").strip()
    if content:
        parts.append(content)
    for emb in msg.get("embeds") or []:
        bits = [b for b in (emb.get("title"), emb.get("url"), emb.get("description")) if b]
        if bits:
            parts.append("[embed] " + " | ".join(bits))
    for att in msg.get("attachments") or []:
        parts.append(f"[załącznik] {att.get('fileName', '')} {att.get('url', '')}".strip())
    if not parts:
        return None
    text = "\n".join(parts)
    ref = (msg.get("reference") or {}).get("messageId")
    if ref and ref in by_id:
        quoted = (by_id[ref].get("content") or "").replace("\n", " ")[:80]
        text = f"(odp. do {author_name(by_id[ref]['author'])}: \"{quoted}\")\n{text}"
    reactions = msg.get("reactions") or []
    total = sum(r.get("count", 0) for r in reactions)
    if total >= 3:
        text += f"\n(reakcje: {total})"
    if msg.get("isPinned"):
        text = "[PRZYPIĘTE] " + text
    return text


def convert(path):
    data = json.loads(path.read_text(encoding="utf-8"))
    guild = data.get("guild", {}).get("name", "serwer")
    channel = data.get("channel", {})
    messages = [m for m in data.get("messages", []) if m.get("type") not in SKIP_TYPES]
    by_id = {m["id"]: m for m in messages}

    days = defaultdict(list)
    for msg in messages:
        if msg.get("author", {}).get("isBot"):
            continue
        text = render_message(msg, by_id)
        if text:
            days[msg["timestamp"][:10]].append((msg["timestamp"][11:16], author_name(msg["author"]), text))

    lines = [f"# {guild} / {channel.get('category') or ''} / #{channel.get('name', '?')}", ""]
    if channel.get("topic"):
        lines += [f"Temat kanału: {channel['topic']}", ""]
    lines += [f"Wiadomości: {sum(len(v) for v in days.values())}", ""]
    for day in sorted(days):
        lines += [f"## {day}", ""]
        prev = None
        for time, who, text in days[day]:
            body = text.replace("\n", "\n  ")
            # kolejne wiadomości tej samej osoby łączymy w jeden blok
            lines.append(f"  {body}" if who == prev else f"- **{who}** {time}: {body}")
            prev = who
        lines.append("")

    out = DST / slug(channel.get("category") or "inne") / f"{slug(channel.get('name', path.stem))}.md"
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text("\n".join(lines), encoding="utf-8")
    return out, sum(len(v) for v in days.values())


def main():
    files = sorted(SRC.rglob("*.json"))
    if not files:
        sys.exit(f"Brak plików JSON w {SRC}")
    for f in files:
        out, n = convert(f)
        print(f"{f.name} -> {out.relative_to(DST.parent)} ({n} wiad.)")


if __name__ == "__main__":
    main()
