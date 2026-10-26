#!/bin/bash

# Find all TSX files in src/pages and src/components
find src/pages -name "*.tsx" -type f | while read file; do
    echo "Processing $file"
    
    # Colors
    sed -i 's/emerald-500/indigo-600/g' "$file"
    sed -i 's/emerald-600/indigo-600/g' "$file"
    sed -i 's/emerald-50/indigo-50/g' "$file"
    sed -i 's/emerald-100/indigo-100/g' "$file"
    sed -i 's/emerald-200/indigo-200/g' "$file"
    sed -i 's/emerald-400/indigo-400/g' "$file"
    sed -i 's/emerald-700/indigo-700/g' "$file"
    sed -i 's/text-emerald-/text-indigo-/g' "$file"
    sed -i 's/bg-emerald-/bg-indigo-/g' "$file"
    sed -i 's/border-emerald-/border-indigo-/g' "$file"
    
    # Neutral Colors (slate -> zinc for a more modern grayscale)
    sed -i 's/slate-/zinc-/g' "$file"
    
    # Border Radius (make it sharper, more enterprise)
    sed -i 's/rounded-3xl/rounded-xl/g' "$file"
    sed -i 's/rounded-2xl/rounded-lg/g' "$file"
    sed -i 's/rounded-xl/rounded-md/g' "$file"
    
    # Shadows (flatten them out)
    sed -i 's/shadow-2xl/shadow-md border border-zinc-200/g' "$file"
    sed -i 's/shadow-xl/shadow-sm border border-zinc-200/g' "$file"
    sed -i 's/shadow-lg/shadow-sm border border-zinc-200/g' "$file"
    
    # Backgrounds
    sed -i 's/bg-white/bg-white/g' "$file"
    
    # Typography tweaks
    sed -i 's/font-black/font-bold/g' "$file"
    sed -i 's/tracking-widest/tracking-wide/g' "$file"
    sed -i 's/tracking-[0.2em]/tracking-wider/g' "$file"
done
echo "Done redesigning."
