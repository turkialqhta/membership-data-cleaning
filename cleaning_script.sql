-- ===========================================
-- Data Cleaning Script - Membership Dataset
-- ===========================================

-- 1. Drop the table if it already exists
DROP TABLE IF EXISTS members_clean;

-- 2. Create the clean table
CREATE TABLE members_clean AS
SELECT
    -- Member ID as integer
    CAST("Member ID" AS INTEGER) AS member_id,

    -- Full name (First + Last)
    TRIM(COALESCE("First name",'') || ' ' || COALESCE("Last name",'')) AS full_name,

    -- Full address (merge Address 1–5)
    TRIM(
        COALESCE("Address 1",'') || ' ' ||
        COALESCE("Address 2",'') || ' ' ||
        COALESCE("Address 3",'') || ' ' ||
        COALESCE("Address 4",'') || ' ' ||
        COALESCE("Address 5",'')
    ) AS full_address,

    -- Dues amount (remove $ and commas → convert to integer)
    CAST(REPLACE(REPLACE("Dues amount",'$',''),',','') AS INTEGER) AS dues_clean,

    -- Membership date (kept as cleaned text for now)
    TRIM("Membership valid through") AS membership_date,

    -- Member type (fix wrong values and fill NULL with 'Unknown')
    CASE
        WHEN "Member type" LIKE '{rofessional%' THEN 'Professional Member'
        WHEN "Member type" IS NULL OR TRIM("Member type")='' THEN 'Unknown'
        ELSE "Member type"
    END AS member_type,

    -- Certification (replace blanks with 'None')
    COALESCE(NULLIF(TRIM(Certification),''),'None') AS Certification

FROM "sql";

-- 3. Preview results
SELECT * FROM members_clean LIMIT 10;
