require 'rails_helper'

RSpec.describe Empresa, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  context 'validação' do
    it 'não pode ter espaço em branco' do
      empresa=Empresa.new

      empresa.valid?

      expect(empresa.errors[:cnpj]).to include('não pode ficar em branco')
      expect(empresa.errors[:razao_social]).to include('não pode ficar em branco')
      expect(empresa.errors[:endereco]).to include('não pode ficar em branco')
      expect(empresa.errors[:email_faturamento]).to include('não pode ficar em branco')
    end

    it 'não pode repetir' do
       Empresa.create!(cnpj:'XX. XXX. XXX/0001-XX',
              razao_social:'Loja A LTDA',
              endereco:'Rua de mão unica',
              email_faturamento:'Loja@A.br',
              token:'0000000000A000000000')
       empresa=Empresa.new(razao_social:'Loja A LTDA')

       empresa.valid?

       expect(empresa.errors[:razao_social]).to include('já está em uso')
    end
  end
end
