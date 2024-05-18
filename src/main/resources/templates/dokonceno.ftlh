[#ftl]
<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <title>Dokončení registrace</title>
    <link rel="stylesheet" href="/css/style.css"/>
</head>
<body>
<div class="container">
    <h1>Registrace dokončena</h1>
    <div class="container_box">
    [#if email??]
        Na e-mail ${email} byla zasláno potvrzení registrace.
    [/#if]
    </div>
</div>
</body>
</html>