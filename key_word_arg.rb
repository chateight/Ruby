#{ arugments default and set to }

def deliver(from: "A", to: nil, via: "mail")
    p "Sending from #{from} to #{to} via #{via}."
end

deliver(to: "B")
# => "Sending from A to B via mail."
deliver(via: "Pony Express", from: "B", to: "A")
# => "Sending from B to A via Pony Express."


#{ special method greet }

a = "str"
def a.greeting
    p "asdf"
end

a.greeting


