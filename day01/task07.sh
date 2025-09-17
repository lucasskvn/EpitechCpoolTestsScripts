#!/usr/bin/env bash
# loveliveandstantripleS

DIRECTORY="${1:-.}"

if [ ! -d "$DIRECTORY" ]; then
    echo "Erreur : Le répertoire $DIRECTORY n'existe pas"
    exit 1
fi

if [ ! -d "$DIRECTORY/task07" ]; then
    echo "Erreur : Le répertoire task07 n'existe pas dans $DIRECTORY"
    exit 1
fi

if [ ! -d "$DIRECTORY/task07-tests" ]; then
    echo "Erreur : Le répertoire task07-tests n'existe pas dans $DIRECTORY"
    exit 1
fi

rm -rf "$DIRECTORY"/task07_temp_*

cd "$DIRECTORY"
result1=$(find task07 -type d -o -type f -o -type l | sort)
if [ -d "$DIRECTORY/task07-tests/task07" ]; then
    result2=$(find task07-tests/task07 -type d -o -type f -o -type l | sort)
    result2_normalized=$(echo "$result2" | sed 's/task07-tests\/task07/task07/g')
else
    result2=$(find task07-tests -type d -o -type f -o -type l | sort)
    result2_normalized=$(echo "$result2" | sed 's/task07-tests/task07/g')
fi

if [ "$result1" = "$result2_normalized" ]; then
    links1=$(find task07 -type l -exec ls -la {} \; | sort)
    
    if [ -d "$DIRECTORY/task07-tests/task07" ]; then
        links2=$(find task07-tests/task07 -type l -exec ls -la {} \; | sort)
        links2_normalized=$(echo "$links2" | sed 's/task07-tests\/task07/task07/g')
    else
        links2=$(find task07-tests -type l -exec ls -la {} \; | sort)
        links2_normalized=$(echo "$links2" | sed 's/task07-tests/task07/g')
    fi
    
    if [ "$links1" = "$links2_normalized" ]; then
        echo "Test réussi : Les structures task07 et task07-tests sont identiques"
        exit 0
    else
        echo "Test échoué : Les liens symboliques diffèrent"
        echo ""
        echo "Liens dans task07 :"
        echo "$links1"
        echo ""
        echo "Liens dans task07-tests :"
        echo "$links2_normalized"
        exit 1
    fi
else
    echo "Test échoué : Les structures de répertoires diffèrent"
    echo ""
    echo "Structure de task07 :"
    echo "$result1"
    echo ""
    echo "Structure de task07-tests :"
    echo "$result2_normalized"
    exit 1
fi
