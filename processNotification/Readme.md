# Process Completion Email Notification Script

This script sends an email notification when a process has completed running, including the content of a specified log file. It's useful for monitoring long-running tasks or processes, and it helps you receive notifications directly to your email, even when you're not actively monitoring the terminal.

---

## Prerequisites

Before using the script, ensure you have the following:

1. **Python 3.x** installed.
2. **Email account** for sending the email (preferably a dedicated one for security and ease of management).

### Install Dependencies

To run the script, you need to install the required Python libraries. These dependencies are:

- `smtplib` (This is part of Python’s standard library, so you don't need to install it separately.)
- `email` (This is also part of Python’s standard library.)
- `sys` (Standard Python library.)

There are no additional external libraries to install, as the script uses built-in libraries only.

---

## Setting Up a Dedicated Email Account

### Why a Separate Email Account?

It's recommended to use a dedicated email account (like a Gmail account) to send notifications. This keeps your personal email secure and avoids potential issues with using a primary account for scripts.

#### Create a New Gmail Account (or use an existing one)

1. Go to [https://accounts.google.com/signup](https://accounts.google.com/signup).
2. Fill in the required information (name, email address, password, etc.).
3. Complete the account verification process.

#### Enable "Less Secure Apps" for the Email Account

To use the script, you need to allow access for less secure apps (specifically to use SMTP to send emails). Follow these steps to enable it:

1. Sign in to your Gmail account.
2. Go to [Less secure apps section](https://myaccount.google.com/lesssecureapps).
3. Turn on access for less secure apps.

> **Note**: Google is phasing out "less secure apps" for Gmail accounts, so consider using an **App Password** for better security.

#### Generate an App Password (Recommended)

If you're using 2-Step Verification for your Gmail account (which is highly recommended for security), you should generate an **App Password** instead of using your main account password.

Follow these steps to create an App Password:

1. Go to your Google Account settings page: [https://myaccount.google.com/](https://myaccount.google.com/).
2. Under **Security**, select **App passwords**.
3. If prompted, sign in to your Google account.
4. In the "Select app" dropdown, choose **Mail**, and in the "Select device" dropdown, choose **Other (Custom name)**.
5. Enter a name (e.g., "Process Notification Script") and click **Generate**.
6. Google will generate a 16-character password. Copy it — you'll use it as the `PASSWORD` in the script.

### Update the Script with Your Email Information

Replace the placeholders in the script with your email details:

```python
EMAIL = "your_email@gmail.com"  # Replace with your email address
PASSWORD = "your_app_password"  # Replace with the generated app password
> **Important**: Do not hard-code your actual password in scripts you share or store publicly. Always use app-specific passwords or environment variables for sensitive information.

---


## How to Use the Script

### Script Usage

To use the script, you need to pass the **process name** and the **log file path** as command-line arguments. Here’s the general syntax:

```bash
python script_name.py [process_name] [log_file_path]

## Example

Assume you have a long-running process called `data_processing`, and you want to send a notification once it’s done, including the log contents. If your log file is located at `/path/to/log.txt`, run the following:

```bash
python process_notification.py data_processing /path/to/log.txt

## Set Up Email Notifications on Your Phone or Computer

### Enable Desktop or Mobile Notifications

To ensure you see notifications when the script completes the process:

#### On Your Phone:
- Make sure you’ve installed the Gmail app or another email client (such as Outlook or Yahoo Mail).
- Turn on push notifications for your email app. You’ll receive an immediate notification once the email is delivered.

#### On Your Computer:
- Make sure you have desktop notifications enabled for your email provider (e.g., Gmail, Outlook).
- On Gmail, go to **Settings** > **General** and enable **Desktop Notifications** for incoming mail.

> **Recommendation**: It's a good idea to enable email notifications specifically for the email account you use only for process notifications. This way, you can easily track process completions without cluttering your personal inbox.

---

## Test the Script

Once you’ve set up the script and email notifications, run the script with a sample log file to ensure the process works smoothly. You should receive an email with the correct content, and depending on your settings, you should get a push notification on your phone or desktop.

---

## Troubleshooting

1. **App Password Issue**: If you’re unable to generate an app password or access "Less Secure Apps," it might be due to your Google account settings. Make sure 2-Step Verification is enabled or that you’ve allowed access for less secure apps.
   
2. **Email Not Sent**: If the email isn’t sent, check the following:
   - Ensure that the SMTP configuration (`smtp.gmail.com`, port `587`) is correct.
   - Double-check that your email address and app password are properly set in the script.

3. **Log File Issues**: If there’s an error reading the log file, make sure the file path is correct and that the script has read permissions for that file.

---
