# Investment Tracker
The investment tracker python program imports, analyzes and visualizes your assets that are maintained in a Google Sheet, and sends a summary to any indicated E-Mail address using a G-Mail account. It shows detailed information of the current value, the change to prior week in %, purchase value, change to purchase value in %, all-time high and the date of the all-time high by single holding as well as for the total.

This works for both, stocks and cryptocurrencies.

I hope this program helps some of you to stay on top of your investments. :)

## Documentation
To execute the program properly, it needs the following set-up and inputs:
### 1. Configuration file
The configuration file passes personal information to the program and has to be saved in the execution folder by the name **'Weekly_Investment_Summary.ini'**!

Please fill your personal information in the template below.
```ini
[Google_Sheet]
API_filename = <File Path to Google API Authorization.json>
gs_url = <URL to Google Sheets File>
worksheet = <Worksheet name containing crypto data>

[Price_Data]
currency = <Currency shortcut (e.g. EUR, USD)>
metric = <Metric the assets will be valued with (High, Low, Open, Close)>

[E_Mail]
send_to = <E-Mail address receiver>
username = <E-Mail address sender>
password = <Password to access Gmail account from sender>
```
### 2. Enable Google API
Create a Google Cloud Platform account and create a project. 
Click on the burger-menu in the top-left corner and navigate to 'APIs & Services' > 'Library', search for and enable 'Google Sheets API'.

[Link](www.google.com)

### 3. Google sheet format & sharing
As mentionted in the introduction, the program is using data from a Google Sheet with above set-up Google API.

This spreadsheet has to be filled in the following format. Note, that the **description** of each column is very important and has to match exactly (the order of the columns doesn't matter)!  The spreadsheet can contain additional columns, just know that they will be ignored.

Also, please use the shortcut for each asset. The program is scraping the data from a Yahoo!-database, so if you're not sure about a shortcut please search for your holding under the following link.
* https://ca.finance.yahoo.com/

| Date       | Asset   | Quantity  |
|------------|---------|-----------|
| 2021-12-24 | BTC     | 0.5       |
| 2022-02-25 | ETH     | 2         |
| 2021-09-21 | ADA     | 100       |
| 2017-03-02 | TSLA    | 5         |
| 2019-05-00 | GOOG    | 1         |
| ...        |         |           |

Furthermore, the Google Sheet has to be shared with the E-Mail address you get from the .json file, the file you got during the set-up of the Google API, under 'Client_email'. Please navigate to your Google Sheet, hit the green 'Share'-button in the top-right corner, copy the E-Mail address from the .json file, select it from the dropdown and hit the blue 'Send'-button in the bottom-right corner of the pop-up.

### 4. G-Mail account configuration
You have to login to the Google account of the sender's E-Mail and go to G-Mail. Navigate to 'Manage your Google Account' by clicking on your profile picture in top-right corner. Then, go to 'Security' in the menue on the left, scroll down and activate 'Less-secure app access'.

You're all set now and can execute the code.

Have fun, cheers!