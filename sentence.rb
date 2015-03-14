class Sentence
  def initialize(sentence)
    @sentence = sentence
    @objects = sentence.split(' ')
    @verb = @objects.shift
  end
  def verb
    return @verb
  end
  def objects
    return @objects
  end
end
