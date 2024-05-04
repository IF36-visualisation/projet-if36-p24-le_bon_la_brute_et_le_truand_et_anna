[![Review Assignment Due
Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/Fj4cXJY4)

# Analyse des données des sons les plus écoutés sur Spotify en 2023 avec leurs statistiques sur toutes les plateformes de streaming, les musiques les moins écoutés sur la Plateforme toutes années confondu ainsi que les sons les plus écouter en 2022.

*Avant tout, nous tenons à vous informer que ce projet vise à élaborer
un tableau de bord dynamique permettant d'analyser les données des
musiques les plus écoutées et de créer divers graphiques à l'aide du
langage R. Ce tableau de bord inclura également un système de filtrage
interactif.*

## Présentation des datasets

### Les musiques les plus écoutés sur Spotify en 2023 avec leurs statistiques sur toutes les plateformes de streaming:

Lien de ce dataset :
<a href="https://www.kaggle.com/datasets/nelgiriyewithana/top-spotify-songs-2023" style="display: inline-block; ">
<img src="https://cdn.icon-icons.com/icons2/3685/PNG/512/spotify_logo_icon_229290.png" alt="FOO" style="width: 40px; height: 40px; "/>
</a>

Ce jeu de données a été publié par l'utilisateur Nidula Elgiriyewithana
⚡ sur Kaggle, qui est un utilisateur ordinaire de cette plateforme mais
qui a fusionné plusieurs API telles que celle de Spotify :
<a href='https://developer.spotify.com/documentation/web-api/reference/get-multiple-artists'>https://developer.spotify.com/documentation/web-api/reference/get-multiple-artists</a>
(mentionnée après qu'une personne a demandé la source des données dans
les commentaires), ainsi que celles de Shazam, Deezer et Apple Music. Ce
jeu de données est mis à jour annuellement. De nombreux correctifs ont
été mis en place pour résoudre des problèmes depuis sa création, tels
que des données erronées, des erreurs système, et autres.

### Les musiques les moins écoutés sur spotify toutes années confondu :

Lien de ce dataset : 
<a href="https://www.kaggle.com/datasets/estienneggx/spotify-unpopular-songs" style="display: inline-block; ">
<img src="https://cdn.icon-icons.com/icons2/3685/PNG/512/spotify_logo_icon_229290.png" alt="FOO" style="width: 40px; height: 40px; "/>
</a>

Ce jeu de données a été publié par l'utilisateur ESTIENNEGGX sur Kaggle, qui est un utilisateur ordinaire de cette plateforme. Les données ont été récupérées en utilisant Python avec l'API de Spotify et la bibliothèque Spotipy. La méthodologie utilisée est la suivante :
- Récupération des albums impopulaires (l'API de Spotify ne permet pas de récupérer directement les chansons impopulaires)
- Récupération des identifiants des chansons à partir des albums
- Récupération des caractéristiques audio des chansons.
La dernière modification de ce jeu de données remonte à plus d'un an.


### Les musiques les plus écoutés sur Spotify en 2022 avec leurs statistiques sur toutes les plateformes de streaming:

Lien de ce dataset :
<a href="https://www.kaggle.com/datasets/sveta151/spotify-top-chart-songs-2022?resource=download" style="display: inline-block; ">
<img src="https://cdn.icon-icons.com/icons2/3685/PNG/512/spotify_logo_icon_229290.png" alt="FOO" style="width: 40px; height: 40px; "/>
</a>

Ce jeu de données a été publié par l'utilisateur SVETA151 sur Kaggle, qui est un utilisateur ordinaire de cette plateforme. Les données proviennent à l'origine de la plateforme "Top Chart Spotify Global". Le "Top Chart Spotify Global" est une liste des chansons les plus populaires dans le monde entier, selon les statistiques de streaming sur la plateforme Spotify. Les données y sont régulièrement mises à jour.

## Pourquoi avons-nous choisi ces jeux de données ?

L’arrivée du streaming dans les années 2000 à transformé notre façon de
consommer de la musique. L’auditeur d’aujourd’hui à un vaste choix
d'artistes, d'albums, de style, de playlist simplement sur son téléphone
et peut écouter sa musique partout même lorsqu’il n’a pas de connexion,
cela compose une grande partie du marché de la musique. Il est également
plus simple de se lancer dans la musique ainsi il y a beaucoup
d'artistes. Si on se place du pdv d’une maison de disque, il peut être
difficile de savoir qui signer ou non. En analysant les données des
musiques les plus populaires peut être pouvons nous essayer d’établir ce
qui plait le plus au consommateur sans pour autant s’attendre à une
recette miracle, simplement observer les tendances et même peut être
tenter de prévoir ce qui fonctionnera à l’avenir. \## Les données
manipulées

<details>

<summary><b><font size="+1">Les musiques plus écoutés sur Spotify en
2023 (spotify-2023.csv)</font></b></summary>

| Attribut               | Type de données      | Explication                                                                                                                                                     |
|------------------|------------------|-------------------------------------|
| `track_name`           | chaîne de caractères | Nom de la chanson. Utile pour l'identification et la recherche de la chanson dans les bases de données et les plateformes de streaming.                         |
| `artist(s)_name`       | chaîne de caractères | Nom de l'artiste(s) de la chanson. Permet d'analyser la popularité et le style de l'artiste associé à la chanson.                                               |
| `artist_count`         | entier               | Nombre d'artistes participants sur le titre. Peut indiquer des collaborations et des influences multiples sur la chanson.                                       |
| `released_year`        | entier               | L'année de sortie de la chanson. Permet d'étudier les tendances musicales au fil du temps et de comparer la performance des chansons dans différentes périodes. |
| `released_month`       | entier               | Le mois de sortie de la chanson. Peut être utilisé pour analyser les saisonsnalités et les tendances saisonnières dans la musique.                              |
| `released_day`         | entier               | Le jour de sortie de la chanson. Peut être pertinent pour étudier les stratégies de lancement de chansons.                                                      |
| `in_spotify_playlists` | entier               | Nombre de playlists Spotify dans lesquelles la chanson est présente. Indique la popularité et la portée de la chanson sur la plateforme Spotify.                |
| `in_spotify_charts`    | entier               | Nombre de fois où la chanson est apparue dans les classements Spotify. Révèle la popularité et la tendance de la chanson sur Spotify.                           |
| `streams`              | entier               | Nombre de streams sur Spotify. Mesure la popularité et l'engagement des auditeurs avec la chanson sur Spotify.                                                  |
| `in_apple_playlists`   | entier               | Nombre de playlists Apple Music dans lesquelles la chanson est présente. Indique la popularité de la chanson sur Apple Music.                                   |
| `in_apple_charts`      | entier               | Nombre de fois où la chanson est apparue dans les classements Apple Music. Révèle la popularité et la tendance de la chanson sur Apple Music.                   |
| `in_deezer_playlists`  | entier               | Nombre de playlists Deezer dans lesquelles la chanson est présente. Indique la popularité de la chanson sur Deezer.                                             |
| `in_deezer_charts`     | entier               | Nombre de fois où la chanson est apparue dans les classements Deezer. Révèle la popularité et la tendance de la chanson sur Deezer.                             |
| `in_shazam_charts`     | entier               | Nombre de fois où la chanson est apparue dans les classements Shazam. Peut indiquer la popularité émergente de la chanson.                                      |
| `bpm`                  | entier               | Le nombre de battements par minute de la chanson, indiquant le tempo. Permet de classifier le style et le genre de la chanson.                                  |
| `key`                  | chaîne de caractères | La clé musicale dans laquelle la chanson est jouée. Utile pour l'analyse harmonique et la comparaison avec d'autres chansons.                                   |
| `mode`                 | chaîne de caractères | Le mode musical de la chanson, majeur ou mineur. Influence l'émotion et l'atmosphère perçue de la chanson.                                                      |
| `danceability_%`       | entier               | Pourcentage indiquant à quel point une chanson est adaptée à la danse. Utile pour comprendre l'aspect rythmique et l'attrait pour la danse.                     |
| `valence_%`            | entier               | Pourcentage reflétant la positivité transmise par la chanson. Peut être utilisé pour analyser le sentiment et l'humeur de la chanson.                           |
| `energy_%`             | entier               | Pourcentage mesurant l'intensité et l'activité de la chanson. Indique le niveau d'énergie perçu de la chanson.                                                  |
| `acousticness_%`       | entier               | Pourcentage indiquant à quel point une chanson est acoustique. Utile pour distinguer les enregistrements acoustiques des enregistrements électroniques.         |
| `instrumentalness_%`   | entier               | Pourcentage estimant la quantité de la chanson qui est instrumentale. Peut aider à identifier les chansons avec peu ou pas de voix.                             |
| `liveness_%`           | entier               | Pourcentage détectant la présence d'un public dans l'enregistrement. Indique si la chanson a été enregistrée en direct ou en studio.                            |
| `speechiness_%`        | entier               | Pourcentage qui identifie la présence de paroles parlées dans une chanson. Utile pour distinguer les chansons chantées des chansons parlées.                    |

</details>

<details>

<summary><b><font size="+1">Les musiques les moins écoutés sur spotify
(unpopular_songs.csv et z_genre_of_artists.csv)</font></b></summary>

| Attribut           | Type de données | Explication                                                                                         |
|--------------------|-----------------|-----------------------------------------------------------------------------------------------------|
| `danceability`     | float           | Indique à quel point une chanson est adaptée à la danse. Utile pour comprendre l'aspect rythmique et l'attrait pour la danse.                   |
| `energy`           | float           | L'intensité et l'activité de la chanson. Indique le niveau d'énergie perçu de la chanson.                                                                    |
| `key`              | float           | La clé musicale dans laquelle la chanson est jouée. Utile pour l'analyse harmonique et la comparaison avec d'autres chansons.                               |
| `loudness`         | float           | L'intensité sonore globale d'une chanson en décibels (dB).                                                                                                     |
| `mode`             | float           | Le mode musical de la chanson, majeur ou mineur. Influence l'émotion et l'atmosphère perçue de la chanson.                                                    |
| `speechiness`      | float           | La présence de paroles parlées dans une chanson. Utile pour distinguer les chansons chantées des chansons parlées.                                           |
| `acousticness`     | float           | Indique la proportion d’accoustique d’une chanson. Utile pour distinguer les enregistrements acoustiques des enregistrements électroniques.                 |
| `instrumentalness` | float           | Indique la quantité de la chanson qui est instrumentale. Peut aider à identifier les chansons avec peu ou pas de voix.                                         |
| `liveness`         | float           | Détection de la présence d'un public dans l'enregistrement. Indique si la chanson a été enregistrée en direct ou en studio.                                   |
| `valence`          | float           | Indique la positivité transmise par la chanson. Peut être utilisé pour analyser le sentiment et l'humeur de la chanson.                                      |
| `tempo`            | numeric         | Le tempo de la chanson en battements par minute (BPM).                                                                                                          |
| `duration_ms`      | numeric         | La durée de la chanson en millisecondes.                                                                                                                        |
| `explicit`         | logical         | Indique si la chanson contient un langage explicite.                                                                                                            |
| `popularity`       | integer         | La popularité de la chanson sur la plateforme Spotify.                                                                                                           |
| `track_name`       | character       | Le nom de la chanson.                                                                                                                                            |
| `track_artist`     | character       | L'artiste de la chanson.                                                                                                                                        |
| `track_id`         | character       | L'identifiant unique de la chanson sur Spotify.                                                                                                                  |

</details>

<details>

<summary><b><font size="+1">Les musiques les plus écoutés sur spotify en
2022 (spotify_top_charts_22.csv)</font></b></summary>

| Attribut        | Type de données | Explication                                                                                                                                                                    |
|-----------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `uri`             | Chaîne de caractères | URI de la chanson                                                                                                                                                          |
| `artist_names`    | Chaîne de caractères | Nom de l’artiste                                                                                                                                                          |
| `track_name`      | Chaîne de caractères | Nom de la chanson                                                                                                                                                          |
| `peak_rank`       | Entier          | Classement maximal obtenu par la chanson                                                                                                                                      |
| `weeks_on_chart`  | Entier          | Nombre de semaine dans les classements des meilleurs sons                                                                                                                     |
| `danceability`    | Réel            | La danseabilité décrit à quel point une piste est adaptée à la danse en fonction d'une combinaison d'éléments musicaux comprenant le tempo, la stabilité du rythme, la force du rythme et la régularité globale. Une valeur de 0.0 est la moins adaptée à la danse et 1.0 est la plus adaptée. |
| `energy`          | Réel            | L'énergie est une mesure de 0.0 à 1.0 et représente une mesure perceptive de l'intensité et de l'activité.                                                                  |
| `key`             | Entier          | La tonalité dans laquelle la piste se trouve. Les entiers sont associés aux notes en utilisant la notation standard des classes de hauteur.                                     |
| `loudness`        | Réel            | La loudness est la qualité d’un son qui est corrélé avec l’amplitude. Les valeurs se situent généralement entre -60 et 0 dB.                                                |
| `mode`            | Entier          | Le mode indique la modalité (majeure ou mineure) d'une piste, le type de gamme à partir de laquelle son contenu mélodique est dérivé. La majeure est représentée par 1 et la mineure par 0.                                   |
| `speechiness`     | Réel            | La parole détecte la présence de mots parlés dans une piste. Plus la valeur est proche de 1.0 plus l’enregistrement est parlé.                                               |
| `acousticness`    | Réel            | Une mesure de confiance de 0.0 à 1.0 quant à savoir si la piste est acoustique.                                                                                             |
| `instrumentalness`| Réel            | Détecte la place de l’instrumental dans un son. Plus la valeur est proche de 1.0, plus le son est considéré comme instrumental (moins il y a de contenu vocal).           |
| `liveness`        | Réel            | Détecte la présence d'un public dans l'enregistrement.                                                                                                                       |
| `tempo`           | Réel            | Le tempo estimé global d'une piste en battements par minute (BPM).                                                                                                           |
| `time_signature`  | Entier          | La signature temporelle (ou mesure) est une convention de notation qui spécifie combien de temps (ou battements) il y a dans chaque mesure.                                   |
| `duration_ms`     | Entier          | La durée de la piste en millisecondes.                                                                                                                                       |


</details>

## Nos problématiques :

### Problématique :

Existe-t-il des différences significatives dans les chansons les plus
populaires sur chaque plateforme ?

#### Explication :

Pour répondre à cette problématique, nous allons utiliser les données
suivantes : - **Inclusion dans les playlists et les classements** : Nous
examinerons le nombre de playlists et les classements sur chaque
plateforme (Spotify, Apple Music, Deezer, Shazam) dans lesquels une
chanson est présente. - **Nombre total de streams** : Nous comparerons
le nombre total de streams sur chaque plateforme pour évaluer la
popularité relative des chansons. - **Caractéristiques audio** : Nous
analyserons les caractéristiques audio telles que le tempo, l'énergie,
la positivité musicale, etc., pour comprendre les préférences des
utilisateurs sur chaque plateforme. - **Variations temporelles** : Nous
étudierons les tendances temporelles dans les classements et la
popularité des chansons pour identifier toute fluctuation significative
sur chaque plateforme au fil du temps.

### Est ce qu’une application est plus influente que les autres?

Selon les musiques qu’elle met en playlist et le classement parmi les
musiques les plus écoutées sur la plateforme. On espère pouvoir observer
qu’une plateforme se démarque des autres mais il est possible qu’il n’y
ait pas forcément de différence significative qui nous permettent
d’établir la supériorité d’une plateforme par rapport aux autres en
termes d’influence. Les variables que nous souhaitons utiliser sont les
suivantes: - in_spotify_playlists: Number of Spotify playlists the song
is included in - in_spotify_charts: Presence and rank of the song on
Spotify charts - streams: Total number of streams on Spotify -
in_apple_playlists: Number of Apple Music playlists the song is included
in - in_apple_charts: Presence and rank of the song on Apple Music
charts - in_deezer_playlists: Number of Deezer playlists the song is
included in - in_deezer_charts: Presence and rank of the song on Deezer
charts

Nous pouvons comparer le nombre de playlists dans lesquelles une ou
plusieurs chansons (nous n’allons peut-être pas toutes les comparer),
que nous aurons sélectionné au préalable (nous n’avons pas encore établi
selon quels critères), sont présentes selon chaque plateforme de
streaming. Nous pouvons également comparer la place de la chanson dans
le classement des musiques pour chaque plateforme et voir si la présence
de cette chanson en playlist a une influence sur son classement et ainsi
voir sur quelle plateforme elle est la plus populaire. Le manque de
données sur le nombre total de streams sur les plateformes Apple Music
et Deezer est une vraie limite, puisque nous aurions pu le comparer avec
Spotify, De plus si nous avions eu aussi le nombre total d’utilisateurs
de chaque plateforme nous aurions pu étayer notre analyse en prenant en
considération ces informations.

### L’ambiance de la musique nous dit-elle quelque chose sur la popularité d’une musique? ou Est ce qu’une ambiance de musique est particulièrement populaire?

Autrement dit: observons nous la présence d’une ambiance en majorité
parmi les chansons les plus populaires de 2023? Par ambiance nous
entendons l’atmosphère qui se dégage de la musique, ce que l’on ressent
en l’écoutant. Pour ce faire nous pourrons établir différentes
catégories distinctes, différentes ambiances. Chacune sera définie par
des critères en utilisant notre jeu de données (pas encore totalement
établies). Pour établir ces critères nous utiliserons ces données: -
mode: Mode of the song (major or minor) - danceability\_%: Percentage
indicating how suitable the song is for dancing - valence\_%: Positivity
of the song's musical content - energy\_%: Perceived energy level of the
song

Nous observerons pour chaque catégorie le mode puisqu'en musique le mode
mineur est considéré comme plus triste tandis que le mode majeur comme
joyeux. Ensuite nous établirons des plages de pourcentages de
dansabilité, de positivité et d’énergie pour chaque catégorie. Une fois
que nous aurons établies ces ambiances nous pourrons trier les chansons
et comparer les nombre de chansons dans chaque catégorie et définir si
oui ou non une catégorie est plus représentée. Nous supposons que les
musiques festives et joyeuses pourraient être les plus représentées dans
le classement des musiques les plus populaires de 2023.

### Le tempo d’une musique joue-t-il un rôle important dans la popularité de celle-ci?

Ici nous nous demandons simplement si une plage de tempo est
particulièrement représentée dans notre jeu de donné. Nous utiliserons
uniquement la donnée du bpm. - bpm: Beats per minute, a measure of song
tempo

Nous comparerons les bpm de chaque chanson puis nous introniserons les
bpm les plus populaires.

### Les auditeurs valorisent-ils plus les paroles ou l’instrumental d’une musique?

Nous comparerons la proportion de paroles dans une musique et verrons ce
qui plait le plus en 2023. Pour cela nous utiliserons ces deux
données: - instrumentalness\_%: Amount of instrumental content in the
song - speechiness\_%: Amount of spoken words in the song

Cela nous permettra de savoir si un artiste doit plutôt investir dans
l’instrumental ou dans les paroles. Malheureusement dans cette analyse
nous ne pouvons pas évaluer la qualité des paroles (qui peut d’ailleurs
être subjective), un pourcentage élevé de mots ne signifie pas forcément
une richesse dans l’écriture non plus, cela peut simplement être la
répétition d’un refrain par exemple, ce que nous ne pouvons établir non
plus avec ce jeu de données.

### Pouvons nous évaluer la taille et l’engagement de la fanbase d’un artiste?

Dans notre jeu de données nous pouvons voir le nom des artistes qui ont
sorti les musiques ainsi nous pouvons supposer que si des artistes
reviennent souvent dans le classement, c’est qu’ils ont des auditeurs
qui sont investis et reviennent souvent les écouter et n’écoutent pas
qu’une chanson toute la discographie de l’artiste. Nous utiliserons ces
données: - artist(s)\_name: Name of the artist(s) of the song -
artist_count: Number of artists contributing to the song -
in_spotify_playlists: Number of Spotify playlists the song is included
in - in_spotify_charts: Presence and rank of the song on Spotify
charts - streams: Total number of streams on Spotify -
in_apple_playlists: Number of Apple Music playlists the song is included
in - in_apple_charts: Presence and rank of the song on Apple Music
charts - in_deezer_playlists: Number of Deezer playlists the song is
included in - in_deezer_charts: Presence and rank of the song on Deezer
charts - in_shazam_charts: Presence and rank of the song on Shazam
charts

Nous pouvons pour estimer l’engagement des auditeurs regarder si les
featurings sur lesquels l’artiste apparaît sont aussi bcp écoutés. Par
exemple, si il y a deux artistes sur une musique et que l’un des deux
artistes est présent plusieurs fois dans le classement des musiques les
plus populaires, nous pouvons supposer que ce sont ses fans plus que
celui de l’autre artiste qui ont permis à cette chanson de se retrouver
dans ce classement.

On peut également supposer que si un artiste n’est présent qu’une seule
fois dans ce classement c’est parce qu’une de ses chansons à eu du
succès auprès du grand public d’une manière générale, mais qu’il n’a pas
forcément une grosse fanbase qui écoute toutes ses musiques dès qu’elles
sortent. En observant la présence d’une musique en playlist nous pouvons
voir si la musique à été poussée vers l’auditeur ou si sans être
beaucoup en playlist elle a réussi à être populaire. De plus avec la
présence de la musique sur shazam nous pouvons peut être établir si des
gens qui n’étaient pas familier avec l’artiste l’ont découvert en
écoutant la radio, ou alors en soirée, puisque lorsqu’on shazam une
musique c’est souvent qu’on entend cette musique par hasard et qu’elle
nous sans que l’on soit des grands connaisseurs de l’artiste, donc cela
pourrait être le signe que l’artiste à bbcp ou pas de nouveaux
auditeurs.

Seulement si on avait la liste du nombre d’auditeurs mensuels moyens des
artistes de spotify nous pourrions avoir une idée plus claire de
l’engagement des auditeurs envers un artiste. De plus, il est aussi
possible qu’une musique n’ait pas été populaire parce qu’elle était en
playliste mais qu’elle ait été en playlist parce qu’elle était déjà
populaire. Nous ne savons pas dans quel ordre cela se fait.

### Quelle place l'acoustique a-t-il dans la musique? Est ce populaire de nos jours?

On sait qu’il y a pleins de façons de faire de la musique et que la
plupart des sons sont mixés. On utilise de nombreux outils qui peuvent
modifier la voix, compléter les instruments ou parfois même les
remplacer. Ce n’est d’ailleurs pas nouveau, la musique électronique date
des années 50, ainsi nous voudrions simplement savoir si, et dans quelle
proportion, les sons acoustiques ou alors des chansons totalement
acoustiques ont une place dans le paysage musicale mainstream. Nous
utiliserons pour savoir cela ces données: - acousticness\_%: Amount of
acoustic sound in the song - instrumentalness\_%: Amount of instrumental
content in the song

Nous supposons qu’il est peu probable que nous trouvions dans ce
classement des musiques 100% acoustique, nous ne serions, au contraire,
pas surpris de trouver de nombreuses chansons à 0%. Nous pensons qu’une
majorité des chansons auront une part acoustique inférieure à 50%.

### Quel titre de musique a eu le plus de succès selon sa date de sortie ?

Pour identifier le titre de musique ayant eu le plus de succès selon sa
date de sortie, nous pouvons utiliser les données suivantes :

-   track_name
-   artist(s)\_name
-   released_year
-   released_month
-   released_day
-   streams

Pour mettre en avant les titres les plus écoutés selon leur date de
sortie, nous pouvons procéder comme suit :

<strong>1. Visualiser les meilleurs titres par année :</strong> Nous
pouvons regrouper les titres par année de sortie et identifier celui
ayant reçu le plus grand nombre d'écoutes chaque année.

<strong>2. Visualiser les meilleurs titres par mois :</strong> De même,
nous pouvons analyser les tendances mensuelles en regroupant les titres
par mois de sortie et en identifiant les plus populaires pour chaque
mois.

<strong>3. Visualiser les meilleurs titres par jour :</strong> Enfin,
nous pouvons examiner les performances des titres en fonction des jours
de sortie, en identifiant les titres les plus écoutés chaque jour. Ces
analyses nous permettront de mettre en lumière les titres les plus
populaires selon différents découpages temporels, offrant ainsi un
aperçu précieux des préférences d'écoute du public au fil du temps.

### Existe-t-il une influence entre le rythme et la saison ?

En utilisant les données de BPM (battements par minute) fournies, nous
pourrions examiner comment le rythme des musiques varie selon les
saisons de l'année. Par exemple, nous pourrions regrouper les musiques
selon leur saison de sortie et calculer la moyenne du BPM pour chaque
saison. Cela nous permettrait de déterminer s'il existe des variations
significatives dans le rythme des musiques en fonction des saisons.

Pour cette étude, nous utiliserions les données suivantes :

-   released_month
-   bpm

Nous pourrions alors supposer que cette étude pourrait démontrer que les
musiques plus rythmées sont une tendance plus marquée pendant les
saisons estivales.

### Existe-t’il des caractéristiques audio communes dans les sons populaires en fonction des saisons ?

Pour explorer l'existence de caractéristiques audio communes dans les
morceaux populaires en fonction des saisons, nous pourrions suivre une
approche analytique qui implique l'utilisation des données audio
fournies telles que le BPM, la tonalité, le mode, ainsi que les
caractéristiques telles que la danceability, la valence, l'énergie, etc.
Voici comment nous pourrions procéder :

<strong>1. Regroupement des titres par saison :</strong> - Nous
regrouperont les titres en fonction de leur date de sortie pour chaque
saison de l'année.

<strong>2. Analyse des caractéristiques audio :</strong> - Nous
analyserons les caractéristiques audio des titres les plus populaires
pour chaque saison. Cela pourrait inclure des mesures telles que le BPM,
la tonalité, le mode, ainsi que des caractéristiques plus subjectives
comme la danceability, la valence, l'énergie, etc.

<strong>3. Comparaison entre les saisons :</strong> - Nous comparerons
ensuite les caractéristiques audio des titres les plus populaires entre
les différentes saisons. Nous chercherons des tendances ou des
similarités dans les caractéristiques audio des morceaux qui sont
populaires à des moments spécifiques de l'année.

<strong>4. Interprétation des résultats :</strong> Enfin, nous
interpréterons les résultats pour déterminer s'il existe des
caractéristiques audio communes dans les morceaux populaires en fonction
des saisons. Cela pourrait nous aider à identifier des tendances
saisonnières dans les préférences d'écoute du public en ce qui concerne
le style musical, le rythme et l'ambiance des morceaux.

Pour réaliser cette étude, nous allons avoir besoin des données
suivantes :

-   released_year
-   released_month
-   released_day
-   streams
-   bpm
-   key
-   mode
-   danceability\_%
-   valence\_%
-   energy\_%
-   acousticness\_%
-   instrumentalness\_%
-   liveness\_%
-   speechiness\_%

En suivant cette méthodologie, nous pourrions obtenir des informations
intéressantes sur la relation entre les caractéristiques audio des
morceaux de musique et les saisons de l'année, ce qui pourrait être
utile en tant que professionnel de l'industrie musicale dans la création
et la promotion de musique adaptée à chaque période de l'année.

## Critiques sur notre jeu de données :

En prenant du recul sur notre jeu de données, nous constatons qu'il
offre une base solide pour aborder les questions que nous avons
précédemment identifiées. Les informations sur les titres de musique,
les artistes et les mesures de popularité nous permettent d'explorer
divers aspects des tendances musicales et du succès des morceaux.

Cependant, il est important de reconnaître que notre jeu de données
présente certaines limites, notamment en ce qui concerne les aspects
géographiques. En raison de l'absence d'informations sur la localisation
géographique des auditeurs et des artistes, nous ne pouvons pas explorer
les variations régionales dans les préférences musicales ou les
habitudes d'écoute. Cette lacune réduit notre capacité à obtenir une
image complète et nuancée des tendances musicales à travers différentes
régions.

Pour enrichir notre analyse, nous pourrions envisager d'intégrer
d'autres jeux de données complémentaires. Par exemple, des données sur
les localisations géographiques des utilisateurs ou des informations
démographiques qui pourraient être croisées avec notre jeu de données
actuel. Cela nous permettrait d'explorer plus en profondeur les
variations géographiques dans les préférences musicales, ainsi que les
interactions entre la musique et la culture locale. D'un autre point de
vue, il est important de reconnaître que nous n'aurions pas été en
mesure de recueillir toutes les données mondiales, étant donné que la
politique de certains pays restreint l'accès à ces informations.

## Auteurs

-   Anna VALIER
-   Rémy KINZELIN
-   Jeanne RAYNAUD
-   Antoine SAADA
