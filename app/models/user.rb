class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable
         #, :confirmable

   has_attached_file :avatar, styles: {thumb: '160x160#', smaller: '100x100#'},
   default_url: "/default_assets/default-user-avatar-:style.png"
   validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

   validates_presence_of :name
   validates_presence_of :surname
   validates_presence_of :cpf
   validates_presence_of :phone1

   def full_name
     "#{name} #{surname}"
   end
end
