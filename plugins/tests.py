basket = {'01': [{'Pepsi': '1'}, {'Чёрный самурай': '1'}, {'Lipton': '1'}]}
text = ''
for v in basket.values():
    print('value', v)
    for dictt in v:
        for key, value in dictt.items():
            text += key + ' ' + value + ', '
text = text[0:-2]
print(text)



