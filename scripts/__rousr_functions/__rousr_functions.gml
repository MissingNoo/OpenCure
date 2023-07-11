///@desc rousr toolkit functions

#region callstack

enum ERousrCallStatus {
	Invalid = -2,
	Error   = -1,
   
	Done = 0,
	Init,
	Ready,
	Working,

	Num
};

enum ERousrCall {
	Id = 0,
	Buffer,
	BufferSize,
	BufferIndex,
  
	Num,
}

enum ERousrCallstack {
	Calls = 0,
	Free,  
	Buffers,
	QueueCleanUp,
	LastId,
  
	Num,
};

///@function rousr_callstack_init()
///@desc Initial rousr_callstack data
///@extensionizer { "docs": false }
function rousr_callstack_init() {
	global.__rousr_callstack = [
	  [ ],
	  [ ],
	  [ ],
	  false,
	  undefined
	];

	_extRousrDLL_callstack_init();    
}
__ImguiIg(rousr_callstack_init)

///@function rousr_callstack_clean_up()
///@desc delete all the buffers in the rousr callstack system - call before you 'reset' anything using the callstacks
///@extensionizer { "docs": false }
function rousr_callstack_clean_up() {
	var callstacks_data = global.__rousr_callstack;
	var calls   = callstacks_data[ERousrCallstack.Calls];
	var buffers = callstacks_data[ERousrCallstack.Buffers];

	// shouldn't be able to happen
	if (array_length(calls) != 0) {
	  show_debug_message("Warning: Queueing rousr_callstack clean up - calls are still active");
	  callstacks_data[@ ERousrCallstack.QueueCleanUp] = true;
	  return;
	}

	var num_buffers = array_length(buffers);
	for (var i = 0; i < num_buffers; ++i) {
	  var buffer_data = buffers[i];
	  buffer_delete(buffer_data[0]);
	}

	global.__rousr_callstack = undefined;
	_extRousrDLL_callstack_shutdown();
}
__ImguiIg(rousr_callstack_clean_up)

///@function rousr_callstack_process(_call_id)
///@desc allow passing back and forth between DLL and GML
///@param {Real} _call_id
///@returns {Boolean} returns false if there's nothing left to process for `_call_id`, if true, see `rousr_callstack_buffer` for extracting data from DLL
///@extensionizer { "docs": false }
function rousr_callstack_process(argument0) {
	var _call_id = argument0;
	if (_call_id >= 0) {
	  var callstack_data = global.__rousr_callstack;
	  var _call = _rousr_callstack_call(_call_id);
  
	  var ret = _extRousrDLL_callstack_process(_call_id, buffer_get_address(_call[ERousrCall.Buffer]), _call[ERousrCall.BufferSize]);
	  callstack_data[@ ERousrCallstack.LastId] = _call_id;
  
	  switch (ret) {
	    case ERousrCallStatus.Init: 
	      return rousr_callstack_process(_call_id);
    
	    case ERousrCallStatus.Invalid:
	      show_debug_message("Warning: DLL unable to find call with id: " + string(_call_id)); 
	    case ERousrCallStatus.Error: // intenional fall-through
	    case ERousrCallStatus.Done:  // intenional fall-through
	      var calls = callstack_data[ERousrCallstack.Calls];
				
				var _call_index = -1;
				var _len = array_length(calls);
				for (var _i = 0; _i < _len; ++_i) {
					if (calls[_i] == _call) {
						_call_index = _i;
						break;
					}
				}
				
				if (_call_index != -1) {
					array_delete(calls, _call_index, 1);
				}
      
	      // return the buffer
	      var free = callstack_data[ERousrCallstack.Free];
	      array_push(free, _call[ERousrCall.BufferIndex]);
      
	      _call[@ ERousrCall.Buffer]      = undefined; 
	      _call[@ ERousrCall.BufferSize]  = 0;
	      _call[@ ERousrCall.BufferIndex] = undefined;
      
	      if (callstack_data[ERousrCallstack.QueueCleanUp]) { 
	        callstack_data[@ ERousrCallstack.QueueCleanUp] = false;
	        rousr_callstack_clean_up();
	      }      
	      return false;
    
	    default: 
	    return true;
	  }
	}

	return false;
}
__ImguiIg(rousr_callstack_process)

