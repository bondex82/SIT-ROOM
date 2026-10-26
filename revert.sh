#!/bin/bash

# Restore index.css
cat << 'CSS_EOF' > src/index.css
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Outfit:wght@400;500;600;700;800;900&family=JetBrains+Mono:wght@400;500;700&display=swap');
@import "tailwindcss";
@theme {
  --font-sans: "Inter", ui-sans-serif, system-ui, sans-serif;
  --font-display: "Outfit", sans-serif;
  --font-mono: "JetBrains Mono", ui-monospace, SFMono-Regular, monospace;
  --color-brand-green: #008751;
  --color-brand-yellow: #facc15;
  --color-brand-blue: #0f172a;
  --color-brand-white: #ffffff;
  --color-paper: #f8fafc;
  --color-ink: #0f172a;
  --color-muted: #64748b;
  --color-slate-950: #020617;
}
body {
  font-family: var(--font-sans);
  background-color: var(--color-paper);
  color: var(--color-ink);
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
.font-display {
  font-family: var(--font-display);
}
.font-mono {
  font-family: var(--font-mono);
}
/* Custom scrollbar for technical feel */
::-webkit-scrollbar {
  width: 6px;
  height: 6px;
}
::-webkit-scrollbar-track {
  background: transparent;
}
::-webkit-scrollbar-thumb {
  background: #cbd5e1;
  border-radius: 10px;
}
::-webkit-scrollbar-thumb:hover {
  background: #94a3b8;
}
@media print {
  body {
    background: white !important;
    -webkit-print-color-adjust: exact;
    print-color-adjust: exact;
  }
    .print-no-break {
    break-inside: avoid;
    page-break-inside: avoid;
  }
  @page {
    margin: 1.5cm;
    size: auto;
  }
  /* Ensure charts and tables are visible */
  canvas, svg {
    max-width: 100% !important;
    height: auto !important;
  }
}
CSS_EOF

# Find all TSX files
find src/pages -name "*.tsx" -type f | while read file; do
    echo "Processing $file"
    
    # Neutral Colors (zinc -> slate)
    sed -i 's/zinc-/slate-/g' "$file"
    
    # Shadows and borders (we added border border-slate-200 and border-slate-100 sometimes)
    sed -i 's/shadow-md/shadow-2xl/g' "$file"
    sed -i 's/shadow-sm/shadow-xl/g' "$file"
    sed -i 's/ border border-slate-200//g' "$file"
    
    # Colors
    sed -i 's/indigo-600/emerald-600/g' "$file"
    sed -i 's/indigo-50/emerald-50/g' "$file"
    sed -i 's/indigo-100/emerald-100/g' "$file"
    sed -i 's/indigo-200/emerald-200/g' "$file"
    sed -i 's/indigo-400/emerald-400/g' "$file"
    sed -i 's/indigo-700/emerald-700/g' "$file"
    sed -i 's/text-indigo-/text-emerald-/g' "$file"
    sed -i 's/bg-indigo-/bg-emerald-/g' "$file"
    sed -i 's/border-indigo-/border-emerald-/g' "$file"
    
    # Border Radius (restore)
    sed -i 's/rounded-md/rounded-xl/g' "$file"
    sed -i 's/rounded-lg/rounded-2xl/g' "$file"
    sed -i 's/rounded-xl/rounded-3xl/g' "$file"
    
    # Typography tweaks
    sed -i 's/font-bold/font-black/g' "$file"
    sed -i 's/tracking-wide/tracking-widest/g' "$file"
    sed -i 's/tracking-wider/tracking-\[0.2em\]/g' "$file"
    
    # Brand colors
    sed -i 's/amber-500/brand-yellow/g' "$file"
done

# Fix text-emerald-600 for SITUATION ROOM which was text-brand-green originally
sed -i 's/<span className="text-emerald-600">SITUATION ROOM/<span className="text-brand-yellow">SITUATION ROOM/g' src/pages/Dashboard.tsx
sed -i 's/<span className="text-emerald-600">PJN 2027/<span className="text-brand-green">PJN 2027/g' src/pages/Dashboard.tsx
sed -i 's/<span className="text-emerald-600">SITUATION ROOM/<span className="text-brand-yellow">SITUATION ROOM/g' src/pages/Login.tsx
sed -i 's/<span className="text-emerald-600">PJN 2027/<span className="text-brand-green">PJN 2027/g' src/pages/Login.tsx
sed -i 's/<span className="text-emerald-600">SITUATION ROOM/<span className="text-brand-yellow">SITUATION ROOM/g' src/pages/AdminPanel.tsx
sed -i 's/<span className="text-emerald-600">PJN 2027/<span className="text-brand-green">PJN 2027/g' src/pages/AdminPanel.tsx
sed -i 's/<span className="text-emerald-600">SITUATION ROOM/<span className="text-brand-yellow">SITUATION ROOM/g' src/pages/AgentPanel.tsx
sed -i 's/<span className="text-emerald-600">PJN 2027/<span className="text-brand-green">PJN 2027/g' src/pages/AgentPanel.tsx
sed -i 's/<span className="text-emerald-600">SITUATION ROOM/<span className="text-brand-yellow">SITUATION ROOM/g' src/pages/LiveResults.tsx
sed -i 's/<span className="text-emerald-600">PJN 2027/<span className="text-brand-green">PJN 2027/g' src/pages/LiveResults.tsx

echo "Done reverting."
