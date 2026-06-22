function Vector2(_x = 0, _y = 0) constructor {
	x = _x
	y = _y
	
    //Return void
	static set = function(_x, _y) {
		x = _x
		y = _y
	}
	
	static add = function(_vector2) {
		x += _vector2.x
		y += _vector2.y
	}
	
	static subtract = function(_vector2) {
		x -= _vector2.x
		y -= _vector2.y
	}
	
	static scale = function(_scalar) {
		x *= _scalar
		y *= _scalar
	}
	
	static scale_inverse = function(_scalar) {
		if (_scalar != 0) {
			x /= _scalar
			y /= _scalar
		}
	}
    
    static normalize = function() {
        var _magnitude = get_magnitude()
        scale_inverse(_magnitude)
    }
    
    static clamp = function(_min_vec2, _max_vec2) {
		x = clamp(x, _min_vec2.x, _max_vec2.x)
		y = clamp(y, _min_vec2.y, _max_vec2.y)
	}
    
    static clamp_fixed = function(_value) {
		x = clamp(x, -_value, _value)
		y = clamp(y, -_value, _value)
	}
	
	static approach = function(_vector2, _amount) {
		x = lerp(x, _vector2.x, _amount)
		y = lerp(y, _vector2.y, _amount)
    }
    
    //Return real
    static get_magnitude = function() {
        return sqrt(sqr(x) + sqr(y))
    }
    
    static get_dot_product = function(_vector2) {
        return x * _vector2.x + y * _vector2.y
    }
    
    static get_component = function(_vector2) {
        var _alpha = arctan2(_vector2.y, x)
       	var _theta = arctan2(y, x)
       	var _m = get_magnitude()
       	var _a = _m * cos(_theta - _alpha)
       	return _a
    }
    
    //Return vec2
    static from_angle = function(_radians) {
        return new Vector2(cos(_radians), sin(_radians))
    }
    
    static get_normalized = function() {
        return copy().normalize()
    }
    
    static get_component_vector = function(_vector2) {
        var _v = _vector2.get_normalized()
       	var _c = get_component(_vector2)
       	_v.scale(_c)
       	return _v
    }
    
    static copy = function() {
		return new Vector2(x, y)
	}
    
    
    //Conversions
    static to_angle = function(_radians = true) {
        var _angle = arctan2(y, x)
        if (!_radians)
            _angle = radtodeg(_angle)
        return _angle
    }
	
	static to_string = function() {
		return $"({x}, {y})"
	}
}
