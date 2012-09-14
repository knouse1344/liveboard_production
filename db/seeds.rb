Community.delete_all

Community.create!(:name => 'Amherst College', :timezone => 'America/New_York')
Community.create!(:name => 'University of Rochester', :timezone => 'America/New_York')
Community.create!(:name => 'Macalester College', :timezone => 'America/Chicago')


Channel.delete_all
Channel.create!(:channel => 'Academics')
Channel.create!(:channel => 'Arts')
Channel.create!(:channel => 'Nightlife')
Channel.create!(:channel => 'Sports')
