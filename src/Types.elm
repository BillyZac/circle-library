module Types exposing (..)


type Msg
    = NoOp


type MediaProvider
    = Vimeo
    | MP3
    | YouTube


type alias MediaItem =
    { src : String
    , description : String
    , provider : MediaProvider
    }
