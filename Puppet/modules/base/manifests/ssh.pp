class base::ssh{
		case $osfamily{
			'RedHat':{$ssh_name='sshd'}
			'Debian':{$ssh_name='ssh'}
			default:{Warning ('OS not supported by puppet module ssh')}
			#default:{fail('OS not supported by puppet module ssh')}
		}
		#$ssh_name=$osfamily?{		
		#	'RedHat'	=>'sshd',
		#	'Debian'	=>'ssh',
		#	default		=> 'value',
		#}
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
			notify	=> Service['ssh-service'],
		}
		service{'ssh-service'
			name	=> $ssh_name,
			ensure	=> running,
			enable  => true,
		}
	}