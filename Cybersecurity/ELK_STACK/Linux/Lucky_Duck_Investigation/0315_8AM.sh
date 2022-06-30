#!/bin/bash
grep -o "0315_win_loss_player_data:08:00:00 AM" ../Player_Analysis/Notes_Player_Analysis >> Dealers_working_during_losses
grep "08:00:00 AM" 0315_Dealer_schedule | awk -F" " '{print $1, $2, $5, $6}' >> Dealers_working_during_losses
./0315_2PM.sh
