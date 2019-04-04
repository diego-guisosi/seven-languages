class NilClass
    def blank?
        true
    end
end

class String
    def blank?
        self.size == 0
    end
end

[nil, 'Dixy', '', 'Yxid'].each { |item| puts item.upcase unless item.blank? }
