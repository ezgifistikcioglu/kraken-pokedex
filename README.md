# Kraken Pokedex
![version: Dart](https://img.shields.io/badge/Dart-v2.17.3-blue)
![version: Flutter](https://img.shields.io/badge/Flutter-v3.0.3-0553B1)

## Instructions

* Run the project and read the tips first.
* Use [PokeApi V2](https://pokeapi.co/) in the app.
* Delete the `sample_feature` folder after you read it.
* Design is totally up to you.

## Requirements
| Requirement                                                                                    |  Obligation   |
| ---------------------------------------------------------------------------------------------- | :-----------: |
| Using **feature-first** architecture (current structure)                                       |     BONUS     |
| Adding **Facebook Sign-in** for authentication                                                 | **MANDATORY** |
| Adding **Google Sign-in** and **Anonymous login** for authentication                           |     BONUS     |
| Using [Bloc](https://www.bloclibrary.dev/) for **State Management**.                           | **MANDATORY** |
| Using [Chopper](https://www.pub.dev/chopper) for **Network Requests**                          |     BONUS     |
| Using [JSON Serializable](https://www.pub.dev/packages/json_serializable) for **JSON Parsing** |     BONUS     |
| Pagination for list screen                                                                     |     BONUS     |
| Write Unit tests                                                                               |     BONUS     |
| Writing Widget tests                                                                           |     BONUS     |
| Writing Integration tests                                                                      |     BONUS     |

## Pages

### Login Page
* Login with Facebook (Firebase)

### Pokemon List Screen
* List pokemons with images in Card.
* GridView with 2 columns
* Fetch pokemons with (https://pokeapi.co/api/v2/pokemon?offset=0&limit=50). First 50 pokemons are enough.
* Show pokemon images with local assets in the /assets/images/pokemon/ folder.

### Pokemon Detail Screen
* Show these info from response:
  * Image
  * Name
  * Ability
  * Moves
  * Stats
  * Types

### Project Structure 

Features
```
features/
└── feature_x/
    ├── data/
    │   ├── repository/
    │   └── service/
    ├── domain/
    │   └── models/
    └── presentation/
        ├── screen_a/
        │   ├── bloc/
        │   └── view/
        └── screen_b/
            ├── bloc/
            └── view/
```