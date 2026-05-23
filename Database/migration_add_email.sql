-- Migration: Add email field to players table
-- This migration adds an email column to the players table to support email notifications

ALTER TABLE players ADD COLUMN email VARCHAR(255) UNIQUE AFTER username;

-- Alternative: If you want to add email after password (optional)
-- ALTER TABLE players ADD COLUMN email VARCHAR(255) UNIQUE AFTER password;

-- Note: Run this migration once to update your database
