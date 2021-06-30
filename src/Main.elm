module Main exposing (..)

import Elm.Docs as Docs
import ElmUi
import Interop.JavaScript as JavaScript
import Json.Decode as Decode
import Task exposing (Task)


main : Program () () ()
main =
    case uiModule of
        Ok b ->
            JavaScript.cli (Task.succeed b)

        Err b ->
            JavaScript.cli (Task.fail (Decode.errorToString b))



--


uiModule : Result Decode.Error String
uiModule =
    ElmUi.docs
        |> Decode.decodeString (Decode.list Docs.decoder)
        |> Result.map modulesToString


modulesToString : List Docs.Module -> String
modulesToString a =
    let
        header : String
        header =
            ([]
                ++ [ "module Ui.Base exposing (..)"
                   , ""
                   , "import Ui.Style as A"
                   , "import Html"
                   , "import Html.Attributes"
                   ]
                ++ (a |> List.map (\v -> "import " ++ v.name))
                ++ [ ""
                   , ""
                   ]
                ++ baseFunctions
                ++ [ ""
                   , "--"
                   , ""
                   ]
            )
                |> String.join "\n"
    in
    a
        |> List.map moduleToString
        |> String.join "\n\n--\n\n"
        |> (++) header


baseFunctions : List String
baseFunctions =
    let
        layoutAttr : String
        layoutAttr =
            "(bgColor A.baseBgColor :: fontColor A.baseColor :: fontSize A.baseFontSize :: A.baseFontFamily :: a)"

        labelAttr : String
        labelAttr =
            "(fontColor A.labelColor :: fontSize A.labelFontSize :: a)"

        inputAttr : String
        inputAttr =
            "(spacing A.inputSpacing :: padding A.inputPadding :: bgColor A.inputBgColor :: borderColor A.inputBorderColor :: borderWidth A.inputBorderWidth :: borderRounded A.inputBorderRound :: a)"
    in
    [ "rem a = round (A.rootEm * a)"
    , "rem_ a = A.rootEm * a"
    , ""
    , "layout a = Element.layout " ++ layoutAttr
    , "layoutWith opt a = Element.layoutWith opt " ++ layoutAttr
    , ""
    , "p a = Element.paragraph (spacing A.baseLineSpacing :: a)"
    , "textColumn a = Element.textColumn (spacing A.baseLineSpacing :: width fill :: a)" -- https://github.com/mdgriffith/elm-ui/issues/286
    , ""
    , "link a = Element.link (fontColor A.linkColor :: a)"
    , "link_ a = Element.Input.button (fontColor A.linkColor :: focused [ borderColor (rgba 0 0 0 1) ] :: a)"
    , "newTabLink a = Element.newTabLink (fontColor A.linkColor :: a)"
    , "download a = Element.download (fontColor A.linkColor :: a)"
    , "downloadAs a = Element.downloadAs (fontColor A.linkColor :: a)"
    , ""
    , "h1 a = p (regionHeading 1 :: fontSize A.h1FontSize :: a)"
    , "h2 a = p (regionHeading 2 :: fontSize A.h2FontSize :: a)"
    , "h3 a = p (regionHeading 3 :: fontSize A.h3FontSize :: a)"
    , "h4 a = p (regionHeading 4 :: fontSize A.h4FontSize :: a)"
    , "h5 a = p (regionHeading 5 :: fontSize A.h5FontSize :: a)"
    , "h6 a = p (regionHeading 6 :: fontSize A.h6FontSize :: a)"
    , ""
    , "br = html (Html.br [] [])" -- https://github.com/mdgriffith/elm-ui/issues/276
    , "hr = el [ width fill, paddingXY 0 (rem 1) ] (el [ width fill, borderWidthEach 0 0 0 1, borderColor A.hrBorderColor ] none)"
    , ""
    , "id a = htmlAttribute (Html.Attributes.id a)" -- https://github.com/mdgriffith/elm-ui/issues/319
    , "noneAttribute = htmlAttribute (Html.Attributes.classList [])"
    , ""
    , "labelLeft a = Input.labelLeft " ++ labelAttr
    , "labelRight a = Input.labelRight " ++ labelAttr
    , "labelAbove a = Input.labelAbove " ++ labelAttr
    , "labelBelow a = Input.labelBelow " ++ labelAttr
    , ""
    , "inputText a = Input.text " ++ inputAttr
    , ""
    , "--"
    , ""
    ]
        ++ ([ "shadow1"
            , "shadow2"
            , "shadow3"
            , "grey0"
            , "grey1"
            , "grey2"
            , "grey3"
            , "grey4"
            , "grey5"
            , "grey6"
            , "grey7"
            , "grey8"
            , "grey9"
            , "grey10"
            , "primary"
            , "secondary"
            , "success"
            , "info"
            , "warning"
            , "danger"
            ]
                |> List.map (\v -> v ++ " = A." ++ v)
           )



