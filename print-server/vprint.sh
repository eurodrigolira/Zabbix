#!/bin/bash
# 
# Autor		Rodrigo Lira
# E-mail	eurodrigolira@gmail.com
# Site		https://rodrigolira.eti.br
# Versão 1.0	12/08/2019
#
# OBS: É necessário realizar a instalação do lynx para buscar as informações. 
#
# DEFINIÇÃO DE VARIÁVEIS
#
HOST="COLOQUE O ENDEREÇO IP AQUI"
ARQUIVO=/tmp/status-vprinter
RETORNO=0
STATUS=`/usr/bin/lynx -assume_charset=utf-8 -display_charset=utf-8 -dump http://$HOST/status > $ARQUIVO && sed -i 'y/ê/e/' $ARQUIVO`
#
case $1 in
   VersaoServer)
      $STATUS
      cat /tmp/status-vprinter | grep -i --text server | awk '{print $4}' | sed 's/v//'
      RETORNO=$?;;
   VersaoClient)
      $STATUS
      cat /tmp/status-vprinter | grep -i --text client | awk '{print $5}' | sed 's/v//'
      RETORNO=$?;;
   JobsProcDiaAtual)
      $STATUS
      cat /tmp/status-vprinter | grep -i --text "dia" | awk '{print $4}'
      RETORNO=$?;;
   JobsProcDiaAnterior)
      $STATUS
      cat /tmp/status-vprinter | grep -i --text "dia" | awk '{print $6}'
      RETORNO=$?;;
   JobsProcSemanaAtual)
      $STATUS
      cat /tmp/status-vprinter | grep -i --text "sem" | awk '{print $4}'
      RETORNO=$?;;
   JobsProcSemanaAnterior)
      $STATUS
      cat /tmp/status-vprinter | grep -i --text "sem" | awk '{print $6}'
      RETORNO=$?;;
   JobsProcMesAtual)
      $STATUS
      cat /tmp/status-vprinter | grep -i --text "mes" | awk '{print $4}'
      RETORNO=$?;;
   JobsProcMesAnterior)
      $STATUS
      cat /tmp/status-vprinter | grep -i --text "mes" | awk '{print $6}'
      RETORNO=$?;;
   JobsProcAnoAtual)
      $STATUS
      cat /tmp/status-vprinter | grep -i --text "ano" | awk '{print $4}'
      RETORNO=$?;;
   JobsProcAnoAnterior)
      $STATUS
      cat /tmp/status-vprinter | grep -i --text "ano" | awk '{print $6}'
      RETORNO=$?;;
   *)
      echo "ITEM NAO SUPORTADO"
esac

if [ "$RETORNO" != 0 ]; then
       echo "ITEM NAO SUPORTADO"
fi

exit $RETORNO
