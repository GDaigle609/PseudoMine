
require "glimmer-dsl-swt"

class Test
  include Glimmer::UI::CustomShell

  attr_accessor :code_in, :code_out
  def compile
    out = ""
    self.code_in.split("\n").each do |line|
      out << line.chomp.upcase.to_s
      out << "\n"
    end
    self.code_out = out.chomp
  end
  def initialize
    self.code_in = "test"
    self.compile
  end
  def open
    shell {
      minimum_size 640, 480
      composite {
        grid_layout 3, false
        code_text(lines: true) {
          text <=> [self, :code_in]
          layout_data :fill, :fill, true, true
        }
        button {
          text "Compile >>"
          on_widget_selected {
            self.compile
          }
          layout_data :center, :center, false, false
        }
        code_text(lines: true) {
          text <= [self, :code_out]
          layout_data :fill, :fill, true, true
        }
      }
    }.open
  end
end

Test.new.open