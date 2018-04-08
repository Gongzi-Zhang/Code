" Vim universal .tex syntax file
" Language:	tex
" Last change:	28 Mar 2018
"
" Todo:		
"
"
if !has("conceal")
    finish
endif

" greek letters
syn match texGreek  /\\alpha/	conceal cchar=α
syn match texGreek  /\\beta/	conceal cchar=β
syn match texGreek  /\\gamma/	conceal cchar=γ
syn match texGreek  /\\delta/	conceal cchar=δ
syn match texGreek  /\\epsilon/	conceal cchar=ε
syn match texGreek  /\\zeta/	conceal cchar=ζ
syn match texGreek  /\\eta/	conceal cchar=η
syn match texGreek  /\\theta/	conceal cchar=θ
syn match texGreek  /\\kappa/	conceal cchar=κ
syn match texGreek  /\\lambda/	conceal cchar=λ
syn match texGreek  /\\mu/	conceal cchar=μ
syn match texGreek  /\\nu/	conceal cchar=ν
syn match texGreek  /\\xi/	conceal cchar=ξ
syn match texGreek  /\\pi/	conceal cchar=π
syn match texGreek  /\\rho/	conceal cchar=ρ
syn match texGreek  /\\sigma/	conceal cchar=σ
syn match texGreek  /\\tau/	conceal cchar=τ
syn match texGreek  /\\upsilon/	conceal cchar=υ
syn match texGreek  /\\phi/	conceal cchar=φ
syn match texGreek  /\\chi/	conceal cchar=χ
syn match texGreek  /\\psi/	conceal cchar=ψ
syn match texGreek  /\\omega/	conceal cchar=ω
" Capital Greek Letters
syn match texGreek  /\\Gamma/	conceal cchar=Γ
syn match texGreek  /\\Delta/	conceal cchar=Δ
syn match texGreek  /\\Theta/	conceal cchar=Θ
syn match texGreek  /\\Lambda/	conceal cchar=Λ
syn match texGreek  /\\Xi/	conceal cchar=Ξ
syn match texGreek  /\\Pi/	conceal cchar=Π
syn match texGreek  /\\Sigma/	conceal cchar=Σ
syn match texGreek  /\\Upsilon/	conceal cchar=Υ
syn match texGreek  /\\Phi/	conceal cchar=Φ
syn match texGreek  /\\Psi/	conceal cchar=Ψ
syn match texGreek  /\\Omega/	conceal cchar=Ω
" Operators
syn match texOperator /\\partial/ conceal cchar=∂

hi! def link Conceal Ignore
setlocal concealcursor=c conceallevel=2
