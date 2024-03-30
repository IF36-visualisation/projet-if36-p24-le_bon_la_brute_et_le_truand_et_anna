[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/Fj4cXJY4)

# Analyse des données des sons les plus écoutés sur Spotify en 2023, ainsi que leurs statistiques sur toutes les plateformes de streaming.

*Avant tout, nous tenons à vous informer que ce projet vise à élaborer un tableau de bord dynamique permettant d'analyser les données des musiques les plus écoutées et de créer divers graphiques à l'aide du langage R. Ce tableau de bord inclura également un système de filtrage interactif.*


Lien de notre dataset : 
<a href="https://www.kaggle.com/datasets/nelgiriyewithana/top-spotify-songs-2023" style="display: inline-block; ">
  <img src="https://cdn.icon-icons.com/icons2/3685/PNG/512/spotify_logo_icon_229290.png" alt="FOO" style="width: 40px; height: 40px; ">
</a>



## Pourquoi avons-nous choisi ce jeu de données ?

L’arrivée du streaming dans les années 2000 à transformé notre façon de consommer de la musique. L’auditeur d’aujourd’hui à un vaste choix d'artistes, d'albums, de style, de playlist simplement sur son téléphone et peut écouter sa musique partout même lorsqu’il n’a pas de connexion, cela compose une grande partie du marché de la musique. Il est également plus simple de se lancer dans la musique ainsi il y a beaucoup d'artistes. Si on se place du pdv d’une maison de disque, il peut être difficile de savoir qui signer ou non. En analysant les données des musiques les plus populaires peut être pouvons nous essayer d’établir ce qui plait le plus au consommateur sans pour autant s’attendre à une recette miracle, simplement observer les tendances et même peut être tenter de prévoir ce qui fonctionnera à l’avenir.

## Les données manipulées

| Attribut               | Type de données      | Explication                                            |
|------------------------|----------------------|--------------------------------------------------------|
| `track_name`           | chaîne de caractères | Nom de la chanson. Utile pour l'identification et la recherche de la chanson dans les bases de données et les plateformes de streaming. |
| `artist(s)_name`       | chaîne de caractères | Nom de l'artiste(s) de la chanson. Permet d'analyser la popularité et le style de l'artiste associé à la chanson. |
| `artist_count`         | entier               | Nombre d'artistes participants sur le titre. Peut indiquer des collaborations et des influences multiples sur la chanson. |
| `released_year`        | entier               | L'année de sortie de la chanson. Permet d'étudier les tendances musicales au fil du temps et de comparer la performance des chansons dans différentes périodes. |
| `released_month`       | entier               | Le mois de sortie de la chanson. Peut être utilisé pour analyser les saisonsnalités et les tendances saisonnières dans la musique. |
| `released_day`         | entier               | Le jour de sortie de la chanson. Peut être pertinent pour étudier les stratégies de lancement de chansons. |
| `in_spotify_playlists` | entier               | Nombre de playlists Spotify dans lesquelles la chanson est présente. Indique la popularité et la portée de la chanson sur la plateforme Spotify. |
| `in_spotify_charts`    | entier               | Nombre de fois où la chanson est apparue dans les classements Spotify. Révèle la popularité et la tendance de la chanson sur Spotify. |
| `streams`              | entier               | Nombre de streams sur Spotify. Mesure la popularité et l'engagement des auditeurs avec la chanson sur Spotify. |
| `in_apple_playlists`   | entier               | Nombre de playlists Apple Music dans lesquelles la chanson est présente. Indique la popularité de la chanson sur Apple Music. |
| `in_apple_charts`      | entier               | Nombre de fois où la chanson est apparue dans les classements Apple Music. Révèle la popularité et la tendance de la chanson sur Apple Music. |
| `in_deezer_playlists`  | entier               | Nombre de playlists Deezer dans lesquelles la chanson est présente. Indique la popularité de la chanson sur Deezer. |
| `in_deezer_charts`     | entier               | Nombre de fois où la chanson est apparue dans les classements Deezer. Révèle la popularité et la tendance de la chanson sur Deezer. |
| `in_shazam_charts`     | entier               | Nombre de fois où la chanson est apparue dans les classements Shazam. Peut indiquer la popularité émergente de la chanson. |
| `bpm`                  | entier               | Le nombre de battements par minute de la chanson, indiquant le tempo. Permet de classifier le style et le genre de la chanson. |
| `key`                  | chaîne de caractères | La clé musicale dans laquelle la chanson est jouée. Utile pour l'analyse harmonique et la comparaison avec d'autres chansons. |
| `mode`                 | chaîne de caractères | Le mode musical de la chanson, majeur ou mineur. Influence l'émotion et l'atmosphère perçue de la chanson. |
| `danceability_%`       | entier               | Pourcentage indiquant à quel point une chanson est adaptée à la danse. Utile pour comprendre l'aspect rythmique et l'attrait pour la danse. |
| `valence_%`            | entier               | Pourcentage reflétant la positivité transmise par la chanson. Peut être utilisé pour analyser le sentiment et l'humeur de la chanson. |
| `energy_%`             | entier               | Pourcentage mesurant l'intensité et l'activité de la chanson. Indique le niveau d'énergie perçu de la chanson. |
| `acousticness_%`       | entier               | Pourcentage indiquant à quel point une chanson est acoustique. Utile pour distinguer les enregistrements acoustiques des enregistrements électroniques. |
| `instrumentalness_%`   | entier               | Pourcentage estimant la quantité de la chanson qui est instrumentale. Peut aider à identifier les chansons avec peu ou pas de voix. |
| `liveness_%`           | entier               | Pourcentage détectant la présence d'un public dans l'enregistrement. Indique si la chanson a été enregistrée en direct ou en studio. |
| `speechiness_%`        | entier               | Pourcentage qui identifie la présence de paroles parlées dans une chanson. Utile pour distinguer les chansons chantées des chansons parlées. |







