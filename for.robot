*** Test Cases ***
#forloopTest

    #: FOR   ${i}    IN RANGE    1   10  #:FOR deprecated to FOR
    #\   LOG TO CONSOLE  ${i}

    #:FOR   ${i}    IN  1 2 3 4 5  #single space in single line
    #\   LOG TO CONSOLE  ${i}

    #FOR   ${i}    IN  1  2  3  4  5  #double space in new line
    #\   LOG TO CONSOLE  ${i}

#FORLOOP3WITHLIST
#    @{items}    create list     1   2   3   4   5
#    FOR   ${i}    IN  @{items}
#    \   LOG TO CONSOLE  ${i}

#Forloop4
#   FOR     ${i}    IN  john    david   harini  ishu
#    \   LOG TO CONSOLE  ${i}

Forloop6withexit
    @{items}    create list     1   2   3   4   5
    FOR   ${i}    IN  @{items}
    \   LOG TO CONSOLE  ${i}
    \   exit for loop if    ${i}==3
