// Do not edit. Bootstrap copy of /Users/konkers/play/u-prebuilts/_build/go/darwin-x86_64/go/src/cmd/compile/main.go

//line /Users/konkers/play/u-prebuilts/_build/go/darwin-x86_64/go/src/cmd/compile/main.go:1
// Copyright 2015 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package main

import (
	"bootstrap/compile/internal/amd64"
	"bootstrap/compile/internal/arm"
	"bootstrap/compile/internal/arm64"
	"bootstrap/compile/internal/mips64"
	"bootstrap/compile/internal/ppc64"
	"bootstrap/compile/internal/s390x"
	"bootstrap/compile/internal/x86"
	"bootstrap/internal/obj"
	"fmt"
	"log"
	"os"
)

func main() {
	// disable timestamps for reproducible output
	log.SetFlags(0)
	log.SetPrefix("compile: ")

	switch obj.Getgoarch() {
	default:
		fmt.Fprintf(os.Stderr, "compile: unknown architecture %q\n", obj.Getgoarch())
		os.Exit(2)
	case "386":
		x86.Main()
	case "amd64", "amd64p32":
		amd64.Main()
	case "arm":
		arm.Main()
	case "arm64":
		arm64.Main()
	case "mips64", "mips64le":
		mips64.Main()
	case "ppc64", "ppc64le":
		ppc64.Main()
	case "s390x":
		s390x.Main()
	}
}
