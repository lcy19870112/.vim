# My .vim stuff

Inspired by @rey

## Get the config

```bash
git clone git@github.com:myitcv/.vim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
```

## Some post install work

```bash
cd ~/.vim/bundle/Command-T/ruby/command-t/
make clean
ruby extconf.rb
make
```