///@function rousr_callstack_in([_call_id])
///@desc write data IN to the DLL - get the input buffer for the `_call_id`
///      **NOTE:** Don't call this until after you're finished with `out` - they're the same buffer.
///@param {Real} [_call_id=last id]      if not passed - uses the last call_id passed to `rousr_callstack_process` right before returning
///@param {Boolean} [_seek_start=true]   by default, seek to the start
///@return {Real} sr_buffer (at start) and should be written to using `sr_buffer_write` 
///@extensionizer { "docs": false }
function rousr_callstack_in() {
	var _call_id = argument_count > 0 && argument[0] != undefined && argument[0] != noone ? argument[0] : global.__rousr_callstack[ERousrCallstack.LastId];
	if (_call_id == undefined) 
	  return undefined;

	var _call = _rousr_callstack_call(_call_id)
	var call_buffer = _call[ERousrCall.Buffer];
	if (argument_count < 2 || argument[1]) buffer_seek(call_buffer, buffer_seek_start, 0);
	return call_buffer;
}
__ImguiIg(rousr_callstack_in)

///@function rousr_callstack_out([_call_id])
///@desc read data OUT of the DLL - get the output buffer for the `_call_id` 
///@param {Real} [_call_id=last id]   if not passed - uses the last call_id passed to `rousr_callstack_process` right before returning
///@return {Real} buffer_id seek'd to start - this is a sr_buffer and can be used to read parameters in the order expected from the DLL
///@extensionizer { "docs": false }
function rousr_callstack_out() {
	var _call = _rousr_callstack_call(argument_count > 0 ? argument[0] : global.__rousr_callstack[ERousrCallstack.LastId]);
	var call_buffer = _call[ERousrCall.Buffer];
	buffer_seek(call_buffer, buffer_seek_start, 0);
	return call_buffer;
}
__ImguiIg(rousr_callstack_out)

///@function _rousr_callstack_call(_call_id)
///@desc return a call struct for a call id, if the id doesn't currently exist, assign it a buffer and return
///@param {Real} _call_id
///@returns {Array:ERousrCall}
///@extensionizer { "docs": false }
function _rousr_callstack_call(argument0) {
	var _call_id = argument0;

	var callstacks_data = global.__rousr_callstack;
	var calls = callstacks_data[ERousrCallstack.Calls];
	var last = array_length(calls) - 1;
	for (var i = last; i >= 0; --i) {
	  var call = calls[i];
	  if (call[ERousrCall.Id] == _call_id)
	    return call;
	}

	var call = array_create(ERousrCall.Num);
	call[@ ERousrCall.Id] = _call_id;

	var free       = callstacks_data[ERousrCallstack.Free];
	var buff_array = callstacks_data[ERousrCallstack.Buffers];
  
	var buff_index = array_pop(free);
	if (buff_index == undefined) {
	  var buffer = buffer_create(RousrCallBufferSize, buffer_fixed, 1);
	  array_push(buff_array, [ buffer, RousrCallBufferSize ]);
	  buff_index = array_length(buff_array) - 1;
	}

	var buff_data = buff_array[buff_index];
	call[@ ERousrCall.Buffer]      = buff_data[0];
	call[@ ERousrCall.BufferSize]  = buff_data[1];
	call[@ ERousrCall.BufferIndex] = buff_index;

	array_push(calls, call);
	return call;
}
__ImguiIg(_rousr_callstack_call)

#endregion
#region buffer

// The ordering of this is consistent with rousr based DLLs, 
// so DO NOT CHANGE.
enum ERousrData {
	Byte = 0,
	Bool,

	Int8,
	Int16,
	Int32,
	Int64,

	Uint8,
	Uint16,
	Uint32,
	Uint64,
		
	Float,
	Double,
	String,

	Num,
	Invalid = ERousrData.Num
}; 
  
// #macro _RousrDefaultBufferSize (4096)

