module Element.PravdomilUi.Theme.Basic exposing (..)

import Element.Input
import Element.PravdomilUi exposing (..)
import Element.PravdomilUi.Theme


theme : Element.PravdomilUi.Theme.Style {} -> Element.PravdomilUi.Theme.Theme msg {}
theme a =
    let
        focusShadow =
            { color = a.primary |> toRgb |> (\v -> { v | alpha = 0.4 }) |> fromRgb
            , offset = ( 0, 0 )
            , blur = 0
            , size = 4
            }
    in
    { options =
        [ focusStyle { backgroundColor = Nothing, borderColor = Nothing, shadow = Just focusShadow }
        ]
    , page =
        [ bgColor a.back90
        , fontColor a.fore90
        , fontSize 16
        , fontFamily a.fontFamily
        ]
    , paragraph =
        [ spacing 8
        ]
    , textColumn =
        [ spacing 8
        ]
    , link =
        [ fontColor a.primary
        , borderRounded 4
        , focused [ borderShadow focusShadow ]
        ]
    , heading1 =
        [ fontSize 32
        ]
    , heading2 =
        [ fontSize 28
        ]
    , heading3 =
        [ fontSize 24
        ]
    , heading4 =
        [ fontSize 20
        ]
    , heading5 =
        [ fontSize 16
        ]
    , heading6 =
        [ fontSize 16
        ]
    , horizontalLine =
        [ borderWidthEach 0 0 0 1
        , borderColor a.back70
        ]
    , horizontalLineContainer =
        [ paddingXY 0 16
        ]
    , label =
        [ fontColor a.fore60
        , fontSize 14
        ]
    , button =
        [ spacing 8
        , padding 8
        , bgColor a.primary
        , fontColor a.back100
        , borderRounded 8
        ]
    , input =
        [ spacing 8
        , padding 8
        , bgColor a.back100
        , fontColor a.fore90
        , borderColor a.back60
        , borderWidth 1
        , borderRounded 4
        ]
    , inputPlaceholder =
        [ fontColor a.fore60
        , fontSize 14
        ]
    , inputOption =
        \x ->
            [ width (px 16)
            , height (px 16)
            , bgColor style.back100
            , borderRounded 8
            , borderWidth
                (case x of
                    Element.Input.Idle ->
                        1

                    Element.Input.Focused ->
                        1

                    Element.Input.Selected ->
                        5
                )
            , borderColor
                (case x of
                    Element.Input.Idle ->
                        style.back60

                    Element.Input.Focused ->
                        style.primary

                    Element.Input.Selected ->
                        style.primary
                )
            ]
    , blockQuote =
        [ spacing 16
        , paddingEach 32 0 0 0
        ]
    , codeSpan =
        [ padding 2
        , borderRounded 4
        , bgColor a.back80
        , fontFamily a.monospaceFontFamily
        ]
    , codeBlock =
        [ width fill
        , padding 8
        , borderRounded 4
        , bgColor a.back80
        , fontFamily a.monospaceFontFamily
        ]
    }



--


style : Element.PravdomilUi.Theme.Style {}
style =
    { fore100 = rgb 0 0 0
    , fore90 = rgb 0.12 0.14 0.15
    , fore80 = rgb 0.19 0.22 0.24
    , fore70 = rgb 0.28 0.31 0.34
    , fore60 = rgb 0.41 0.45 0.48
    , fore50 = rgb 0.54 0.58 0.61

    --
    , back100 = rgb 1 1 1
    , back90 = rgb 0.96 0.97 0.97
    , back80 = rgb 0.9 0.92 0.93
    , back70 = rgb 0.86 0.88 0.89
    , back60 = rgb 0.8 0.82 0.84
    , back50 = rgb 0.67 0.7 0.73

    --
    , primary = rgb 0.05 0.43 0.99
    , secondary = rgb 0.41 0.45 0.48

    --
    , danger = rgb 0.86 0.21 0.27
    , info = rgb 0.05 0.79 0.94
    , success = rgb 0.1 0.53 0.33
    , warning = rgb 1 0.76 0.03

    --
    , fontFamily =
        [ fontTypeface "system-ui"
        , fontTypeface "-apple-system"
        , fontTypeface "Segoe UI"
        , fontTypeface "Roboto"
        , fontTypeface "Helvetica Neue"
        , fontTypeface "Arial"
        , fontTypeface "Noto Sans"
        , fontTypeface "Liberation Sans"
        , fontSansSerif
        , fontTypeface "Apple Color Emoji"
        , fontTypeface "Segoe UI Emoji"
        , fontTypeface "Segoe UI Symbol"
        , fontTypeface "Noto Color Emoji"
        ]
    , monospaceFontFamily =
        [ fontTypeface "SFMono-Regular"
        , fontTypeface "Menlo"
        , fontTypeface "Monaco"
        , fontTypeface "Consolas"
        , fontTypeface "Liberation Mono"
        , fontTypeface "Courier New"
        , fontMonospace
        ]

    --
    , backdrop = rgba 0 0 0 0.4
    , shadow =
        \x ->
            { offset = ( 0, x / 3 )
            , size = 0
            , blur = x
            , color = rgba 0 0 0 (max 0.2 (min 0.6 (x / 32)))
            }
    }
