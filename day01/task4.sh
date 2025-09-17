#!/usr/bin/env bash
# loveliveandstantripleS

DIRECTORY="${1:-.}"

if [ ! -d "$DIRECTORY" ]; then
    echo "Erreur : Le répertoire $DIRECTORY n'existe pas"
    exit 1
fi

if [ ! -f "$DIRECTORY/mr_clean" ]; then
    echo "Erreur : Le fichier mr_clean n'existe pas dans $DIRECTORY"
    exit 1
fi

if [ ! -x "$DIRECTORY/mr_clean" ]; then
    echo "Test échoué : Le fichier mr_clean n'a pas les droits d'exécution pour le propriétaire"
    exit 1
fi

content=$(cat "$DIRECTORY/mr_clean")
if echo "$content" | grep -E ';|&&|\|\||&|\|' > /dev/null; then
    echo "Test échoué : Le fichier contient des opérateurs interdits (seulement une commande autorisée)"
    exit 1
fi

rm -rf "$DIRECTORY"/test_temp_*

TEST_DIR="$DIRECTORY/test_temp_$$"
mkdir -p "$TEST_DIR"
mkdir -p "$TEST_DIR/subdir"

touch "$TEST_DIR/file.txt"
touch "$TEST_DIR/backup~"
touch "$TEST_DIR/temp~"
touch "$TEST_DIR/#auto#"
touch "$TEST_DIR/#save#"
touch "$TEST_DIR/subdir/doc~"
touch "$TEST_DIR/subdir/#backup#"
touch "$TEST_DIR/normal.c"

cp -r "$TEST_DIR" "$TEST_DIR"_mr_clean
cd "$TEST_DIR"_mr_clean
./../mr_clean > /dev/null 2>&1
result1=$(find . -type f | sort)
cd - > /dev/null

cp -r "$TEST_DIR" "$TEST_DIR"_reference
cd "$TEST_DIR"_reference
find . -type f -name "#*#" -delete -o -name "*~" -delete > /dev/null 2>&1
result2=$(find . -type f | sort)
cd - > /dev/null

rm -rf "$TEST_DIR" "$TEST_DIR"_mr_clean "$TEST_DIR"_reference

if [ "$result1" = "$result2" ]; then
    echo "Test réussi : mr_clean supprime correctement les fichiers"
    exit 0
else
    echo "Test échoué : mr_clean ne produit pas le même résultat que la commande de référence"
    echo ""
    echo "Fichiers restants après mr_clean :"
    echo "$result1"
    echo ""
    echo "Fichiers restants après commande de référence :"
    echo "$result2"
    exit 1
fi