///@function sr_buffer_read(_buffer)
///@description Reads a value from a packed buffer, first reading data type to expect.
///@param {Real} _buffer - id of buffer we're reading the _next_ value from
///@returns {Real|String} return of the buffer read
function sr_buffer_read(_buffer) {
	var dataType = buffer_read(_buffer, buffer_s8);
	var bdt = sr_buffer_rousr_to_buffer(dataType);
	if (bdt == undefined)
	  return undefined;
  
	return buffer_read(_buffer, bdt);
}
__ImguiIg(sr_buffer_read)

///@function sr_buffer_write(_buffer, _val, [_type=ERousrData.Invald])
///@description writes a value to the buffer, but first writes the type
///@param {Real}                               _buffer - buffer id to write to
///@param {Real|String}                        _val    - val to write to the buffer
///@param {Real|String} [type=ERousrData.Invalid] - the forced type to use, can be string, or ERousrData
///@returns {Boolean} true on success
function sr_buffer_write(_buffer, _val, _type = ERousrData.Invalid) {
	if (_type == undefined || _type == ERousrData.Invalid) {
	  if (is_real(_val))        _type = ERousrData.Double;
	  else if (is_string(_val)) _type = ERousrData.String;
	  else if (is_bool(_val))   _type = ERousrData.Bool;
	  else if (is_int32(_val) || is_int64(_val))  _type = ERousrData.Int32;
	//else if (is_int64(_val))  _type = ERousrData.Int64; // int64 is unsupported
	  else return false; // invalid type
	} else if (!is_real(_val) && !is_bool(_val) && !is_string(_val) && !is_int32(_val) && !is_int64(_val)) {
	  return false; // invalid type
	}

	if (_type != ERousrData.String && is_string(_val)) _type = ERousrData.String;
	if (_type == ERousrData.Bool) _val = _val ? 1 : 0;

	var bdt = sr_buffer_rousr_to_buffer(_type);
	if (bdt == undefined) 
	  return false;

	buffer_write(_buffer, buffer_s8, _type);
	buffer_write(_buffer, bdt, _val);

	// cap with a -1
	var bend = buffer_tell(_buffer);
	buffer_write(_buffer, buffer_s8, -1);
	buffer_seek(_buffer, buffer_seek_start, bend);

	return true;
}
__ImguiIg(sr_buffer_write)

///@function sr_buffer_rousr_to_buffer(_type)
///@description return a buffer type from a luarousr data type
///@param {Real} _type - The ERousrData to get buffer_xx of
///@returns {Real} buffer_xx to use for this type when writing to a buffer
function sr_buffer_rousr_to_buffer(_type) {
	var bdt = buffer_f64;
	switch (_type) {
	  case ERousrData.Bool:   bdt = buffer_s8; break;
	  case ERousrData.Byte:   bdt = buffer_s8; break;
                                   
	  case ERousrData.Int8:   bdt = buffer_s8; break;
	  case ERousrData.Int16:  bdt = buffer_s16; break;
	  case ERousrData.Int32:  bdt = buffer_s32; break;
	  //case ERousrData.Int64:  bdt = buffer_s64; break; // Unsupported
                                   
	  case ERousrData.Uint8:  bdt = buffer_u8; break;
	  case ERousrData.Uint16: bdt = buffer_u16; break;
	  case ERousrData.Uint32: bdt = buffer_u32; break;
	  case ERousrData.Uint64: bdt = buffer_u64; break;
       
	  //case __ELuaRousrDataTypeFloat16: bdt = buffer_f16; break; // Also unsupported (though buffer_f16 exists)
	  case ERousrData.Float:  bdt = buffer_f32; break;
	  case ERousrData.Double: bdt = buffer_f64; break;
  
	  case ERousrData.String: bdt = buffer_string; break;

	  default: bdt = undefined;
	}

	return bdt;
}
__ImguiIg(sr_buffer_rousr_to_buffer)

#endregion
#region sprite atlas

enum ERousrSpriteAtlas {
		SpriteList = 0,
		SpriteStack, // sprites added but not flushed
		BinPack,
		Surface,
		
		Num
};

