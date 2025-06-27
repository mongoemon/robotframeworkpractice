*** Settings ***
Library    JSONLibrary
Library    String

*** Variables ***
${json_data} =    {"name":"John","age":30,"city":"New York"}
${name}    "Joh"
${text1} =    hello
${text2} =    hello robot framework
${jsontext} =    "['hellofriend']"
${textsingleQ}=    'textsinglequote'
${original_string} =    "My name is 'John'"
${plaintext}=    plaintext
${list}=    ['banana','apple','orange']
${fruitname}=    'banana'
${onefruitlist}=     ['banana']
${original_text} =    My name is John
${original_text_DC} =    "My name is John"
${original_text4} =    "My name is John"

*** Test Cases ***
Test JSON Data
    ${json_dataconvert}=    Convert JSON To String    ${json_data}
    Log To Console    ${json_dataconvert}
    Should be true    ${name} in ${json_dataconvert}

*** Test Cases ***
Test Text Validation
    ${text1String}=    Convert JSON To String    ${text1}
    Log To Console    ${text1String}
    ${text2String}=    Convert JSON To String    ${text2}
    Log To Console    ${text2String}
    Should be true    ${text1String} in ${text2String}
    #can compare between strings

Test replace text
    Log To Console    ${text1}
    ${textupdate}=    Replace String    ${text1}    hello    yello
    Log To Console    ${textupdate}
    ${textupdate2}=    Replace String    ${text1}    l    p
    Log To Console    ${textupdate2}

Remove String
    ${str} =	Remove String	Robot Framework	    work	
    Log To Console    ${str}

Remove String2
    ${str} =	Remove String	${jsontext}	    "    '    [    ]	
    Log To Console    ${str}

Check name from list
    #note must use string compare with list
    Should be true    ${fruitname} in ${list}   
    #we cannot compare list with list
    # Should be true    ${onefruitlist} in ${list} 

*** Test Cases ***
Test Text Validation
    # ${original_text} =    My name is John
    Should Start With    ${original_text}    My

Test Text Validation2
    # ${original_text_DC} =    "My name is John"
    Should Start With    ${original_text_DC}    "My

Test Text Validation3
    # ${original_text_DC} =    "My name is John"
    ${removeDQ}=    Remove String    ${original_text_DC}    "    '    [    ]
    Should Start With    ${removeDQ}    My

