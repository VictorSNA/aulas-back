class Account < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :cpf, presence: true
  validates :telephone, presence: true
  validates :cep, presence: true
  validates :public_place, presence: true
  validates :address, presence: true
  validates :address_number, presence: true
  validates :complement, presence: true

  before_create :set_default_user_type

  def set_default_user_type
    return if self.permission.present?
    self.permission = "costumer"
  end

  def admin?
    self.permission == "admin"
  end
end
