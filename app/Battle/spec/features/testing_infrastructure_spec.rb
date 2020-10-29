
# require 'capybara/rspec'

feature 'Testing infrastructure' do
  scenario 'can run app and check page content' do
    visit('/battle')
    expect(page).to have_content 'Time to Battle!'
  end
end

feature 'Creating players' do
  scenario 'can set player 1 & player 2 to given name' do
    sign_in_and_play
    expect(page).to have_content("Jack vs. Josh")
  end
  scenario 'can see player 2 Hit Points' do
    sign_in_and_play
    expect(page).to have_content("Jack: 60HP")
  end
end

feature 'Attacking player 1' do
  scenario 'player 1 can attack player 2 and get a confirmation' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content("Jack attacked Josh")
  end
  scenario 'player 1 can attack player 2 and reduce the HP of player 2 by 10' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content("Josh: 50HP")
  end
  scenario 'at the start of the game the turn is Player 1' do
    sign_in_and_play
    expect($game.show_turn.name).to eq 'Jack'
  end
  scenario 'at the start of the game it shows whos turn it is' do
    sign_in_and_play
    expect(page).to have_content("It is Jack's turn")
  end
  scenario 'player 1 can attack player 2 then it changes turn to player 2' do
    sign_in_and_play
    click_button 'Attack'
    expect($game.show_turn.name).to eq 'Josh'
  end
  scenario 'player 1 can attack player 2 then shows it is player 2s turn' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content ("Josh's turn")
  end

feature 'Attacking player 2' do
    scenario 'player 2 can attack player 1 and get a confirmation' do
      sign_in_and_play
      click_button 'Attack'
      click_button 'Attack'
      expect(page).to have_content("Josh attacked Jack")
    end
    scenario 'player 2 can attack player 1 and reduce the HP of player 1 by 10' do
      sign_in_and_play
      click_button 'Attack'
      click_button 'Attack'
      expect(page).to have_content("Jack: 50HP")
    end

    scenario 'player 2 can attack player 1 then it changes turn to player 1' do
      sign_in_and_play
      click_button 'Attack'
      click_button 'Attack'
      expect($game.show_turn.name).to eq 'Jack'
    end
    scenario 'player 2 can attack player 1 then shows it is player 1s turn' do
      sign_in_and_play
      click_button 'Attack'
      click_button 'Attack'
      expect(page).to have_content ("Jack's turn")
    end
  end
end
