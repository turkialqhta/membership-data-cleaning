# Membership Data Cleaning Project

##  Overview
This project demonstrates a complete **Data Cleaning workflow** using SQL (SQLite via DBeaver).  
The dataset represents membership information that initially contained several issues:
- Inconsistent and invalid Member IDs
- Split name and address fields
- Subscription amounts stored as text with `$` symbols
- Membership dates in mixed formats (mm/dd/yyyy, text months, Excel serial numbers)
- Missing or incorrect values in Member Type
- Blank Certification fields

##  Steps Performed
1. **Member ID**  
   Converted to integer values for consistency.

2. **Full Name**  
   Combined first name and last name into one clean field.

3. **Full Address**  
   Merged multiple address columns into a single field.

4. **Dues Amount**  
   Removed `$` symbols and commas, converted to integer.

5. **Membership Date**  
   Cleaned and standardized date values (kept as uniform text or converted to `YYYY-MM-DD` format).

6. **Member Type**  
   Fixed typos (e.g., `{rofessional Member` → `Professional Member`), filled missing with `Unknown`.

7. **Certification**  
   Replaced NULL/blank values with `None`.

##  Results
- Final dataset: `members_clean.csv`
- SQL script: `cleaning_script.sql`
- Clean schema includes:
  - `member_id`
  - `full_name`
  - `full_address`
  - `dues_clean`
  - `membership_date`
  - `member_type`
  - `Certification`

##  Tools Used
- **DBeaver** (SQL client)  
- **SQLite** (database engine)  
- **Excel** (for verification and final adjustments)

##  Next Steps
- Perform membership analysis (active vs expired members)  
- Revenue and dues analysis  
- Build dashboards in Power BI or Tableau  

---

 This project showcases strong SQL data cleaning skills and the ability to transform raw, messy data into a reliable dataset ready for analysis.
