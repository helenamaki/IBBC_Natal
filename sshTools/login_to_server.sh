SERVER="thor.fc.ul.pt"
USERNAME=""  # Replace with your actual username
PASSWORD=""

# Chmod the thorload file so that it doensn't have to be done later
# add other functions that just make life easier when working with fcul server
chmod +x ~/Desktop/Ferrementas/scripts/serverload.sh 
sshpass -p "$PASSWORD" ssh "$USERNAME@$SERVER"
