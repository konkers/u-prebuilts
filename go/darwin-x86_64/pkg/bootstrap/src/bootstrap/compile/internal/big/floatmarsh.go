// Do not edit. Bootstrap copy of /Users/konkers/play/u-prebuilts/_build/go/darwin-x86_64/go/src/cmd/compile/internal/big/floatmarsh.go

//line /Users/konkers/play/u-prebuilts/_build/go/darwin-x86_64/go/src/cmd/compile/internal/big/floatmarsh.go:1
// Copyright 2015 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// This file implements encoding/decoding of Floats.

package big

import "fmt"

// MarshalText implements the encoding.TextMarshaler interface.
// Only the Float value is marshaled (in full precision), other
// attributes such as precision or accuracy are ignored.
func (x *Float) MarshalText() (text []byte, err error) {
	if x == nil {
		return []byte("<nil>"), nil
	}
	var buf []byte
	return x.Append(buf, 'g', -1), nil
}

// UnmarshalText implements the encoding.TextUnmarshaler interface.
// The result is rounded per the precision and rounding mode of z.
// If z's precision is 0, it is changed to 64 before rounding takes
// effect.
func (z *Float) UnmarshalText(text []byte) error {
	// TODO(gri): get rid of the []byte/string conversion
	_, _, err := z.Parse(string(text), 0)
	if err != nil {
		err = fmt.Errorf("math/big: cannot unmarshal %q into a *big.Float (%v)", text, err)
	}
	return err
}
