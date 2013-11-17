$home = "/home/$id"

$git_protocol = $id ? {
  'chris' => 'git@github.com:',
  default => 'https://github.com/',
}
$git = "${git_protocol}chriswhelan"

user { $id:
  shell => '/usr/bin/zsh',
}

$prezto = "$home/.zprezto"
vcsrepo { $prezto:
  ensure   => latest,
  provider => git,
  source   => "$git/prezto.git",
  revision => 'master',
}

$runcoms = "$prezto/runcoms"
file { "$home/.zlogin":    ensure => link, owner => $id, target => "$runcoms/zlogin"}
file { "$home/.zlogout":   ensure => link, owner => $id, target => "$runcoms/zlogout" }
file { "$home/.zpreztorc": ensure => link, owner => $id, target => "$runcoms/zpreztorc" }
file { "$home/.zprofile":  ensure => link, owner => $id, target => "$runcoms/zprofile" }
file { "$home/.zshenv":    ensure => link, owner => $id, target => "$runcoms/zshenv" }
file { "$home/.zshrc":     ensure => link, owner => $id, target => "$runcoms/zshrc" }

$vim = "$home/.vim"
vcsrepo { $vim:
  ensure   => latest,
  provider => git,
  source   => "$git/vim.git",
  revision => 'master',
}

file { "$home/.vimrc": ensure => link, owner => $id, target => "$vim/vimrc" }
