DIR=~/Library/Developer/Xcode/Templates/SPHTemplates
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
        cloneRepo "SceneWithCoordinator"
    fi
} 

cloneRepo() {
    if [ -d "${DIR}/$1.xctemplate" ]; then
        echo "🟤 $1 template available updating new one"
        rm -rf "${DIR}/$1.xctemplate"
    fi

    git clone -b "$1" "$GITREPO" "${DIR}/$1.xctemplate" 
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

