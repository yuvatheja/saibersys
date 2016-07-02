class filedemo{
		File{
			owner => 'root',
			group => 'finance',
			mode => '0660',
		}
		$homedir="/root"
		file{"${homedir}/myfile.txt":		
			content => 'myfile content',
		}
		file{"${homedir}/myfile2.txt":
			content => "my file content 2",
		}
		file{"${homedir}/myfile3.txt":
			content => "my file content 3",
			owner	=> admin,
			group	=> root,
		}
		
		file{'/root/motd':			
			ensure 	=> present,		
			source 	=> 'puppet:///modules/filedomo/motd',
			owner 	=> root,
			group 	=> root,
			mode	=>'0644',
		}
		file{'/etc/motd':
			ensure	=> link,	
			target 	=> '/root/motd',
		}
	}