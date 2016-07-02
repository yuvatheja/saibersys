class filedemo{
		file{'/root/motd':			
			ensure 	=> present,		
			source 	=> 'puppet:///modules/filedomo/motd',  root,
			group 	=> root,
			mode	=>'0644',
		}
		file{'/etc/motd':
			ensure	=> link,	
			target 	=> '/root/motd',
		}
	}