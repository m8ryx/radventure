class Output
  def initialize(list)
    @list = list
  end

  def list_to_phrase(nothing)
    phrase = ''
    elements = @list.length
    top_index = elements - 1
    if elements > 0
      for i in 0..top_index
        phrase += @list[i].to_s
        if ( i < top_index - 1 && elements != 2 )
          phrase += ', '
        elsif ( i <= top_index - 1 && elements == 2 )
          phrase += ' and '
        elsif i == top_index - 1
          phrase += ', and '
        else phrase += '.  '
        end
      end
    else
      phrase = nothing
    end
  return phrase
  end
end

