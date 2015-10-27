class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## accessor logic for prefs
  def preferences= prefs
    self.prefs = User.prefs_to_string(prefs)
    self.save
  end

  def preferences
    if self.prefs
      prefs = User.prefs_from_string(self.prefs)
      categories = []
      prefs.each do |pref|
        categories << Category.find_by(name: pref)
      end
    else
      []
    end
  end

  ## encoding and decoding prefs
  def self.prefs_from_string s
    return s.split "_"
  end

  def self.prefs_to_string prefs
    return prefs.join "_"
  end

end
