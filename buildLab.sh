#!/bin/bash

solutionTemplate='#include <bits/stdc++.h>\n\n#define DEBUG false\n#define OJ_DEBUG\n\n#define $(x) {if (DEBUG) {cout << __LINE__ << ": "; {x} cout << endl;}}\n#define _(x) {cout << #x << " = " << x << " ";}\n\nconst double E = 1e-8;\nconst double PI = acos(-1);\n\nusing namespace std;\n\nclass Solution{\npublic:\n\tSolution(){}\n\tvoid problem(vector<int>& nums){}\nprivate:\n\tvector<int> nums;\n};\n\nint main(){\n\tios::sync_with_stdio(false);\n\tstring line;\n\twhile(getline(cin,line)){\n\t\tcout << line << endl;\n\t}\n\n}'
makefileTemplate='run-%:\n\tg++ $*.cpp\n\t./a.out < input/$*.txt\n\ndebug-%:\n\tg++ -g $*.cpp\n\tgdb -ex "run < input/$*.txt" ./a.out'

function chr() {
	local ascii_Value=$(awk -v v="$1" 'BEGIN{printf "%c", v}')
	echo "$ascii_Value"
}

function createFiles(){
	read -p "Type filename: " fileName
	read -p "Type number of questions: " numberOf_Questions
    mkdir $fileName
    cd $fileName
	echo -e "$makefileTemplate" > Makefile #Create MakeFile
	mkdir input
    for((i=97;i<97+$numberOf_Questions;i++));do
		solutionName=$(chr $i)
        echo -e "$solutionTemplate" > $solutionName.cpp #Create Solution's Template
		touch input/$solutionName.txt #Create empty folers for input
    done
}

function greetings(){
    printf "\n==> All files was created with SUCCESS !!!\n"
    echo "==> Contribute with us giving this repo a Star ⭐"
    echo "Maintainers:"
    printf "\t - Lucas R. de Almeida       | @propilideno\n"
	echo "Honorable Mentions:"
    printf "\t - Giovanni V. Comarela      | gc@inf.ufes.br\n"
    exit 1
}

function main(){
	createFiles
	greetings
}

main