enum ERousrAtlasSprite {
	Sprite = 0,
	Image,
	PackedId,
	PackedRect,
	UVs,
	
	Num
};

///@function sr_sprite_atlas_create(_width, _height)
///@desc create a sprite atlas
///@param {Real} _width
///@param {Real} _height
///@returns {Array:ERousrSpriteAtlas} 
///@extensionizer { "docs": false }
function sr_sprite_atlas_create(_width, _height) {
	var bin = sr_lazy_bin_create(_width, _height);
	return [
		[],
		[],
		bin,
		-1
	];
}
__ImguiIg(sr_sprite_atlas_create)

///@function sr_sprite_atlas_destroy(_sprite_atlas)
///@desc free resources used by `_sprite_atlas`
///@parma {Array:ERousrSpriteAtlas} _sprite_atlas
///@returns {undefined} 
///@extensionizer { "docs": false }
function sr_sprite_atlas_destroy(_sprite_atlas) {
	if (surface_exists(_sprite_atlas[ERousrSpriteAtlas.Surface])) {
		surface_free(_sprite_atlas[ERousrSpriteAtlas.Surface]);
	}

	return undefined;
}
__ImguiIg(sr_sprite_atlas_destroy)

///@function sr_sprite_atlas_pack(_sprite_atlas, _sprite, [_image_num=0])
///@desc pack a sprite - note that this just packs a sprite and returns an id, duplicates are allowed, etc.
///@param {Array} _sprite_atlas
///@param {Real} _sprite
///@param {Real} [_image_num=0]
///@returns {Real} sprite atlas id or -1 if it didn't fit
///@extensionizer { "docs": false }
function sr_sprite_atlas_pack(_sprite_atlas, _sprite, _image = 0) {
	var ss  = _sprite_atlas[ERousrSpriteAtlas.SpriteStack];
	var bin = _sprite_atlas[ERousrSpriteAtlas.BinPack];

	var sw = sprite_get_width(_sprite);
	var sh = sprite_get_height(_sprite);
	var packed_id = sr_lazy_bin_pack(bin, sw, sh);

	if (packed_id == -1)
		return -1;
	
	var prect = sr_lazy_bin_get(bin, packed_id),
	    w     = sr_lazy_bin_width(bin),
			h     = sr_lazy_bin_height(bin);
		
	// if (is_flipped) // this si why we quad
	var pmin = prect[0],
	    pmax = prect[1];
		
	var uvs = [
		[ pmin[0] / w, pmin[1] / h ],
		[ pmax[0] / w, pmax[1] / h ]
	];

	var atlas_sprite = [
		_sprite, _image, packed_id, prect, uvs 
	];

	var sl =_sprite_atlas[ERousrSpriteAtlas.SpriteList];
	array_push(ss, atlas_sprite);
	array_push(sl, atlas_sprite);

	return array_length(sl) - 1;
}
__ImguiIg(sr_sprite_atlas_pack)

///@function sr_sprite_atlas_get(_sprite_atlas, _atlas_index)
///@desc return an atlas sprite
///@param {Array:ERousrSpriteAtlas} _sprite_atlas
///@param {Real} _atlas_index
///@returns {Array:ERousrAtlasSprite}
///@extensionizer { "docs": false }
function sr_sprite_atlas_get(_sprite_atlas, _atlas_index) {
	var sl = _sprite_atlas[ERousrSpriteAtlas.SpriteList];
	return sl[_atlas_index];
}
__ImguiIg(sr_sprite_atlas_get)

