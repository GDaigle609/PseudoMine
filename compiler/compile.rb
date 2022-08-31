


module Lexer

  class Token
    @type
    @value

    def initialize(type, value)
      @type = type
      @value = value
    end

    def to_s ; "[#{@type}: #{@value.inspect}]" end
    def inspect ; "Token[#{@type}: #{@value.inspect}]" end

    def self.[](type, value)
      return Token.new(type, value)
    end
  end

  class AbstractNode
    attr_reader :parent, :token, :children
    @parent
    @token
    @children
    def initialize(token, parent = nil, child_tokens = Array.new)
      @token = token
      @children = child_tokens.map do |child_token|
        AbstractNode.new(child_token, self)
      end
    end

    def add_children(tokens)

    end



  end

  def construct_tokens(src)
    str = src.gsub(/\s+/, " ")
    chars = str.grapheme_clusters
    tokens = []

  end


end

include Lexer


s = File.open("./code.txt", "r").readlines.join
a = construct_tokens(s)

arr = [1, 2, 3]

arr.append(*[4, 5, 6])


p arr






