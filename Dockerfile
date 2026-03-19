# ── Base Image ─────────────────────────────
FROM python:3.11-slim

# ── Set Working Directory ──────────────────
WORKDIR /app

# ── Copy Requirements First (for caching) ──
COPY requirements.txt .

# ── Install Dependencies ───────────────────
RUN pip install --no-cache-dir -r requirements.txt

# ── Copy App Code ──────────────────────────
COPY app/ ./app/

# ── Expose Port ────────────────────────────
EXPOSE 8080

# ── Run App ────────────────────────────────
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]