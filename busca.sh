 #rmdir ~/resultat && mkdir ~/resultat
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

recurse_path () {
   path=`pwd`
            if [ -z  $FITXER ]
        then
            ls -lisa |  grep "$PERMISSOS" |  grep -E ^$NUMINODE  |  grep "$FITXER$" &&  echo"torbat a $path"
        else
             ls -lisa |  grep "$PERMISSOS" |  grep -E ^$NUMINODE  |  grep  "$FITXER$"  &&  echo"torbat a $path"
     fi
    for i in $*; do
        if [ -d "${i}" ] 
          then 
              
             ( cd $i &&   recurse_path  $(ls "."))
        fi
    done
}
if [ ! -z  $DIRECTORY ]
        then
           cd $DIRECTORY 
     fi

recurse_path $(ls  ".")
echo $var

