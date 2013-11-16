$user = 'chris'
$home = "/home/$user"
$git = "git@github.com:chriswhelan"

package { [ 'zsh', 'git', 'vagrant', 'synaptic', 'python-pip' ]:
   ensure => latest,
}

package { [ 'pygit2', 'git+git://github.com/Lokaltog/powerline' ]:
  ensure   => latest,
  provider => pip,
}

$prezto = "$home/.zprezto"
vcsrepo { $prezto:
  ensure   => present,
  provider => git,
  source   => "$git/prezto.git",
  user     => $user,
}

$runcoms = "$prezto/runcoms"
file { "$home/.zlogin":    ensure => link, owner => $user, target => "$runcoms/zlogin"}
file { "$home/.zlogout":   ensure => link, owner => $user, target => "$runcoms/zlogout" }
file { "$home/.zpreztorc": ensure => link, owner => $user, target => "$runcoms/zpreztorc" }
file { "$home/.zprofile":  ensure => link, owner => $user, target => "$runcoms/zprofile" }
file { "$home/.zshenv":    ensure => link, owner => $user, target => "$runcoms/zshenv" }
file { "$home/.zshrc":     ensure => link, owner => $user, target => "$runcoms/zshrc" }

$vim = "$home/.vim"
vcsrepo { $vim:
  ensure   => present,
  provider => git,
  source   => "$git/vim.git",
  user     => $user,
}

file { "$home/.vimrc": ensure => link, owner => $user, target => "$vim/vimrc" }
