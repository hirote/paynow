require 'rails_helper'

describe 'acesso de usuario'do

	it 'usuario cria conta' do
		visit root_path
		click_on 'Criar conta'

		fill_in 'Email', with: 'hokage@paynow.com.br'
		fill_in 'Senha', with: '123321'
		fill_in 'Confirmar senha', with: '123321'
		within 'form'do
			click_on "Criar conta"
		end

		expect(page).to have_content("Conta criada com sucesso")
		expect(page).to have_content("hokage@paynow.com.br")
		expect(current_path).to eq(root_path)
		expect(page).to_not have_content("Criar conta")
		expect(page).to_not have_content("Logar")
		expect(page).to have_content("Sair")
	end

	it 'usuario acessa conta'do
		Usuario.create!(email:"hokage@paynow.com.br",password:'123321')

		visit root_path
		click_on 'Logar'	
		fill_in 'Email', with: 'hokage@paynow.com.br'
		fill_in 'Senha', with: '123321'
		within 'form'do
			click_on 'Logar'
		end

		expect(page).to have_content('Login efetuado com sucesso')
		expect(page).to have_content("hokage@paynow.com.br")
		expect(current_path).to eq(root_path)
		expect(page).to_not have_content("Criar conta")
		expect(page).to_not have_content("Logar")
		expect(page).to have_content("Sair")
	end

	it 'usuario sai da conta'do
		Usuario.create!(email:"hokage@paynow.com.br",password:'123321')

		visit root_path
		click_on 'Logar'	
		fill_in 'Email', with: 'hokage@paynow.com.br'
		fill_in 'Senha', with: '123321'
		within 'form'do
			click_on 'Logar'
		end

		click_on 'Sair'
		expect(page).to have_content('Saiu com sucesso')
		expect(page).to_not have_content("hokage@paynow.com.br")
		expect(current_path).to eq(root_path)
		expect(page).to have_content("Criar conta")
		expect(page).to have_content("Logar")
		expect(page).to_not have_content("Sair")

	end

	xit 'login e criar conta não aparecem na tela de login e criar conta' do
		
	end

	xit 'usuario tenta criar conta com email publico' do
		visit root_path
		click_on 'Criar conta'

		fill_in 'Email', with: 'hokage@gmail.com.br'
		fill_in 'Senha', with: '123321'
		fill_in 'Confirmar senha', with: '123321'
		within 'form'do
			click_on "Criar conta"
		end

		expect(page).to have_content('Email invalido')
		expect(page).to have_content("hokage@gmail.com.br")
		expect(current_path).to eq(root_path)
		expect(page).have_content("Criar conta")
		expect(page).have_content("Logar")
		expect(page).to have_content("Sair")
	end


end