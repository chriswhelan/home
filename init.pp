package { [ 'zsh', 'git', 'vagrant', 'synaptic', 'python-pip' ]:
   ensure => latest,
}

package { [ 'pygit2', 'git+git://github.com/Lokaltog/powerline' ]:
  ensure   => latest,
  provider => pip,
}
