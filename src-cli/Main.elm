module Main exposing (..)

import Elm.Docs
import JavaScript
import Json.Decode
import Task


main : Program () () ()
main =
    JavaScript.commandLineProgramWithStdin
        (\v ->
            case uiModuleFromDocs v.stdin of
                Ok b ->
                    Task.succeed b

                Err b ->
                    Task.fail (Json.Decode.errorToString b)
        )



--


uiModuleFromDocs : String -> Result Json.Decode.Error String
uiModuleFromDocs a =
    a
        |> Json.Decode.decodeString (Json.Decode.list Elm.Docs.decoder)
        |> Result.map modulesToPravdomilUi


modulesToPravdomilUi : List Elm.Docs.Module -> String
modulesToPravdomilUi a =
    a
        |> List.map moduleToPravdomilUi
        |> (::) (header a)
        |> List.map (String.join "\n")
        |> String.join "\n\n--\n\n"


header : List Elm.Docs.Module -> List String
header a =
    [ "module Element.PravdomilUi exposing (..)"
    , ""
    , "import Html"
    , "import Html.Attributes"
    ]
        ++ (a |> List.map (\v -> "import " ++ v.name))



--


moduleToPravdomilUi : Elm.Docs.Module -> List String
moduleToPravdomilUi a =
    List.map (aliasToPravdomilUi a) a.aliases
        ++ List.filterMap (valueToPravdomilUi a) a.values


valueToPravdomilUi : Elm.Docs.Module -> Elm.Docs.Value -> Maybe String
valueToPravdomilUi module_ a =
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
            , ( "Element.Input", "button" )
            , ( "Element.Input", "labelLeft" )
            , ( "Element.Input", "labelRight" )
            , ( "Element.Input", "labelAbove" )
            , ( "Element.Input", "labelBelow" )
            , ( "Element.Input", "labelHidden" )
            , ( "Element.Input", "text" )
            , ( "Element.Input", "multiline" )
            , ( "Element.Input", "search" )
            , ( "Element.Input", "email" )
            , ( "Element.Input", "newPassword" )
            , ( "Element.Input", "currentPassword" )
            , ( "Element.Input", "placeholder" )
            , ( "Element.Input", "option" )
            ]
    in
    if List.member ( module_.name, a.name ) ignored then
        Nothing

    else if a.name == "roundEach" then
        Just (normalizeName module_.name a.name ++ " topLeft topRight bottomLeft bottomRight = " ++ module_.name ++ "." ++ a.name ++ " { topLeft = topLeft, topRight = topRight, bottomLeft = bottomLeft, bottomRight = bottomRight }")

    else if String.endsWith "Each" a.name then
        Just (normalizeName module_.name a.name ++ " minX maxX minY maxY = " ++ module_.name ++ "." ++ a.name ++ " { left = minX, right = maxX, top = minY, bottom = maxY }")

    else
        Just (normalizeName module_.name a.name ++ " = " ++ module_.name ++ "." ++ a.name)


aliasToPravdomilUi : Elm.Docs.Module -> Elm.Docs.Alias -> String
aliasToPravdomilUi module_ a =
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


normalizeName : String -> String -> String
normalizeName moduleName a =
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
