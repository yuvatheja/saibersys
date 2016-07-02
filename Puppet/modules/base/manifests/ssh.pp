class base::ssh{
		package{'openssh-pkge':
			name	=> 'openssh',
			ensure	=> present,
		}
		file{'/etc/ssh/sshd_config':
			ensure 	=> file,
			owner	=> root,
			group	=> root,
			require => Package['openssh-pkge],
			source	=> 'puppet:///modules/base/sshd_config',
		}
		service{'sshd'
			ensure	  => running,
			enable    => true,
			subscribe => File['/etc/ssh/sshd_config'],
		}
	}