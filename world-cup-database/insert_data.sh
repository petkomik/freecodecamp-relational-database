#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo "$($PSQL "truncate games, teams")"

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    echo $YEAR $WINNER
    WIN="$($PSQL "select * from teams where name = '$WINNER';")"
    echo $WIN
    if [[ -z $WIN ]]
    then
      echo "$($PSQL "insert into teams(name) values('$WINNER');")"
    fi
    OPP="$($PSQL "select * from teams where name = '$OPPONENT';")"
    echo $OPP
    if [[ -z $OPP ]]
    then
      echo "$($PSQL "insert into teams(name) values('$OPPONENT');")"
    fi

    WINID="$($PSQL "select team_id from teams where name = '$WINNER';")"
    OPPID="$($PSQL "select team_id from teams where name = '$OPPONENT';")"

    echo "$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
                              values('$YEAR', '$ROUND', '$WINID', '$OPPID', '$WINNER_GOALS', '$OPPONENT_GOALS');")"
  fi
done