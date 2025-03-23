# Лабораторная работа №1
## Шифры простой замены

**Выполнил:**  
Студент: Да Кошта Феррейра Мидана
группы НФИмд-01-24

---

### Введение

Целью данной лабораторной работы является изучение и реализация шифров простой замены, таких как шифр Цезаря и шифр Атбаш. Шифры простой замены используются для защиты информации путем замены символов исходного текста на другие символы согласно определенному алгоритму. В ходе работы будут реализованы программы для шифрования и дешифрования текста с использованием этих алгоритмов.

---

### Теоретическая часть

#### Шифр Цезаря

Шифр Цезаря — это один из самых простых и известных шифров, основанный на сдвиге букв алфавита на фиксированное число позиций. Например, при сдвиге на 3 позиции:
- Буква **А** заменяется на **Г**.
- Буква **Б** заменяется на **Д**.
- И так далее.

Математически шифрование можно описать формулой:
\[ C = (P + k) \mod m \]
где:
- \( C \) — символ шифртекста,
- \( P \) — символ открытого текста,
- \( k \) — ключ (сдвиг),
- \( m \) — длина алфавита.

#### Шифр Атбаш

Шифр Атбаш — это шифр, в котором буквы алфавита заменяются на симметричные им буквы из конца алфавита. Например:
- Буква **А** заменяется на **Я**.
- Буква **Б** заменяется на **Ю**.
- И так далее.

---

### Практическая часть

#### Реализация шифра Цезаря

# Шифр Цезаря
function caesar_cipher(text::String, key::Int)
    alphabet = 'а':'я'
    alphabet_length = length(alphabet)
    cipher_dict = Dict{Char, Char}()
    for (i, char) in enumerate(alphabet)
        new_index = (i + key - 1) % alphabet_length + 1
        cipher_dict[char] = alphabet[new_index]
    end
    encrypted_text = join([get(cipher_dict, char, char) for char in lowercase(text)], "")
    return encrypted_text
end

# Шифр Атбаш
function atbash_cipher(text::String)
    alphabet = 'а':'я'
    alphabet_length = length(alphabet)
    cipher_dict = Dict{Char, Char}()
    for (i, char) in enumerate(alphabet)
        mirror_index = alphabet_length - i + 1
        cipher_dict[char] = alphabet[mirror_index]
    end
    encrypted_text = join([get(cipher_dict, char, char) for char in lowercase(text)], "")
    return encrypted_text
end

# Пример использования шифра Цезаря
plaintext = "привет"
key = 3
encrypted_text = caesar_cipher(plaintext, key)
println("Зашифрованный текст (Цезарь): ", encrypted_text)

# Пример использования шифра Атбаш
encrypted_text_atbash = atbash_cipher(plaintext)
println("Зашифрованный текст (Атбаш): ", encrypted_text_atbash)