///@function sr_sprite_atlas_flush(_sprite_atlas)
///@desc draw all the added sprites to the surface
///@param {Array} _sprite_atlas
///@extensionizer { "docs": false }
function sr_sprite_atlas_flush(_sprite_atlas) {
	var sprites  = _sprite_atlas[ERousrSpriteAtlas.SpriteStack];
	var bin      = _sprite_atlas[ERousrSpriteAtlas.BinPack];
	var surf     = _sprite_atlas[ERousrSpriteAtlas.Surface];

	var draw_all = false;
	if (!surface_exists(surf)) {
		surf = surface_create(sr_lazy_bin_width(bin), sr_lazy_bin_height(bin));
	  _sprite_atlas[@ ERousrSpriteAtlas.Surface] = surf;
		draw_all = true;
	}

	if (!draw_all && array_length(sprites) == 0)
	  return;

	var spr_list = _sprite_atlas[ERousrSpriteAtlas.SpriteList];

	surface_set_target(surf);
	if (draw_all) {
	  draw_clear_alpha(c_black, 0);
		var num_sprites = array_length(spr_list);
		for (var i = 0; i < num_sprites; ++i) {
			var s = spr_list[i];
		
			var spr    = s[ERousrAtlasSprite.Sprite];
			var img    = s[ERousrAtlasSprite.Image];
			var packed = s[ERousrAtlasSprite.PackedRect];
			var r_min = packed[0];
		
			draw_sprite(spr, img, r_min[0] + sprite_get_xoffset(spr), r_min[1] + sprite_get_yoffset(spr));	
		}
	} else {

		while (array_length(sprites) > 0) {
			var s = array_pop(sprites);
	
			var spr    = s[ERousrAtlasSprite.Sprite];
			var img    = s[ERousrAtlasSprite.Image];
			var packed = s[ERousrAtlasSprite.PackedRect];
			var r_min = packed[0];
		
			draw_sprite(spr, img, r_min[0] + sprite_get_xoffset(spr), r_min[1] + sprite_get_yoffset(spr));	
		}
	}

	surface_reset_target();	
}
__ImguiIg(sr_sprite_atlas_flush)

///@function sr_sprite_atlas_clear(_sprite_atlas)
///@desc clear all the sprites from an atlas
///@param {Array:ERousrSpriteAtlas} _sprite_atlas
///@returns {Array:ERousrSpriteAtlas} _sprite_atlas
///@extensionizer { "docs": false }
function sr_sprite_atlas_clear(_sprite_atlas) {
	var sl = _sprite_atlas[ERousrSpriteAtlas.SpriteList];
	var ss = _sprite_atlas[ERousrSpriteAtlas.SpriteStack];
	var surf = _sprite_atlas[ERousrSpriteAtlas.Surface];
	var pack = _sprite_atlas[ERousrSpriteAtlas.BinPack];

	sr_lazy_bin_clear(pack);

	if (surface_exists(surf))
		surface_free(surf);
	
	_sprite_atlas[@ ERousrSpriteAtlas.Surface] = -1;

	array_resize(sl, 0);
	while (array_length(ss) > 0)
		array_pop(ss);
	
	return _sprite_atlas;
}
__ImguiIg(sr_sprite_atlas_clear)

#endregion
#region sprite cache

enum ERousrSpriteCache {
	SpriteMap = 0,
	SpriteList,
	SpriteStack,
	AtlasList,
	
	Width,
	Height,
	
	Num,
};

enum ERousrCachedSprite {
	ParentAtlas = 0,
	AtlasIndex,
		
	
	SpriteIndex,
	ImageIndex,
	UVs,
	
	Num
}; 

///@function sr_sprite_cache_create([_width=2048], [_height=2048])
///@desc create a new sprite cache
///@param {Real} [_width=2048]
///@param {Real} [_height=2048]
///@returns {Array:ERousrSpriteCache} a sprite cache object
///@extensionizer { "docs": false }
function sr_sprite_cache_create(_width = 2048, _height = 2048) {
	return [
		ds_map_create(),         // SpriteMap
		[ ], // SpriteList
		[ ], // New Sprites this Flush
		[ ], // AtlasList
											     
		_width,                  // Max dimensions
		_height							     // Max dimensions
	];
}
__ImguiIg(sr_sprite_cache_create)

///@function sr_sprite_cache_destroy(_cache)
///@desc clean up a sprite cache
///@param {Array:ERousrSpriteCache} _cache
///@returns {undefined}
///@extensionizer { "docs": false }
function sr_sprite_cache_destroy(_cache) {
	ds_map_destroy(_cache[ERousrSpriteCache.SpriteMap]);
	var atlas_list = _cache[ERousrSpriteCache.AtlasList];
	var num_atlas = array_length(atlas_list);
	for (var i = 0; i < num_atlas; ++i) {
		var atlas = atlas_list[i];
		sr_sprite_atlas_flush(atlas);
	}

	return undefined;
}
__ImguiIg(sr_sprite_cache_destroy)

