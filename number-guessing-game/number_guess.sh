#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

PROFILE_ID=$($PSQL "SELECT player_id FROM players WHERE username='$USERNAME';")

if [[ -z $PROFILE_ID ]]
then
  INSERT=$($PSQL "INSERT INTO players(username, games_played, best_game) 
        VALUES ('$USERNAME', 0, 9999);")
  PROFILE_ID=$($PSQL "SELECT player_id FROM players WHERE username='$USERNAME';")
  echo -e "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES=$($PSQL "SELECT games_played FROM players WHERE username='$USERNAME';")
  BEST=$($PSQL "SELECT best_game FROM players WHERE username='$USERNAME';")
  echo -e "Welcome back, $USERNAME! You have played $GAMES games, and your best game took $BEST guesses."
fi

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
echo "Guess the secret number between 1 and 1000:"
read USER_GUESS
GUESS_COUNT=0

until [[ $USER_GUESS == $SECRET_NUMBER ]]
do
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
    then
      echo -e "\nThat is not an integer, guess again:"
      read USER_GUESS
      ((GUESS_COUNT++))
    else
      if [[ $USER_GUESS < $SECRET_NUMBER ]]
        then
          echo "It's higher than that, guess again:"
          read USER_GUESS
          ((GUESS_COUNT++))
        else 
          echo "It's lower than that, guess again:"
          read USER_GUESS
          ((GUESS_COUNT++))
      fi  
  fi

done

((GUESS_COUNT++))

UPDATE_GAMES=$($PSQL "UPDATE players SET games_played = games_played + 1 WHERE player_id = $PROFILE_ID;")

UPDATE_BEST=$($PSQL "UPDATE players SET best_game = $GUESS_COUNT 
          WHERE player_id = $PROFILE_ID AND best_game > $GUESS_COUNT;")

echo -e "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
