import smtplib
import csv
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
import sys
import os
import subprocess
import pkg_resources

# Function to check and install missing packages
def install_packages():
    required_packages = ['secure-smtplib']  # Add any external libraries here if needed
    installed = {pkg.key for pkg in pkg_resources.working_set}
    missing = [pkg for pkg in required_packages if pkg not in installed]
    if missing:
        print(f"Installing missing packages: {', '.join(missing)}")
        subprocess.check_call([sys.executable, "-m", "pip", "install"] + missing)

# The usage is: python IBBCEmail.py <log_file_path> <email_list_file>
# Email Configuration
SMTP_SERVER = "smtp.gmail.com"
SMTP_PORT = 587
EMAIL = "your_email@gmail.com"  # Replace with your email
PASSWORD = "your_app_password"  # Replace with your app password

def send_process_email(log_content, recipients_file):
    subject = "Processo run_pipeline.sh finalizado"
    
    # Replace newlines in the log content with <br> for line breaks in HTML
    log_content_html = log_content.replace("\n", "<br>")

    body = f"""
    Olá a todos,<br><br>

    O pipeline foi concluído. Eu criei um {create_hyperlink()} com alguns scripts úteis que desenvolvi.<br><br>

    Feliz Natal,<br>
    Helena Maki<br><br>

    ----------------------------<br><br>

    Log do processo:<br>
    {log_content_html}
    """

    # Create the email message
    msg = MIMEMultipart()
    msg["From"] = EMAIL
    msg["Subject"] = subject

    # Attach the HTML body instead of plain text
    msg.attach(MIMEText(body, "html"))

    # Read the CSV file for email addresses and collect them in a list
    recipients = []
    with open(recipients_file, "r") as f:
        csv_reader = csv.reader(f)
        for row in csv_reader:
            # Assuming the email is in the first column of each row
            recipient = row[0].strip()  
            recipients.append(recipient)

    # Join all recipients into a single comma-separated string for the "To" header
    msg["To"] = ", ".join(recipients)

    try:
        # Connect to the SMTP server and send the email
        with smtplib.SMTP(SMTP_SERVER, SMTP_PORT) as server:
            server.starttls()  # Secure the connection
            server.login(EMAIL, PASSWORD)
            
            # Send email to all recipients at once
            server.sendmail(EMAIL, recipients, msg.as_string())
            print(f"Email sent successfully to {', '.join(recipients)}")
    except Exception as e:
        print(f"Failed to send email: {e}")

def create_hyperlink():
    rr = "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
    github_link = "https://github.com/helenamaki/IBBC_Natal"
    
    # The full string to be used
    rr_text = "repositório do Gi"
    repo_text = "tHub"

    # The rr link will cover all except the last 3 characters ("e repository") part
    return f'<a href="{rr}">{rr_text}</a><a href="{github_link}">{repo_text}</a>'

def get_log_content(log_file):
    if os.path.exists(log_file):
        with open(log_file, "r") as file:
            return file.read()
    return "No logs available."

if __name__ == "__main__":
    # Check and install any required packages
    install_packages()

    # Check if both log file and email list path were passed as arguments
    if len(sys.argv) < 3:
        print("Usage: python IBBCEmail.py <log_file_path> <email_list_file>")
        sys.exit(1)

    log_file = sys.argv[1]  # Log file passed as an argument
    email_list_file = sys.argv[2]  # Email list file passed as an argument

    # Get log content
    log_content = get_log_content(log_file)
    
    # Send email with log content and recipients
    send_process_email(log_content, email_list_file)
