# Crypto Tracker
Crypto tracker pulls data from GS, pulls historical prices and merges the data to create visualizations and calcualte several measures.

## Docs
To execute the program properly, it needs the following set-ups and inputs.
### Configuration file
Configuration file has to be saved under the execution folder, and has to be named 'Weekly_Crypto_Summary.ini'.
```ini
[Google_Sheet]
API_filename = <File Path to Google API Authorization.json>
gs_url = <URL to Google Sheets File>
worksheet = <Sheet name containing crypto data>

[Historical_Data]
currency = <Currency shortcut (e.g. EUR, USD)>
metric = <Metric the assets will be valued with (e.g. Close, Open, Min, Max)>

[E_Mail]
send_to = <E-Mail address receiver>
username = <E-Mail address sender>
password = <Password to access Gmail account from sender>
```
### Google API

### Google Sheet
Describe format of GS
|   |   |
|---|---|
|   |   |

### G-Mail configuration
Activate less-secure apps for sender account
[Link](www.google.com)