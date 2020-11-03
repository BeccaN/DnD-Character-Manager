rebecca = User.create(name: 'Rebecca', email: 'bawkahemail@gmail.com', password: 'Blep1234@')
zander = User.create(name: 'Zander', email: 'zandergamer@gmail.com', password: 'Test4567#')

Character.create(name: 'Torgast', user_id: zander.id, race: 'Half Orc', class_lvl: 'Monk 4', alignment: 'NG', background: 'Hermit', personality: 'Soft spoken and nervous. He believes in protecting the innocent.', photo: 'https://i.pinimg.com/originals/76/ce/c9/76cec992ffb19e86e9a5842ad1cf1348.jpg')
Character.create(name: 'Ada', user_id: rebecca.id, race: 'Aasimar', class_lvl: 'Paladin 4', alignment: 'LG', background: 'Soldier', personality: 'Usually found half in the bag. Very sarcastic and rude.', photo: 'https://i.pinimg.com/originals/4b/1e/33/4b1e33adb93bae5cdab280d9495af43c.jpg')
