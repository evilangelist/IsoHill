/* IsoHill engine, http://www.isohill.com
* Copyright (c) 2011, Jonathan Dunlap, http://www.jadbox.com
* All rights reserved. Licensed: http://www.opensource.org/licenses/bsd-license.php
* 
* Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
* 
* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
*/
package isohill.tmx 
{
	import flash.utils.Dictionary;
	/**
	 * TMX objectgroup element
	 * @author Jonathan Dunlap
	 */
	public class TMXObjectgroup implements TMXLayer
	{
		private var _name:String;
		private var _width:int;
		private var _height:int;

        private var _index:int;
		
		private var _properties:Dictionary = new Dictionary();
		private var _objects:Vector.<TMXObject> = new <TMXObject>[];
		private var _objectsHash:Dictionary = new Dictionary();
		
		public function TMXObjectgroup() {
		}

        public function getType():String {
            return 'objectLayer';
        }

        public function hash():String {
            return getType() + name + index;
        }

        public function get name():String {
            return _name;
        }

        public function set name(value:String):void {
            _name = value;
        }

        public function get width():int {
            return _width;
        }

        public function set width(value:int):void {
            _width = value;
        }

        public function get height():int {
            return _height;
        }

        public function set height(value:int):void {
            _height = value;
        }

        public function get index():int {
            return _index;
        }

        public function set index(value:int):void {
            _index = value;
        }

        public function get properties():Dictionary {
            return _properties;
        }

        public function set properties(value:Dictionary):void {
            _properties = value;
        }

        public function get objects():Vector.<TMXObject> {
            return _objects;
        }

        public function set objects(value:Vector.<TMXObject>):void {
            _objects = value;
        }

        public function get objectsHash():Dictionary {
            return _objectsHash;
        }

        public function set objectsHash(value:Dictionary):void {
            _objectsHash = value;
        }
    }

}
