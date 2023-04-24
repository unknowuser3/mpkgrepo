#!/bin/sh

#--------------------#
# Criado por Mordare #
#--------------------#

printf "Digite o diretorio: "
read diretorio

printf "Digite a extensao, EXEMPLO (*.sh) ou * para todas extensoes: "
read extensao

printf "Deseja adicionar um tempo para exibir cada arquivo? S/N: "
read opcao

if [ "$opcao" = "s" ] || [ "$opcao" = "S" ]; then
   printf "Digite o tempo para exibir cada arquivo: "
   read tempo
   echo "\n"
   find "$diretorio" -name "$extensao" 2>/dev/null | tee -a ENUMFILES_$RANDOM.log | while read linha; do
     echo "\033[0;32m$linha"
     sleep $tempo
     echo "\033[0m"
   done
   if [ -z "$linha" ]; then
     echo "\nNenhum arquivo encontrado, caso tenha especificado uma extensao verifique se colocou o asterisco antes do ponto e a extensao (*$extensao).\n\033[0m"
     exit
   fi
else  
   find "$diretorio" -name "$extensao" 2>/dev/null | tee -a ENUMFILES_$RANDOM.log | while read linha; do
      echo "\033[0;32m$linha"
      echo "\033[0m"
   done

   if [ -z $linha ]; then
      echo "\n\033[0;31mNenhum arquivo encontrado, caso tenha especificado uma extensao verifique se colocou um asterisco antes do ponto e a extensao (*$extensao). \n\033[0m"
   fi
fi
