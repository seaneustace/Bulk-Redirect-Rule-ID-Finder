# Bulk-Redirect-Rule-ID-Finder
Searches Cloudflare's Bulk Redirect List by URL to find the associated Rule ID

# The Problem

For users who manage their Bulk Redirects via the API there is no mechanism to search for URL's. 
Some Lists can be quite long and Cloudflare will paginate their results when listing rules.
Unfortunately, the solution requires looping through the paginated results until the item is found.
After the item is found, the rule ID is returned allowing you to specify wheter you want to remove/edit the existing rule ID.

# Setup

```
url="https://api.cloudflare.com/client/v4/accounts/<account_id>/rules/lists/<list_id>/items?cursor="
email="user@example.com"
key="yourglobablapikeyhere"
```

Update the variables with your account id, list id, email and api key.

# Output

```
root@DESKTOP-HQOGOIQ:/home/seaneustace# chmod +x api.sh
root@DESKTOP-HQOGOIQ:/home/seaneustace# ./api.sh
Sean's Bulk Redirect Item Finder v2.3
Enter a URL to search: support.sean4.xyz/hc/en-us/articles/218505467
Found the item with ID 64e8944b42114807befdaeb85a1f9cf8
```
