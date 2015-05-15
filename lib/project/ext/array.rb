class Java::Util::ArrayList
  def uniq
    if self.length <= 1
      self
    else
      h = {}
      self.each do |el|
        h[el] = el
      end
      h.values
    end
  end

  def uniq!
    raise "NEEDS TO BE IMPLEMENTED"
  end

  def flatten!
    out = self.flatten
    a.clear
    self.add(out)
    self
  end
end