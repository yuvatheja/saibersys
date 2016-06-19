#adding users to the node
class localusers{	<- defined class
		user {'admin':
			ensure	 	=> present,
			gid 		=> 'wheel',
			shell 		=> 'bin/bash',
			home 		=> '/home/admin',
			managehome	=> true,
		}
		user {'user1':
			ensure	 	=> present,
			shell 		=> 'bin/bash',
			home 		=> '/home/admin',
			managehome	=> true,
			groups		=> ['wheel','finance'],
		}
	}