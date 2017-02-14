module Model exposing (..)

import Types exposing (..)


type alias Model =
    { event : String
    , mediaItems : List MediaItem
    }


initialModel : Model
initialModel =
    { event = "VTI 2016"
    , mediaItems =
        [ { src = "193212488"
          , provider = Vimeo
          , description = "Break Dancing 2016"
          }
        , { src = "http://developer.mozilla.org/@api/deki/files/2926/=AudioTest_(1).ogg"
          , provider = MP3
          , description = "Descent into Catland"
          }
        , { src = "pavc6BMChPw"
          , provider = YouTube
          , description = "Funny Cat Doing Dharma! LOL"
          }
        ]
    }
