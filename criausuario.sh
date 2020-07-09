#!/bin/bash
###################################
# Este script tem por finalidade, #
# criar um usuario que irá expirar#
# em dois dias                    #
###################################

#Calcula a data de expiração do usuário
date="$(date -d "$date +2 days" +"%Y/%m/%d")"

#Mesma informa acima, só que formatada para o Brasil
dateout="$(date -d "$dateout +2 days" +"%d/%m/%Y")"

#Verica se o usuário já existe
if id "$1" >/dev/null 2>&1; then
        echo "Este usuário já existe!"

#Se não existir, segue com a criação
else
useradd -m $1
yes $2 | passwd $1 > /dev/null 2>&1
chage -E $date $1
echo "O usuário irá expirar em: $dateout"
fi
