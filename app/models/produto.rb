class Produto < ApplicationRecord
  belongs_to :pagamento
  belongs_to :empresa
end
