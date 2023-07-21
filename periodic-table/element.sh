#!binbash
PSQL=psql --username=freecodecamp --dbname=periodic_table -t --no-align -c

if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else
  if [[ $1 =~ ^[0-9]+$ ]] ; 
  then
    INPUT_NUMBER=$($PSQL SELECT atomic_number FROM elements WHERE atomic_number = $1;)
    if [[ ! -z $INPUT_NUMBER ]]
    then
      INFO=$($PSQL SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, 
                          boiling_point_celsius, type  FROM elements 
                          INNER JOIN properties USING (atomic_number)
                          INNER JOIN types USING (type_id) 
                          WHERE atomic_number=$INPUT_NUMBER;)
      echo $INFO  while IFS= read NUMBER SYMBOL NAME MASS MELT BOIL TYPE
      do
        echo The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius.
      done
    fi
  else
    INPUT_SYMBOL=$($PSQL SELECT atomic_number FROM elements WHERE symbol='$1';)
    if [[ ! -z $INPUT_SYMBOL ]]
    then
      INFO=$($PSQL SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, 
                        boiling_point_celsius, type  FROM elements 
                        INNER JOIN properties USING (atomic_number)
                        INNER JOIN types USING (type_id) 
                        WHERE atomic_number=$INPUT_SYMBOL;)
      echo $INFO  while IFS= read NUMBER SYMBOL NAME MASS MELT BOIL TYPE
      do
        echo The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius.
      done
    else
      INPUT_NAME=$($PSQL SELECT atomic_number FROM elements WHERE name='$1';)
      if [[ ! -z $INPUT_NAME ]]
      then
        INFO=$($PSQL SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, 
                          boiling_point_celsius, type  FROM elements 
                          INNER JOIN properties USING (atomic_number)
                          INNER JOIN types USING (type_id) 
                          WHERE atomic_number=$INPUT_NAME;)
      echo $INFO  while IFS= read NUMBER SYMBOL NAME MASS MELT BOIL TYPE
      do
        echo The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius.
      done
      
      else
        echo I could not find that element in the database.
      fi
    fi
  fi
fi