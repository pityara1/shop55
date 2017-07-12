class Doc < ApplicationRecord
  include ImageUploader[:image]
  before_save :set_params
  validates :title, :text, presence: true
  belongs_to :executor, class_name: "User"
  belongs_to :initiator, class_name: "User"
  belongs_to :signer, class_name: "User"
  belongs_to :destination, class_name: "User"
  has_and_belongs_to_many :users


  def set_params
    self.number = sprintf("%03d", Doc.last.id+1) + '-055'
    self.signed, self.agreed, self.done = false, false, false
  end
end
