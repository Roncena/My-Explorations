#!/bin/bash
grep -o "0312_win_loss_player_data:05:00:00 AM" ../Player_Analysis/Notes_Player_Analysis >> Dealers_working_during_losses
grep "05:00:00 AM" 0312_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}' >> Dealers_working_during_losses
./0312_8AM.sh
