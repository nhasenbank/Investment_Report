# Investment Report
The investment report program imports, analyzes and visualizes your assets that are maintained in a Google Sheet, and sends a summary to any E-Mail address using a G-Mail account. It shows detailed information of the current value, development to prior week, development to purchase value, all-time high and the date of the all-time high by single holding as well as for the total depot.

**Note that this currently only works for cryptocurrencies!**

I hope this program helps some of you to stay on top of your investments. :)

## Documentation
To execute the program properly, it needs the following set-up and inputs:
### 1. Enable Google API
If you don't already have one, create a [Google Cloud Platform](https://cloud.google.com/free/?gclid=Cj0KCQjwma6TBhDIARIsAOKuANyzD8wW-asyhsKM-_ZFMa-62VR6jXL44RlDsl70K4fE00owvLxGrXQaAmKLEALw_wcB&gclsrc=aw.ds) account and go to 'Console'.
Click on the burger-menu in the top-left corner and navigate to 'APIs & Services' > 'Library', search for and enable 'Google Sheets API'.

Then, go to to 'APIs & Services' > 'Credentials', click on '+ CREATE CREDENTIALS' and select 'Service Account'. Give it any service account name (something like 'Google_Sheet_API') and hit 'CREATE AND CONTINUE'. Just skip the next two steps as they're optional.

Next, click on the created service account, navigate to 'KEYS' and create a JSON key type.

Finally, save the .json file on your drive.
### 2. G-Mail account set-up
You have to login to the Google account of the sender's E-Mail and go to G-Mail. Navigate to 'Manage your Google Account' by clicking on your profile picture at top-right corner. Then, go to 'Security' in the menue on the left, and activate '2-Step Verification' by following the instuctions.

Next, you have to create an app-password. Go to 'App Password' under 'Signing in to Google',  select 'Other' in the dropdown and enter any name such as 'Python' for instance. Finally, hit 'GENERATE' and save the 16-character app-password without spaces. This is the password you have to put under 'app_password' int the .ini file in the next step.
### 3. Configuration file
The configuration file passes personal information to the program and has to be saved in the execution folder under the name **'Investment_Report.ini'**!

Please fill your personal information in the template below.
```ini
[Google_Sheet]
API_filename = <File Path to Google API Key.json from Step 1>
gs_url = <URL to Google Sheets File>
worksheet = <Worksheet Name>

[Price_Data]
currency = <Currency shortcut (e.g. EUR, USD)>
metric = <Metric the assets will be valued with (High, Low, Open, Close)>

[E_Mail]
send_to = <E-Mail address receiver>
send_from = <E-Mail address sender>
app_password = <App-password from Step 4>
```
### 4. Google sheet format & sharing
As mentionted in the introduction, the program is using data from a Google Sheet with above set-up Google API.

This spreadsheet has to be filled in the following format. Note, that the **description** of each column is very important and has to match exactly (the order of the columns doesn't matter)!  The spreadsheet can contain additional columns, just be aware that they will be ignored.

Also, please use the shortcut for each asset. The program is scraping the data from a Yahoo!-database, so if you're not sure about a shortcut please search for your holding under the following link.
* https://ca.finance.yahoo.com/

| Date       | Asset   | Quantity  |
|------------|---------|-----------|
| 2021-12-24 | BTC     | 0.5       |
| 2022-02-25 | ETH     | 2         |
| 2021-09-21 | ADA     | 100       |
| 2017-03-02 | QNT     | 5         |
| 2019-05-08 | BTC     | 1         |
| ...        |         |           |

Furthermore, the Google Sheet has to be shared with the E-Mail address that is indicated the .json file under 'Client_email' (the file you got during the set-up of the Google API in step 1). Please go to your Google Sheet, hit the green 'Share'-button in the top-right corner, copy & paste the E-Mail address from the .json file, and hit the blue 'Send'-button in the bottom-right corner of the pop-up.

Now you're all set and can execute the code.

Have fun, cheers!

##### Supporting Articles
* [2. G-Mail account set-up](https://towardsdatascience.com/automate-sending-emails-with-gmail-in-python-449cc0c3c317)