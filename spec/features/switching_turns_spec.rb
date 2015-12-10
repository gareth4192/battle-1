feature 'Switch turns' do

  before do
    allow(Kernel).to receive(:rand) {10}
  end

  scenario 'shows switch in players' do
    sign_in_and_play
    attack_and_ok
    expect(page).to have_content 'Computer attacked Johnny Cash'
  end

  #   As a lonely Player,
  # So I can keep my Battle skills up to scratch
  # I want to play a Computerised opponent

end
