PRAGMA journal_mode=WAL;
PRAGMA foreign_keys=ON;
CREATE TABLE IF NOT EXISTS storage(key TEXT PRIMARY KEY, value TEXT NOT NULL);
CREATE TABLE IF NOT EXISTS rules(id TEXT PRIMARY KEY, config TEXT NOT NULL, state TEXT NOT NULL CHECK(state IN ('active','paused','triggered','expired')), previous REAL, lastSample TEXT, createdAt TEXT NOT NULL);
CREATE TABLE IF NOT EXISTS events(id TEXT PRIMARY KEY, ruleId TEXT NOT NULL, name TEXT NOT NULL, symbol TEXT NOT NULL, value REAL NOT NULL, at TEXT NOT NULL, UNIQUE(ruleId));
-- SQLite primary/unique indexes cover rule lookups and deduplication.
-- Events intentionally retain the rule snapshot after its deletion.
