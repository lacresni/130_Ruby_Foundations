# Phone number

Write a program that cleans up user-entered phone numbers so that they can be sent as SMS messages.

The rules are as follows:

* If the phone number is less than 10 digits assume that it is bad number
* If the phone number is 10 digits assume that it is good
* If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits
* If the phone number is 11 digits and the first number is not 1, then it is a bad number
* If the phone number is more than 11 digits assume that it is a bad number

### Understand the problem

```
- Input:
  - A string representing a user-entered phone number with following possible formats:
    - '(123) 456-7890'
    - '456.123.7890'
    - 11 digits strating with a '1' such as '19876543210'
    
- Output:
  - A string representing a 10 digits phone number
    - '0000000000' if invalid input ('1a2a3a4a5a6a7a8a9a0a', )
```

### Tests Cases

```
- See provided tests cases
```

### Data Structures

```
- Input:
  - A string
- Output:
  - A string
```

### Algorithm

```
  - Verify possible input formats with regex
    - '(123) 456-7890' => regex /\([0-9]{3}\) [0-9]{3}-[0-9]{4}/
    - '456.123.7890' => regex /[0-9]{3}\.[0-9]{3}\.[0-9]{4}/
    - 10 digits => regex /[0-9]{10,11}/
      - if 11 digits, check number starts with a '1' such as '19876543210'
        - returns last 10 digits
  - Substitute non digit chars with '' to remove all characters except digits
    - "(123) 456-7890".gsub(/[^0-9]/, '')
  - Check size
    - if size = 10, ok return number
    - if size = 11
        - check if first digit = 1, ok return number
    - else return '0000000000'
    
```