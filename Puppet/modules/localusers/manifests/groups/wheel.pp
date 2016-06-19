class localusers::groups::wheel { <- this class name represents class location
		group {'wheel':
			ensure 		=> present,
			members 	=> admin,
		}
	}