///@function sr_sprite_cache_push_sprite(_sprite_cache, _sprite, _image_index)
///@desc push a sprite onto the sprite cache, returns an id for the packed sprite
///@param {Array:ERousrSpriteCache} _sprite_cache   sprite cache to pushs sprite to
///@param {Real} _sprite                            `sprite_index` of sprite to cache on the texture
///@param {Real} _image_index                       `image_index` to draw
///@returns {Array:ERousrCachedSprite}
///@extensionizer { "docs": false }
function sr_sprite_cache_push_sprite(_sprite_cache, _sprite, _image_index) {
	var spr_map = _sprite_cache[ERousrSpriteCache.SpriteMap];
	var sl = _sprite_cache[ERousrSpriteCache.SpriteList];
	var ss = _sprite_cache[ERousrSpriteCache.SpriteStack];

	var key        = string(_sprite) + "_" + string(_image_index);
	var in_map = spr_map[? key]
	if (in_map != undefined) {
	  return sl[in_map];
	} 

	var atlas_list = _sprite_cache[ERousrSpriteCache.AtlasList];
	var atlas_index = -1;
	var num_atlases = array_length(atlas_list);
	var sprite_atlas_index = num_atlases - 1;

	if (sprite_atlas_index < 0) {
		array_push(atlas_list, sr_sprite_atlas_create(_sprite_cache[ERousrSpriteCache.Width], _sprite_cache[ERousrSpriteCache.Height]));
		sprite_atlas_index++;
		num_atlases++;
	}

	var atlas   = atlas_list[sprite_atlas_index];
	atlas_index = sr_sprite_atlas_pack(atlas, _sprite, _image_index);
	if (atlas_index < 0) {
		// feed the new one into the stack so it'll auto-add to an atlas
		var cache_sprite = array_create(ERousrCachedSprite.Num);
		array_push(ss, cache_sprite);
	
		cache_sprite[@ ERousrCachedSprite.SpriteIndex] = _sprite;
		cache_sprite[@ ERousrCachedSprite.ImageIndex]  = _image_index;
	
		// atlas was full, clear sprites that haven't been requeued
		for (var i = 0; i < num_atlases; ++i) {
			atlas = atlas_list[i];
			sr_sprite_atlas_clear(atlas);
		}
	
		ds_map_clear(spr_map);
		array_resize(sl, 0);
	
		var new_cache = cache_sprite;
	
		// repack just sprites added since last flush
		var len = array_length(ss);
		var stack = ss;
	
		sprite_atlas_index = 0;
		for (var i = 0; i < len; ++i) {
			cache_sprite = stack[i];
			var spr = cache_sprite[ERousrCachedSprite.SpriteIndex];
			var img = cache_sprite[ERousrCachedSprite.ImageIndex];

			atlas_index = -1
			while (atlas_index == -1) {
				if (sprite_atlas_index >= num_atlases) {
					array_push(atlas_list, sr_sprite_atlas_create(_sprite_cache[ERousrSpriteCache.Width], _sprite_cache[ERousrSpriteCache.Height]));
					num_atlases++;
				}

				var atlas = atlas_list[sprite_atlas_index];
				atlas_index = sr_sprite_atlas_pack(atlas, spr, img);
		
				if (atlas_index == -1) {
					sprite_atlas_index++;
					continue;
				}
		
				var atlas_sprite = sr_sprite_atlas_get(atlas, atlas_index);
				cache_sprite[@ ERousrCachedSprite.ParentAtlas] = sprite_atlas_index;
				cache_sprite[@ ERousrCachedSprite.AtlasIndex]  = atlas_index;
				cache_sprite[@ ERousrCachedSprite.UVs]         = atlas_sprite[ERousrAtlasSprite.UVs];
			}
		}
	
		cache_sprite = new_cache;
	} else {

		var atlas_sprite = sr_sprite_atlas_get(atlas, atlas_index);
		var cache_sprite = array_create(ERousrCachedSprite.Num);

		cache_sprite[@ ERousrCachedSprite.ParentAtlas] = sprite_atlas_index;
		cache_sprite[@ ERousrCachedSprite.SpriteIndex] = _sprite;
		cache_sprite[@ ERousrCachedSprite.ImageIndex]  = _image_index;
		cache_sprite[@ ERousrCachedSprite.AtlasIndex]  = atlas_index;
		cache_sprite[@ ERousrCachedSprite.UVs]         = atlas_sprite[ERousrAtlasSprite.UVs];
	
		array_push(ss, cache_sprite);
	}
 
	return cache_sprite; 
}
__ImguiIg(sr_sprite_cache_push_sprite)

