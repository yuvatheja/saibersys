class base::params{
		case $::osfamily{
			'RedHat':{$ssh_name='sshd'}
			'Debian':{$ssh_name='ssh'}
			default:{Warning ('OS not supported by puppet module ssh')}
			#default:{fail('OS not supported by puppet module ssh')}
		}
		#$ssh_name=$osfamily?{		<-selector statements
		#	'RedHat'	=>'sshd',
		#	'Debian'	=>'ssh',
		#	default		=> 'value',
		#}
	}