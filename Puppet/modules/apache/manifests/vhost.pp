define apache::vhost(
		$port,$document_root,
		$servername,$vhost_name="*",$vhost_dir
	){
		File{
			mode => 0677,
		}
		
		file{'index':
			path    => "${document_root}/index.html",
			ensure  => file,
			content => template{'apache/indes.html.erb'},
			before  => File['config_file'],
		}
		file{'config_file':
			path => "${vhost_dir}/${servername}.conf",
			content => template{'apache/vhost.conf.erb'},
			require => Package['apache'],
			notify => Service['apache'],
		}
	}