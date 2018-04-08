
#seleciona els variables  passat per parametres
while getopts n:i:p:o:d:s: option
do
case "${option}"
in
n)FITXER=${OPTARG};;
i) NUMINODE=${OPTARG};;
p) PERMISSOS=${OPTARG};;
o) ORDRE=$OPTARG;;
d) DIRECTORY=${OPTARG};;
s) GUARDA=$OPTARG;;
?) WRONG=$OPTARG;;
esac
done
#funcio recursiva
recurse_path () {
   path=`pwd`
            if [ -z  $GUARDA ]
        then
            ls -lisa |  grep "$PERMISSOS" |  grep -E ^$NUMINODE  |  grep "$FITXER$" &&  echo "torbat a $path"
        else
             (ls -lisa |  grep "$PERMISSOS" |  grep -E ^$NUMINODE  |  grep  "$FITXER$" >> $GUARDA  &&  echo"torbat a $path")2>>~/errors
     fi
    for i in $*; do
        if [ -d "${i}" ] 
          then 
              
             ( cd $i &&   recurse_path  $(ls "."))
        fi
    done
}
#obre el directory on s executar l'escrip
if [ ! -z  $DIRECTORY ]
        then
           cd $DIRECTORY 
     fi
#crida de la funcio recursica
recurse_path $(ls  ".")
echo $var