///@function sr_sprite_cache_flush(_cache)
///@desc flush the sprites to a texture
///@param {Array:ERousrLazyBin} _bin   
///@extensionizer { "docs": false }
function sr_sprite_cache_flush(_cache) {
	var atlas_list = _cache[ERousrSpriteCache.AtlasList];
	var num_atlas = array_length(atlas_list);
	for (var i = 0; i < num_atlas; ++i) {
		var atlas = atlas_list[i];
		sr_sprite_atlas_flush(atlas);
	}

	var ss = _cache[ERousrSpriteCache.SpriteStack];
	if (array_length(ss) > 0) {
		var spr_map = _cache[ERousrSpriteCache.SpriteMap];
		var sl = _cache[ERousrSpriteCache.SpriteList];
	
		while (array_length(ss) > 0) {
			var spr = array_pop(ss);
			array_push(sl, spr);

			var _sprite    = spr[ERousrCachedSprite.SpriteIndex];
			var _img       = spr[ERousrCachedSprite.ImageIndex]
			var key        = string(_sprite) + "_" + string(_img);
			spr_map[? key] = array_length(sl) - 1;
		}
	}
}
__ImguiIg(sr_sprite_cache_flush)

///@function sr_sprite_cache_get_uvs(_cache, _packed_id)
///@desc returns uvs (0-1) for each of the four corner
///@extensionizer { "docs": false }
function sr_sprite_cache_get_uvs(_cache, _cached) {
	// todo: most likely will need to use imguigml_quad instead, internally, if i allow packers to flip the rects
	return _cached[ERousrCachedSprite.UVs];
}
__ImguiIg(sr_sprite_cache_get_uvs)

///@function sr_sprite_cache_get_surface(_cache, _cached_sprite)
///@desc get the surface for the cached sprite
///@param {Array:ERousrSpriteCache}  _cache
///@param {Array:ERousrCachedSprite} _cached_sprite
///@extensionizer { "docs": false }
function sr_sprite_cache_get_surface(_cache, _cached) {
	var sprite_atlas = _cached[ERousrCachedSprite.ParentAtlas];
	var atlas_list   = _cache[ERousrSpriteCache.AtlasList];
	sprite_atlas = atlas_list[sprite_atlas];

	return sprite_atlas[ERousrSpriteAtlas.Surface];
}
__ImguiIg(sr_sprite_cache_get_surface)

#endregion
#region lazy bin pack

enum ERousrBinRect {
	Min = 0,
	Max,
	
	Num
};

enum ERousrLazyBin {
	Rects = 0,
	Width,
	Height,
	
	Num
};

///@function sr_lazy_bin_create(_width, _height)
///@desc creaete a lazy bin packer bin
///@param {Real} _width
///@param {Real} _height
///@returns {Array:ERousrLazyBin} _lazy_bin
///@extensionizer { "docs": false }
function sr_lazy_bin_create(_width, _height) {
	return [
		[],
		_width,
		_height
	];
}
__ImguiIg(sr_lazy_bin_create)

///@function sr_lazy_bin_destroy(_bin)
///@desc clean up a lazy bin
///@param {Array:ERousrLazyBin} _bin   bin to destroy
///@returns {undefined} always & forever
///@extensionizer { "docs": false }
function sr_lazy_bin_destroy(_bin) {
	// nothing to do here really
	return undefined;
}
__ImguiIg(sr_lazy_bin_destroy);

