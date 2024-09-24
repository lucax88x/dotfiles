;; extends
;; Keywords
(("return"   @keyword) (#set! conceal "󰌑"))
(("func"     @keyword) (#set! conceal "󰊕"))
(("break"    @keyword.return) (#set! conceal  "󱞣"))
(("package"  @keyword) (#set! conceal  ""))
(("struct"   @keyword) (#set! conceal ""))
(("type"     @keyword) (#set! conceal ""))

;; type
(((qualified_type) @type (#eq? @type "testing.T")) (#set! conceal "τ"))
;; identifiers
(((identifier) @type (#eq? @type "err"     )) (#set! conceal "ε"))
