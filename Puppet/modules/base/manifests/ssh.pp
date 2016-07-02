class base::ssh{
		package{'openssh-pkge':
			name	=> 'openssh',
			ensure	=> present,
			before	=> File['/etc/ssh/sshd_config'],
		}
		file{'/etc/ssh/sshd_config':
			ensure 	=> file,
			owner	=> root,
			group	=> root,
			source	=> 'puppet:///modules/base/sshd_config',
			notify	=> Service['sshd'],
		}
		service{'sshd'
			ensure	  => running,
			enable    => true,
		}
	}