--


moduleToString : Docs.Module -> String
moduleToString a =
    [ case List.map (aliasToString a) a.aliases of
        [] ->
            []

        v ->
            v ++ [ "" ]
    , List.filterMap (valueToString a) a.values
    ]
        |> List.concat
        |> String.join "\n"


valueToString : Docs.Module -> Docs.Value -> Maybe String
valueToString module_ a =
    let
        ignored : List ( String, String )
        ignored =
            [ ( "Element", "layout" )
            , ( "Element", "layoutWith" )
            , ( "Element", "paragraph" )
            , ( "Element", "textColumn" )
            , ( "Element", "link" )
            , ( "Element", "newTabLink" )
            , ( "Element", "download" )
            , ( "Element", "downloadAs" )
            , ( "Input", "labelLeft" )
            , ( "Input", "labelRight" )
            , ( "Input", "labelAbove" )
            , ( "Input", "labelBelow" )
            , ( "Input", "text" )
            ]
    in
    if List.member ( module_.name, a.name ) ignored then
        Nothing

    else if a.name == "roundEach" then
        Just (toName module_.name a.name ++ " topLeft topRight bottomLeft bottomRight = " ++ module_.name ++ "." ++ a.name ++ " { topLeft = topLeft, topRight = topRight, bottomLeft = bottomLeft, bottomRight = bottomRight }")

    else if String.endsWith "Each" a.name then
        Just (toName module_.name a.name ++ " minX maxX minY maxY = " ++ module_.name ++ "." ++ a.name ++ " { left = minX, right = maxX, top = minY, bottom = maxY }")

    else
        Just (toName module_.name a.name ++ " = " ++ module_.name ++ "." ++ a.name)


aliasToString : Docs.Module -> Docs.Alias -> String
aliasToString module_ a =
    let
        args : String
        args =
            case a.args of
                [] ->
                    ""

                _ ->
                    " " ++ String.join " " a.args
    in
    "type alias " ++ a.name ++ args ++ " = " ++ module_.name ++ "." ++ a.name ++ args



--


toName : String -> String -> String
toName moduleName a =
    case moduleName of
        "Element" ->
            a

        "Element.Background" ->
            "bg" ++ firstToUpper a

        "Element.Border" ->
            "border" ++ firstToUpper a

        "Element.Events" ->
            a

        "Element.Font" ->
            "font" ++ firstToUpper a

        "Element.Input" ->
            "input" ++ firstToUpper a

        "Element.Keyed" ->
            "keyed" ++ firstToUpper a

        "Element.Lazy" ->
            a

        "Element.Region" ->
            "region" ++ firstToUpper a

        _ ->
            a


firstToUpper : String -> String
firstToUpper a =
    a
        |> String.uncons
        |> Maybe.map (\( v, vv ) -> String.cons (Char.toUpper v) vv)
        |> Maybe.withDefault ""
