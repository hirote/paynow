require 'rails_helper'

describe 'visitante ve empresa' do
  it 'sucesso' do
    Empresa.create!(cnpj:'XX. XXX. XXX/0001-XX',
      				razao_social:'Loja A LTDA',
      				endereco:'Rua de mão unica',
      				email_faturamento:'Loja@A.br',
      				token:'0000000000A000000000')
    Empresa.create!(cnpj:'XX. XXX. XXX/0003-XX',
      				razao_social:'Loja B LTDA',
      				endereco:'Rua de mão dupla',
      				email_faturamento:'Loja@B.br',
      				token:'0000000000B000000000')
    

    visit root_path
    click_on 'Empresas'

    expect(page).to have_content('Loja A LTDA')
    expect(page).to have_content('XX. XXX. XXX/0001-XX')
    expect(page).to have_content('Loja@A.br')
    expect(page).to have_content('Loja B LTDA')
    expect(page).to have_content('XX. XXX. XXX/0003-XX')
    expect(page).to have_content('Loja@B.br')
  end

  it ' usuario visualizou detalhes' do
    Empresa.create!(cnpj:'XX. XXX. XXX/0001-XX',
              razao_social:'Loja A LTDA',
              endereco:'Rua de mão unica',
              email_faturamento:'Loja@A.br',
              token:'0000000000A000000000')
    Empresa.create!(cnpj:'XX. XXX. XXX/0003-XX',
              razao_social:'Loja B LTDA',
              endereco:'Rua de mão dupla',
              email_faturamento:'Loja@B.br',
              token:'0000000000B000000000')
    

    visit root_path
    click_on 'Empresas'
    click_on 'Loja A LTDA'

    expect(page).to have_content('XX. XXX. XXX/0001-XX')
    expect(page).to have_content('Loja A LTDA')
    expect(page).to have_content('Rua de mão unica')
    expect(page).to have_content('Loja@A.br')
    expect(page).to have_content('0000000000A000000000')
  end

  it 'não tem empresa' do
    visit root_path
    click_on 'Empresas'

    expect(page).to have_content('Nenhuma empresa cadastrada')
  end

  it 'voltar a pagina inicial' do
    Empresa.create!(cnpj:'XX. XXX. XXX/0001-XX',
              razao_social:'Loja A LTDA',
              endereco:'Rua de mão unica',
              email_faturamento:'Loja@A.br',
              token:'0000000000A000000000')

    visit root_path
    click_on 'Empresas'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  it 'retornar a empresa' do
    Empresa.create!(cnpj:'XX. XXX. XXX/0001-XX',
              razao_social:'Loja A LTDA',
              endereco:'Rua de mão unica',
              email_faturamento:'Loja@A.br',
              token:'0000000000A000000000')

    visit root_path
    click_on 'Empresas'
    click_on 'Loja A LTDA'
    click_on 'Voltar'

    expect(current_path).to eq empresas_path
  end
end