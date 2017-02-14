module ViewHelpers exposing (viewVideo, viewMediaItem)

import Html exposing (Html, text, div, img, h1, h4, iframe, audio, ul)
import Html.Attributes exposing (class, src, width, height, attribute, autoplay, controls)
import Types exposing (..)


viewVideo item =
    div
        [ class "video-item" ]
        [ h4
            []
            [ text <| item.description ]
        , iframe
            [ src <| "https://player.vimeo.com/video/" ++ item.src
            , width 640
            , height 360
            , attribute "frameborder" "0"
            , attribute "webkitallowfullscreen" "true"
            , attribute "mozallowfullscreen" "true"
            , attribute "allowfullscreen" "true"
            ]
            []
        ]


viewMp3 item =
    div
        [ class "audio-item" ]
        [ h4
            []
            [ text <| item.description ]
        , audio
            [ autoplay False, controls True, src item.src ]
            [ text "Your browser does not support the audio element" ]
        ]


viewYouTube item =
    div
        [ class "audio-item" ]
        [ h4
            []
            [ text <| item.description ]
        , iframe
            [ src <| "https://www.youtube.com/embed/" ++ item.src
            , width 560
            , height 315
            , attribute "frameborder" "0"
            , attribute "allowfullscreen" "true"
            ]
            []
        ]


viewMediaItem : MediaItem -> Html msg
viewMediaItem item =
    case item.provider of
        Vimeo ->
            viewVideo item

        MP3 ->
            viewMp3 item

        YouTube ->
            viewYouTube item