## Nos problématiques
### To Do :
- Nos questions et résultats attendus
- Variables que l'on souhaite comparer et problème qu'on pourrait rencontrer 
- Critique sur notre jeu de donnée

### Problématique : 
Existe-t-il des différences significatives dans les chansons les plus populaires sur chaque plateforme ?

#### Explication :
Pour répondre à cette problématique, nous allons utiliser les données suivantes :
- **Inclusion dans les playlists et les classements** : Nous examinerons le nombre de playlists et les classements sur chaque plateforme (Spotify, Apple Music, Deezer, Shazam) dans lesquels une chanson est présente.
- **Nombre total de streams** : Nous comparerons le nombre total de streams sur chaque plateforme pour évaluer la popularité relative des chansons.
- **Caractéristiques audio** : Nous analyserons les caractéristiques audio telles que le tempo, l'énergie, la positivité musicale, etc., pour comprendre les préférences des utilisateurs sur chaque plateforme.
- **Variations temporelles** : Nous étudierons les tendances temporelles dans les classements et la popularité des chansons pour identifier toute fluctuation significative sur chaque plateforme au fil du temps.

- Est ce qu’une application est plus influente que les autres?

Selon les musiques qu’elle met en playlist et le classement parmi les musiques les plus écoutées sur la plateforme.
On espère pouvoir observer qu’une plateforme se démarque des autres mais il est possible qu’il n’y ait pas forcément de différence significative qui nous permettent d’établir la supériorité d’une plateforme par rapport aux autres en termes d’influence.
Les variables que nous souhaitons utiliser sont les suivantes:
in_spotify_playlists: Number of Spotify playlists the song is included in
in_spotify_charts: Presence and rank of the song on Spotify charts
streams: Total number of streams on Spotify
in_apple_playlists: Number of Apple Music playlists the song is included in
in_apple_charts: Presence and rank of the song on Apple Music charts
in_deezer_playlists: Number of Deezer playlists the song is included in
in_deezer_charts: Presence and rank of the song on Deezer charts
Nous pouvons comparer le nombre de playlists dans lesquelles une ou plusieurs chansons (nous n’allons peut-être pas toutes les comparer), que nous aurons sélectionné au préalable (nous n’avons pas encore établi selon quels critères), sont présentes selon chaque plateforme de streaming. Nous pouvons également comparer la place de la chanson dans le classement des musiques pour chaque plateforme et voir si la présence de cette chanson en playlist a une influence sur son classement et ainsi voir sur quelle plateforme elle est la plus populaire.
Le manque de données sur le nombre total de streams sur les plateformes Apple Music et Deezer est une vraie limite, puisque nous aurions pu le comparer avec Spotify, De plus si nous avions eu aussi le nombre total d’utilisateurs de chaque plateforme nous aurions pu étayer notre analyse en prenant en considération ces informations.


## Auteurs

* Anna VALIER
* Rémy KINZELIN
* Jeanne RAYNAUD
* Antoine SAADA
