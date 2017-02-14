module Model exposing (..)

import Types exposing (..)


type alias Model =
    { events : List Event
    }


initialModel : Model
initialModel =
    { events = []
    }
