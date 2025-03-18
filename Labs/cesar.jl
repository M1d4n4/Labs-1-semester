# Функция для шифрования текста шифром Цезаря
function caesar_cipher(text::String, k::Int)
    # Создаем массив для хранения зашифрованного текста
    encrypted_text = []
    
    # Проходим по каждому символу в тексте
    for char in text
        if 'a' <= char <= 'z'  # Если символ - строчная буква
            push!(encrypted_text, Char((Int(char) - Int('a') + k) % 26 + Int('a')))
        elseif 'A' <= char <= 'Z'  # Если символ - заглавная буква
            push!(encrypted_text, Char((Int(char) - Int('A') + k) % 26 + Int('A')))
        else
            # Если символ не является буквой, оставляем его без изменений
            push!(encrypted_text, char)
        end
    end
    
    # Преобразуем массив символов обратно в строку и возвращаем результат
    return join(encrypted_text)
end

# Пример использования:
plaintext = "Hello, World!"
key = 3
ciphertext = caesar_cipher(plaintext, key)
println("Зашифрованный текст: ", ciphertext)

# Расшифровка выполняется путем применения шифра Цезаря с отрицательным ключом
decrypted_text = caesar_cipher(ciphertext, -key)
println("Расшифрованный текст: ", decrypted_text)
