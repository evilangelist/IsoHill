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

import isohill.GridInt;
	/**
	 * Represents a TMX layer of ints
	 * @author Jonathan Dunlap
	 */
	public class TMXTileLayer extends GridInt implements TMXLayer
	{
		public var maxGid:int = 0; // what's the highest asset id referenced
		private var _name:String;

        private var _index:int;
        private var _properties:Dictionary = new Dictionary();

        public function TMXTileLayer(w:int, h:int)
		{
			super(w, h);
		}
		public static function fromCSV(layerBlock:XML, width:int, height:int):TMXTileLayer {
			var layerRaw:Array = layerBlock.data[0].toString().split(",");

			var layer:TMXTileLayer = new TMXTileLayer(width, height);
			var index:int = 0;
			for each(var cell:String in layerRaw) {
					cell = cell.replace("\n", ""); // remove those line breaks in the cvs data
					var cellVal:int = int(cell);
					layer.maxGid = Math.max(layer.maxGid, cellVal);
					layer.setCell(index % width, Math.floor(index / width), cellVal);
					index++;
			}
			trace("csv layer parsing done");
			return layer;
		}


        public function get name():String {
            return _name;
        }

        public function set name(value:String):void {
            _name = value;
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
    }

}
