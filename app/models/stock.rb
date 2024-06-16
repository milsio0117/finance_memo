class Stock < ApplicationRecord
    after_initialize :set_default_status, if: :new_record?

    belongs_to :user
    has_many :memos, dependent: :destroy
    has_many_attached :images
    has_many_attached :pdfs
  
    enum status: {active: 0, archived: 1}
    validates :status, inclusion: { in: statuses.keys }
    validates :ticker, presence: true
    validates :images, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg', 'image/gif']
    # validates :pdfs, attached: true, content_type: ['application/pdf']
  
    private
  
    def set_default_status
      self.status ||= :active
    end
    
  end