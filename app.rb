require_relative 'config/environment'

class App < Sinatra::Base

  # accepts a name and renders the name backwards.
  get '/reversename/:name' do
    op = Operations.new
    op.reverse_name(params[:name])
  end

  # accepts a number and returns the square of that number.
  get '/square/:number' do
    number = params[:number].to_i
   "#{number * number}"
  end

  # accepts a number and a phrase and returns
  # that phrase in a string the number of times given.
  get '/say/:number/:phrase' do
    number = params[:number].to_i
    original_phrase = params[:phrase]
    phrase = ""
    number.times { phrase << original_phrase + "\n" }
    phrase
  end

  # accepts five words and returns a string with them formatted as a sentence.
  get '/say/:word1/:word2/:word3/:word4/:word5' do
    "#{params[:word1]} #{params[:word2]} #{params[:word3]} #{params[:word4]} #{params[:word5]}."
  end

  # accepts an operation (add, subtract, multiply or divide)
  # and performs the operation on the two numbers provided.
  get '/:operation/:number1/:number2' do
    op = params[:operation]
    n1 = params[:number1].to_i
    n2 = params[:number2].to_i
    case op
      when "add"
        "#{n1 + n2}"
      when "subtract"
        "#{n1 - n2}"
      when "multiply"
        "#{n1 * n2}"
      when "divide"
        "#{n1 / n2}"
      else "Unrecognised operation"
    end
  end

end
