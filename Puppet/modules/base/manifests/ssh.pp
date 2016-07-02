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
			notify	=> Service['ssh-service-name-two'],
		}
		service{'ssh-service'
			name	=> $base::params::ssh_name,		
			ensure	=> running,
			alias	=> 'ssh-service-name-two',
			enable  => true,
		}
	}	