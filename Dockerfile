# ── Base Image ─────────────────────────────
FROM python:3.11-slim

# ── Set Working Directory ──────────────────
WORKDIR /app

# ── Copy Requirements First (for caching) ──
COPY requirements.txt .

# ── Install Dependencies ───────────────────
RUN pip install --no-cache-dir -r requirements.txt

# ── Copy App Code ──────────────────────────
COPY app/main.py ./app/

# ── Expose Port ────────────────────────────
EXPOSE 8000

# ── Run App ────────────────────────────────
CMD ["uvicorn", "app.main:app", "--host", "127.0.0.1", "--port", "8000"]