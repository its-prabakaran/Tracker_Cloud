BORROWER LEDGER PWA v5 CLOUD SYNC

WHAT IT DOES
- Same borrower and transaction data across phones, laptops, and tablets.
- Email/password authentication through Supabase Auth.
- Cloud storage protected by Row Level Security.
- Local-first operation. Changes are marked Pending Sync and uploaded when connectivity returns.
- Sync Now button and visible sync status.
- JSON backup/restore remains available.

SUPABASE SETUP
1. Create a free project at https://supabase.com.
2. Open SQL Editor, paste supabase-setup.sql, and run it.
3. Open Project Settings > API.
4. Copy Project URL and anon/public key into config.js.
5. In Authentication > Providers, enable Email. Decide whether email confirmation should be required.
6. In Authentication > URL Configuration, set Site URL to your GitHub Pages URL, for example https://YOURNAME.github.io/borrower-ledger/.

GITHUB PAGES
1. Upload every file in this package to the repository root.
2. Repository Settings > Pages > Deploy from branch > main / root.
3. Open the HTTPS Pages URL.
4. Create an account or sign in using the same email on each device.

SECURITY
- Never put a Supabase service_role key in config.js or GitHub.
- The anon key is expected in a browser app and is safe only with Row Level Security policies enabled.
- Use a strong password. The local browser copy is not encrypted.

SYNC BEHAVIOR
- A local edit schedules sync after roughly 1.5 seconds when online.
- The app checks periodically and when the device comes online.
- If both local and cloud data changed, manual Sync Now asks whether to upload this device or download the cloud copy.
- This implementation synchronizes the complete ledger as one snapshot. It is appropriate for personal use by one account, not concurrent multi-user editing.
