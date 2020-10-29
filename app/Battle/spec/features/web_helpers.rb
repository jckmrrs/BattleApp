def sign_in_and_play
  visit('/battle')
  fill_in :player_one_name, with: 'Jack'
  fill_in :player_two_name, with: 'Josh'
  click_button "submit"
end
