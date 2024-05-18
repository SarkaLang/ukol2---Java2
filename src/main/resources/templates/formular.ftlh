[#ftl]
[#import "/spring.ftl" as spring]
<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <title>Registrace na letní dětský tábor</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="/images/favicon.png">
    <link rel="stylesheet" href="/css/style.css" />
</head>
<body>
<main>
    <h1>Registrace na letní dětský tábor</h1>
        <div class="form-style-5">
            <form action="/" method="post">
                <fieldset>
                    <legend><span class="number">1</span> Základní informace</legend>

                    <label for="jmeno" name="jmeno">Jméno</label>
                    [@spring.formInput path="form.jmeno" /]
                    <div class="error">[@spring.showErrors "br"/]</div>

                    <label for="prijmeni" name="prijmeni">Přijmení</label>
                    [@spring.formInput path="form.prijmeni" /]
                    <div class="error">[@spring.showErrors "<br>"/]</div>

                    <label for="datumNarozeni" name="datumNarozeni">Datum narození</label>
                    [@spring.formInput path="form.datumNarozeni" /]
                    <div class="error">[@spring.showErrors "<br>"/]</div>

                    <label for="gender" >Pohlaví:</label>
                    [@spring.formSingleSelect path="form.gender" options={
                    "": "",
                    "1": "chlapec",
                    "2": "dívka"
                    } /]
                    <div class="error">[@spring.showErrors "<br>"/]</div>


                    <label for="turnus">Turnus:</label>
                    [@spring.formSingleSelect path="form.turnus" options={
                    "": "",
                    "1": "5. až 11. července",
                    "2": "12. až 18. srpen",
                    "3": "19. až 25. srpen"
                    } /]
                    <div class="error">[@spring.showErrors "<br>"/]</div>

                </fieldset>

                <fieldset>
                    <legend><span class="number">2</span> Kontaktní údaje</legend>

                    <label form="email" name="email">Email</label>
                    [@spring.formInput path="form.email" fieldType="email"/]
                    <div class="error">[@spring.showErrors "<br>"/]</div>


                    <label for="telefon"  name="telefon">Telefon</label>
                    [@spring.formInput path="form.telefon" fieldType="number" /]
                    <div class="error">[@spring.showErrors "<br>"/]</div>

                </fieldset>
                <form method="post" action="/dokonceno">
                <input type="submit" value="Dokončit registraci" />
                </form>
            </form>
        </div>
</main>
</body>
</html>