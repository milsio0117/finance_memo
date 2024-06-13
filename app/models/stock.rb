class Stock < ApplicationRecord
    after_initialize :set_default_status, if: :new_record?

    belongs_to :user
    has_many :memos, dependent: :destroy
    has_many_attached :images
    has_many_attached :pdfs
  
    enum status: {active: 0, archived: 1}
    validates :status, inclusion: { in: statuses.keys }
    validates :ticker, presence: true
  
    private
  
    def set_default_status
      self.status ||= :active
    end
    
  end