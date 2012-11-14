package isohill.tmx {

import flash.utils.Dictionary;

public interface TMXLayer {
    function getType():String;
    function hash():String;
    function get name():String;
    function set name(name:String):void;
    function get index():int;
    function set index(index:int):void;
    function get width():int;
    function set width(width:int):void;
    function get height():int;
    function set height(height:int):void;
    function get properties():Dictionary;
    function set properties(props:Dictionary):void;
}
}
