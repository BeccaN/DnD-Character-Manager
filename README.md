<h1>Update Character Form</h1>
<form action="/characters/<%= @character.id %>" method="POST">
    <input id="hidden" type="hidden" name="_method" value="patch">
    <label for="name">Name:</label>
    <input type="text" name="name" value="<%= @character.name %>" placeholder="<%= @character.name %>">
    </br>
    <label for="race">Race:</label>
    <select id="race" name="race">
        <option value="dragonborn">Dragonborn</option>
        <option value="dwarf">Dwarf</option>
        <option value="elf">Elf</option>
        <option value="gnome">Gnome</option>
        <option value="half_elf">Half Elf</option>
        <option value="halfling">Halfling</option>
        <option value="half_orc">Half Orc</option>
        <option value="human">Human</option>
        <option value="tiefling">Tiefling</option>
    </select>
    </br>
    <label for="class_name">Class:</label>
    <select id="class_name" name="class_name">
        <option value="barbarian">Barbarian</option>
        <option value="bard">Bard</option>
        <option value="cleric">Cleric</option>
        <option value="druid">Druid</option>
        <option value="fighter">Fighter</option>
        <option value="monk">Monk</option>
        <option value="paladin">Paladin</option>
        <option value="ranger">Ranger</option>
        <option value="rogue">Rogue</option>
        <option value="sorcerer">Sorcerer</option>
        <option value="warlock">Warlock</option>
        <option value="wizard">Wizard</option>
    </select>
    <label for="lvl_num">Level:</label>
    <input type="number" name="lvl_num" placeholder="Level" min="1" max="20">
    </br>
    <label for="alignment">Alignment</label>
    <select id="alignment" name="alignment">
        <option value="LE">Lawful Evil</option>
        <option value="LN">Lawful Neutral</option>
        <option value="LG">Lawful Good</option>
        <option value="NE">Neutral Evil</option>
        <option value="N">True Neutral</option>
        <option value="NG">Neutral Chaotic</option>
        <option value="CE">Chaotic Evil</option>
        <option value="CN">Chaotic Neutral</option>
        <option value="CG">Chaotic Good</option>
    </select>
    </br>
    <label for="personality">Personality:</label>
    <textarea id="personality" name="personality" rows="5" columns="50" maxlength="150">Max 150 characters</textarea>
    </br>
    <label for="photo">Photo URL (must be direct link to picture): </label>
    <input type="text" name="photo">
    </br>
    <input type="submit" value="Update Character">
</form>