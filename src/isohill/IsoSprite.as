package isohill 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import isohill.components.IComponent;
	import isohill.components.IsoProjection;
	import starling.textures.Texture;
	import starling.display.Image;
	import flash.utils.getTimer;
	/**
	 * The primitive entity for IsoHill isometric sprites. It's a lightweight class with enough core functionality to fit most simple games.
	 * 
	 * @author Jonathan Dunlap
	 */
	public class IsoSprite 
	{
		public var frame:int; // current frame of the image
		public var name:String; // Identifier
		public var type:String; // type label
		public var image:Image; // the actual Starling asset
		public var pt:Point3; // x, y, z location
		public var state:State; // state of the asset (directives used for AI, player controlling, etc)
		public var components:Vector.<IComponent>; // collection of sprite manipulators (including projection)
		internal var layer:GridIsoSprites;
		internal var layerIndex:int=-1;
		
		// Must be given a texture or set with setTexture before use
		public function IsoSprite(name:String, pt:Point3=null, state:State=null) 
		{
			this.name = name;
			this.state = state!=null?state:new State();
			this.pt = pt!=null?pt:new Point3();
			//if(texture!==null) setTexture(texture); // keep the image null until the texture is set
			components = new <IComponent>[IsoProjection.instance];
		}
		public function remove():void {
			if (layer != null) layer.remove(this);
		}
		public function addComponent(c:IComponent):IComponent {
			components.push(c); return c;
		}
		public function removeComponent(component:IComponent):void {
			var index:int = components.indexOf(component);
			if (index != -1) components.splice(index, 1);
		}
		// Set the texture- this can only be done once
		public function setTexture(texture:Texture):void {
			if (image != null) return;
			image = new Image(texture);
			image.pivotY = image.texture.height;
			image.pivotX = 0;//image.texture.width / 2;
		}
		// Class is ready to be used and added to the display list
		public function get ready():Boolean {
			return image !== null;
		}
		// Advanced time on the components if the sprite is ready
		public function advanceTime(time:Number):void {
			var component:IComponent;
			if (ready==false) 
			for each (component in components) {
				if(component.requiresImage()==false) component.advanceTime(time, this); // run the components that don't require an image reference on the IsoSprite if it hasn't been loaded yet
			}
			else
			for each (component in components) { // run all components if the image is loaded and ready
				component.advanceTime(time, this); 
			}
		}
	}	
}