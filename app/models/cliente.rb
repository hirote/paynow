class Cliente < ApplicationRecord
  belongs_to :vendedor
  belongs_to :empresa
end
