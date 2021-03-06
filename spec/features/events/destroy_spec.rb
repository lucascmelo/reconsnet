require 'rails_helper'

describe 'Deleta evento' do

  let(:user) { create :user_admin }

  before :each do
    sign_in(user)
  end

  it 'deleta um evento' do
    event = create(:event)
    visit event_path(event)
    expect(page).to have_content event.name
    click_on 'Deletar'
    expect(page).to have_content "Evento '#{event.name}' deletado com sucesso!"
  end


  it 'evento não pode ser deletado se tem participações' do
    event = create :event
    visit event_path(event)
    expect(page).to have_content(event.name)

    create :participation, person: create(:person), event: event
    create :participation, person: create(:person), event: event
    click_on 'Deletar'
    expect(page).to have_content "Evento '#{event.name}' tem restrições para ser deletado!"

    expect(Participation.where(event: event)).to_not be_empty
  end

end