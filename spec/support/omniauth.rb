OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:moves] = OmniAuth::AuthHash.new({
															 :provider => ‘moves’,
															 :uid => ‘123456789’,
															 :user_info => {
																 :user_id => 1
															 }
															 :credentials => {:token => ‘12345’}
})
