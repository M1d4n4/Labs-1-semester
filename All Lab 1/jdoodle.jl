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