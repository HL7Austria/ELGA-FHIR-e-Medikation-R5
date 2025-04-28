# scripts/generate-comments.py

import json
import base64
import os

# Load all fetched discussions
with open('temp/discussions-all.json', 'r') as f:
    all_discussions = json.load(f)

comments = []

for d in all_discussions:
    if d.get('category', {}).get('name') != 'Comment':
        continue
    try:
        decoded = base64.b64decode(d['title']).decode('utf-8')
        parts = decoded.split('|')
        if len(parts) != 5:
            continue
        comment = {
            "page": parts[0],
            "startXPath": parts[1],
            "startOffset": int(parts[2]),
            "endXPath": parts[3],
            "endOffset": int(parts[4]),
            "url": d['url'],
            "createdAt": d['createdAt'],
            "number": d['number']
        }
        comments.append(comment)
    except Exception as e:
        print(f"Skipping a discussion due to error: {e}")
        continue

# Ensure output directory exists
os.makedirs('comments', exist_ok=True)

# Write comments.json
with open('comments/comments.json', 'w') as f:
    json.dump(comments, f, indent=2)
