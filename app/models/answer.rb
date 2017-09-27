class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :diagnostic
  belongs_to :option_choice
  has_many :option_choices

end
