read -p "Your team name:" blueteam
#read -p "Your team password:"
read -p "Team you want to guess:" redteam
read -p "Password you want to guess:" pass
echo
curl -X POST https://faculty.cs.usna.edu/~downs/endpoints/keyexchange/guess.php\
     -H 'Content-Type: application/json'\
     -d '{"team":$blueteam,"target_team":$redteam,"sentence":$pass}'
echo
#TEAM1 TeamG blackjack