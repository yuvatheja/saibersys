node "nodehostname"{
		include localusers
		include localusers::groups::wheel
		include localusers::groups::finance
		notify{'this is a test notify':}
	}