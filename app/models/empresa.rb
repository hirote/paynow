class Empresa < ApplicationRecord
	with_options presence:{message:'não pode ficar em branco'} do
		validates 	:cnpj,
					:razao_social,
					:endereco,
					:email_faturamento
	end
	with_options  uniqueness:{message:'já está em uso'} do
		validates	:cnpj,
					:razao_social,
					:endereco,
					:email_faturamento
	end
end
