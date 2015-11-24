class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :confirmable

   validates_presence_of :name
   validates_presence_of :surname
   validates_presence_of :cpf
   validates_presence_of :phone1
end
