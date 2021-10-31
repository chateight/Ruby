require 'tk'
TkLabel.new {
    text "hello"
    bg "red"
    pack
    }

TkButton.new{
    text "close"
    command {exit}
    pack
}

Tk.mainloop
