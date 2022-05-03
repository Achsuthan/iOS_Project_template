DIR=~/Library/Developer/Xcode/Templates
GITREPO=git@github.com:Achsuthan/iOS_Project_template.git

cloneRepos() {
    echo "🟠 Cloning repos"
    
    templates=("$@")
    length=${#templates[@]}
    if [ $length -gt 0 ]; then 
        for arg in "${templates[@]}"; do
            echo "🟡 Cloning $arg template"
            cloneRepo $arg
        done
    else 
        echo "🟣 Cloning main template"
        cloneRepo "main"
    fi
} 

cloneRepo() {
    if [ -d "${DIR}/$1" ]; then
        echo "🟤 Template available updating new one"
        rm -rf "${DIR}/$1"
    fi

    git clone -b "$1" "$GITREPO" "${DIR}/$1" 
}

templates=("$@")
    
if [ -d "$DIR" ]; then
  echo "🟢 Templates directory found installing the tempalates"
  cloneRepos ${templates[@]}
else
  echo "🟡 Templates folder not exist, creating new one"
  mkdir "$DIR"
  cloneRepos ${templates[@]}
fi

