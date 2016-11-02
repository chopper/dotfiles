### Variables

dir=~/dotfiles
backup_dir=~/dotfiles.backup
files=".vimrc .tmux.conf"

### Setup

echo -n "Creating $backup_dir folder to back up old dotfiles..."
mkdir -p $backup_dir
echo "done"

echo "Starting symlinking"

for file in $files; do
    if [ -e ~/$file ]
    then
    	echo -n "Moving $file into $backup_dir"
	mv ~/$file $backup_dir
	echo "done"
    fi

    echo -n "Creating symlink from ~/$file to $dir/$file..."
    ln -s $dir/$file ~/$file
    echo "done"
done

echo "Symlinking complete"
echo ""
