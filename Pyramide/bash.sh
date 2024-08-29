#!/bin/bash

# Höhe der Pyramide
height=5

# Pyramide zeichnen
for (( i=1; i<=height; i++ ))
do
  # Leerzeichen drucken
  for (( j=i; j<height; j++ ))
  do
    echo -n " "
  done
  
  # Sterne drucken
  for (( k=1; k<=(2*i-1); k++ ))
  do
    echo -n "*"
  done
  
  # Neue Zeile
  echo ""
done
