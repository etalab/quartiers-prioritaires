# Quartiers prioritaires

Script permettant de produire le fichier des quartiers prioritaires au format JSON.

## Utiliser

| Nom du champ |Type | Description |
| -- | -- | -- |
| `nom` | `String` | Nom du quartier |
| `code` | `String` | Code du quartier |
| `communes` | `Array` of `String` | Liste des communes associées |
| `contour` | Géométrie GeoJSON | Contour du quartier |

## Améliorer

### Pré-requis

* [Node.js](https://nodejs.org) >= 6
* wget
* ogr2ogr (GDAL >= 2.0)
* bash

### Préparation des données

```bash
./prepare.sh
```

### Nettoyage du projet

```bash
./clean.sh
```

## Licence

MIT
