grep -RhEo "[A-Za-z\.-_]*@[A-Za-z]*[\.A-Za-z]*" /etc | tr "\n" "," > emails.lst
