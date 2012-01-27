class Question
  require 'builder'
  attr_accessor :question_text, :answers, :randomize, :points
  attr_reader :builder, :string
  
  def initialize(*args)
    @answers = []
    @string = ''
    @points = args[-1].kind_of?(Hash) ? args[-1][:points].to_i : 1
  end

  def text(s) ; @question_text = s ; end
  
  def explanation(text)
    @answers.each { |answer| answer.explanation ||= text }
  end

  def answer(text, opts={})
    @answers << Answer.new(text, correct=true, opts[:explanation])
  end

  def distractor(text, opts={})
    @answers << Answer.new(text, correct=false, opts[:explanation])
  end

  def correct_answer ;  @answers.detect(&:correct?)  ;  end

  def correct_answers ;  @answers.collect(&:correct?) ; end

end