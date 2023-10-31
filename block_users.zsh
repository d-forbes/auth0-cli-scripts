#!/bin/zsh

#LOGFILE="./logs/log_$(date +"%Y%m%d%H%M%S").txt"
#user_id="auth0|a53e436e-c833-4302-8938-b713f32c14a2"
LOGFILE="./logs/block_users_log.txt"
INPUTFILE="./input.txt"

echo "Start of log: $(date)" >> $LOGFILE

while IFS=, read -r user_id; do
    echo "Processing user_id: $user_id" >> $LOGFILE
    auth0 api get "users/$user_id">> $LOGFILE 2>&1
    #auth0 block user "{\"user_id\": \"$user_id\"}" >> $LOGFILE 2>&1
    echo "\n" >> $LOGFILE
    echo "-----------------------" >> $LOGFILE
    sleep 2
done < "$INPUTFILE"


echo "End of log: $(date)" >> $LOGFILE