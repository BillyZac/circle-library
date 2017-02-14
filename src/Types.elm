module Types exposing (..)

import Http exposing (..)


type Msg
    = NoOp
    | GetEvents
    | NewEvents (Result Http.Error (List Event))


type MediaProvider
    = Vimeo
    | MP3
    | YouTube


type alias MediaItem =
    { src : String
    , description : String
    , provider : MediaProvider
    }


type alias Event =
    { name : String
    , id : Int
    }
