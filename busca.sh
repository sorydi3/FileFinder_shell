 #rmdir ~/resultat && mkdir ~/resultat

while getopts n:i:p:o:d:s: option
do
case "${option}"
in
n) ${OPTARG};;
i) NUMINODE=${OPTARG};;
p) PERMISSOS=${OPTARG};;
o) ORDRE=$OPTARG;;
d) DIRECTORY=${OPTARG};;
s) FITXER=$OPTARG;;
?) WRONG=$OPTARG;;
esac
done
echo "..$NUMINODE..$PERMISSOS..$ORDRE..$DIRECTORY..$FITXER..$WRONG.."
recurse_path () {
    for i in $*; do
       echo  `pwd`
         echo $i | grep  "o"
        if [ -d "${i}" ] 
          then 
            ( cd $i &&   recurse_path  $(ls "."))
         else
             echo $i >>  notDirectorie 
        fi
    done
}

recurse_path $(ls  ".")
echo $var

