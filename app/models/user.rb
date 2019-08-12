class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :domain, presence: true
  validates :domain, uniqueness: true

  after_create :set_tenant

  private

  def set_tenant
    Apartment::Tenant.create(self.domain)
  end
end
