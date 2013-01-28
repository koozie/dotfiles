require "rubygems" 
require "rake" 
require "rake/testtask" 
require "rake/clean"



task :default => [:deploy]


desc "Deploy VIM Setup on Windows"
task :deploy_windows do |dw|
  home_path = "#{ENV['HOMEDRIVE']}#{ENV['HOMEPATH']}"
  cmd =  "copy #{home_path}dotfiles\\vim\\.vimrc #{home_path}_vimrc"
  sh cmd
end

desc "Generic deploy for posix system: mac, linux, unix"
task :deploy do |d|
  sh %{ln -s ~/dotfiles/vim/.vimrc  ~/.vimrc}
  sh %{ln -s ~/dotfiles/vim/.vim ~/.vim}
end


