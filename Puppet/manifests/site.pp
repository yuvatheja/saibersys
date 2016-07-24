node "nodehostname"{
		include localusers
		include localusers::groups::wheel
		include localusers::groups::finance
		include base
		include apache
		include filedemo
		include ntp
		notify{'this is a test notify':}
	}