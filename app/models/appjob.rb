class Appjob < ApplicationRecord
    enum seen:[:seen,:notseen]
    after_initialize :set_default_seen, :if=> :new_record?
    def set_default_seen
     self.seen ||= :notseen
    end
   
end
