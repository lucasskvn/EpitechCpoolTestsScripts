#!/usr/bin/env bash

# Script pour créer la structure task07
TARGET_DIR="task07"

# Nettoyer si le répertoire existe déjà
rm -rf "$TARGET_DIR"

# Créer la structure de base
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"

# Créer les répertoires par décennie
mkdir -p "1910s" "1920s" "1930s" "1940s" "1950s"

# Créer le répertoire Professors
mkdir -p "Professors"
touch "Professors/Frederic Swarts"
touch "Professors/Hendrik Lorentz"
touch "Professors/Paul Karrer"
touch "Professors/Paul Langevin"
touch "Professors/William Jackson Pope"

# Créer les répertoires de conférences
mkdir -p "Solvay Conferences on Chemistry/Constitution and Configuration of Organic Molecules"
mkdir -p "Solvay Conferences on Chemistry/Isotopes"
mkdir -p "Solvay Conferences on Chemistry/Isotopes/participants"
mkdir -p "Solvay Conferences on Chemistry/Oxygen, and its chemical and biological reactions"
mkdir -p "Solvay Conferences on Chemistry/Vitamins and Hormones"

mkdir -p "Solvay Conferences on Physics/Atoms and electrons"
mkdir -p "Solvay Conferences on Physics/Electric conductivity of metals and related problems"
mkdir -p "Solvay Conferences on Physics/Electrons and photons"
mkdir -p "Solvay Conferences on Physics/Electrons and photons/participants"
mkdir -p "Solvay Conferences on Physics/Magnetism"
mkdir -p "Solvay Conferences on Physics/The structure of matter"
mkdir -p "Solvay Conferences on Physics/The theory of radiation and quanta"

# Créer les liens symboliques des décennies vers les conférences
ln -s "../Solvay Conferences on Physics/The theory of radiation and quanta" "1910s/1911"
ln -s "../Solvay Conferences on Physics/The structure of matter" "1910s/1913"

ln -s "../Solvay Conferences on Physics/Atoms and electrons" "1920s/1921"
ln -s "../Solvay Conferences on Physics/Electric conductivity of metals and related problems" "1920s/1924"
ln -s "../Solvay Conferences on Physics/Electrons and photons" "1920s/1927"

ln -s "../Solvay Conferences on Physics/Magnetism" "1930s/1930"
ln -s "../Solvay Conferences on Chemistry/Constitution and Configuration of Organic Molecules" "1930s/1931"
ln -s "../Solvay Conferences on Chemistry/Oxygen, and its chemical and biological reactions" "1930s/1934"
ln -s "../Solvay Conferences on Chemistry/Vitamins and Hormones" "1930s/1937"

ln -s "../Solvay Conferences on Chemistry/Isotopes" "1940s/1947"

# Créer les liens des chairs vers les professeurs
ln -s "../../Professors/William Jackson Pope" "Solvay Conferences on Chemistry/Constitution and Configuration of Organic Molecules/chair"
ln -s "../../Professors/Paul Karrer" "Solvay Conferences on Chemistry/Isotopes/chair"
ln -s "../../Professors/William Jackson Pope" "Solvay Conferences on Chemistry/Oxygen, and its chemical and biological reactions/chair"
ln -s "../../Professors/Frederic Swarts" "Solvay Conferences on Chemistry/Vitamins and Hormones/chair"

ln -s "../../Professors/Hendrik Lorentz" "Solvay Conferences on Physics/Atoms and electrons/chair"
ln -s "../../Professors/Hendrik Lorentz" "Solvay Conferences on Physics/Electric conductivity of metals and related problems/chair"
ln -s "../../Professors/Hendrik Lorentz" "Solvay Conferences on Physics/Electrons and photons/chair"
ln -s "../../Professors/Paul Langevin" "Solvay Conferences on Physics/Magnetism/chair"
ln -s "../../Professors/Hendrik Lorentz" "Solvay Conferences on Physics/The structure of matter/chair"
ln -s "../../Professors/Hendrik Lorentz" "Solvay Conferences on Physics/The theory of radiation and quanta/chair"

# Créer les participants pour Electrons and photons
touch "Solvay Conferences on Physics/Electrons and photons/participants/A. Einstein"
touch "Solvay Conferences on Physics/Electrons and photons/participants/E. Schrodinger"
touch "Solvay Conferences on Physics/Electrons and photons/participants/H.A. Lorentz"
touch "Solvay Conferences on Physics/Electrons and photons/participants/M. Planck"
touch "Solvay Conferences on Physics/Electrons and photons/participants/M. Sklodowska-Curie"
touch "Solvay Conferences on Physics/Electrons and photons/participants/N. Bohr"
touch "Solvay Conferences on Physics/Electrons and photons/participants/W. Heisenberg"
touch "Solvay Conferences on Physics/Electrons and photons/participants/W.L. Bragg"

cd ..

echo "Structure task07 créée avec succès !"
echo "Vérifiez avec: tree -FQ task07"