# require 'app'
#
# describe App do
#
#   desrcibe '#new' do
#     it 'prints testing display on load' do
#
#       expect().to eq
#     end
#    end
#
# end

# require 'capybara/rspec'

feature 'Testing infrastructure' do
  scenario 'can run app and check page content' do
    visit('/battle')
    expect(page).to have_content 'Testing infrastructure working!'
  end

#this test hasnt been tested/passed, when we enter a name and click submit, we expect it to be on the page
  scenario 'can set player 1 to given name' do
    visit('/battle')
    find_field('Player One Name').value = "Grace"
    find_button('Send').click
    expect(page).to have_content("Grace")
  end
end
