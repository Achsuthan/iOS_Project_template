DIR=~/Library/Developer/Xcode/Templates
GITREPO=git@github.com:Achsuthan/iOS_Project_template.git

cloneRepo() {
    echo "cloning repo"
    cd "$DIR"
    git clone 
    git clone "$GITREPO" "$DIR"
} 




if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "Templates directory found installing the tempaltes"
  cloneRepo
else
  echo "Templates folder not exist, creating new one"
  mkdir "$DIR"
  cloneRepo
fi

