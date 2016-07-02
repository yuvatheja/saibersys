class base {
		$dnsutil =$osfamily?{
			'RedHat' =>'bind-utils',
			'Debian' => 'dnsutils',
			default => 'bind-utils',
		}
		package{['tree',$dnsutil]:
		ensure =>present,
		}
	}