///@function sr_lazy_bin_pack(_bin, _width, _height)
///@desc just try to fit a rectangle next to this one, if it fits :confetti:
///@param {Array:ERousrLazyBin} _bin
///@param {Real} _width
///@param {Real} _height
///@returns {Real} _index of packed rect or -1 if can't fit
///@extensionizer { "docs": false }
function sr_lazy_bin_pack(_bin, _width, _height) {
	var rects = _bin[ERousrLazyBin.Rects];
	var bin_width  = _bin[ERousrLazyBin.Width];
	var bin_height = _bin[ERousrLazyBin.Height];

	var num_rects = array_length(rects);

	var x1 = 0, y1 = 0, x2 = _width, y2 = _height;
	var found = true;
	var new_rect = [
		[ x1, y1 ],
		[ x2, y2 ],
	];
	

	// todo: this is dumb actually
	while(found) {
	  found = false;
		for (var rect_index = 0; !found && rect_index < num_rects; ++rect_index) {
			var rect = rects[rect_index];
	
			var r_min = rect[ERousrBinRect.Min],
			    r_max = rect[ERousrBinRect.Max];
	
			found = rectangle_in_rectangle(x1, y1, x2, y2, r_min[0], r_min[1], r_max[0], r_max[1]);
		}
	
		if (found) {
			x1 += _width;
			x2 += _width;
			if (!rectangle_in_rectangle(x1, y2, x2, y2, 0, 0, bin_width-1, bin_height-1)) {
				y1 += _height; y2 += _height;
				x1  = 0;       x2  = _width;
			
	      if (!rectangle_in_rectangle(x1, y2, x2, y2, 0, 0, bin_width-1, bin_height-1)) { // no space availalble 
	         found = false;
	         new_rect = undefined;
	         break;
	      }
			}
 
	    new_rect = [
	      [ x1, y1 ],
	      [ x2, y2 ]
	    ]
	  }
	}

	if (is_array(new_rect)) {
	  array_push(rects, new_rect);
	  return num_rects;
	}
  
	return -1;
}
__ImguiIg(sr_lazy_bin_pack)

///@function sr_lazy_bin_get(_bin, _packed_id)
///@desc return the rect at the id given
///@param {Array:ERousrLazyBin} _bin
///@param {Real} _packed_id
///@returns {Array:ERousrBinRect} 
///@extensionizer { "docs": false }
function sr_lazy_bin_get(_bin, _packed) {
	gml_pragma("forceinline");
	var rects = _bin[ERousrLazyBin.Rects];
	return rects[_packed];
}
__ImguiIg(sr_lazy_bin_get)

///@function sr_lazy_bin_width(_bin)
///@desc return the rect at the id given
///@param {Array:ERousrLazyBin} _bin
///@returns {Real} width of the bin packer [total width, not used width]
///@extensionizer { "docs": false }
function sr_lazy_bin_width(_bin) {
	gml_pragma("forceinline");
	return _bin[ERousrLazyBin.Width];
}
__ImguiIg(sr_lazy_bin_width)

///@function sr_lazy_bin_height(_bin)
///@desc return the rect at the id given
///@param {Array:ERousrLazyBin} _bin
///@returns {Real} height of the bin packer [total height, not used height]
///@extensionizer { "docs": false }
function sr_lazy_bin_height(_bin) {
	gml_pragma("forceinline");
	return _bin[ERousrLazyBin.Height];
}
__ImguiIg(sr_lazy_bin_height)

///@function sr_lazy_bin_clear(_bin_pack)
///@desc clear a lazy bin packer
///@param {Array:ERousrLazyBin} _bin_pack
///@returns {Array:ERousrLazyBin} _bin_pack
///@extensionizer { "docs": false }
function sr_lazy_bin_clear(_bin_pack) {
	array_resize(_bin_pack[ERousrLazyBin.Rects], 0);
	return _bin_pack;
}
__ImguiIg(sr_lazy_bin_clear)

#endregion