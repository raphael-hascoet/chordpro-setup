option=$1
filepath="${@: -1}"

if [ -z $option ]; then
    nodemon -L --watch "./src/" -e cho --exec "bash ./watch-cho.sh --all-once"
elif [ $option = "--one" ]; then
    filename=$(basename "$filepath" .cho)

    mkdir -p results

    nodemon -L "$filepath" --exec "chordpro.exe -o results/'$filename'.pdf --config=modern3"

elif [ $option = "--all-once" ]; then
    for file in ./src/*.cho; do
        echo "$file"
        filename=$(basename "$file" .cho)

        chordpro.exe -o "./results/$filename.pdf" --config=modern3 "$file"
    done
fi
