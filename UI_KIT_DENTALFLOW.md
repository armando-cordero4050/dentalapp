# DentalFlow UI Kit

## Overview
DentalFlow uses a combination of TailwindCSS utility classes and shadcn/ui components for a consistent, modern user interface.

## Design System

### Colors
We use CSS variables for theming, allowing easy light/dark mode support:

```css
/* Primary colors */
--primary: 222.2 47.4% 11.2%
--primary-foreground: 210 40% 98%

/* Secondary colors */
--secondary: 210 40% 96.1%
--secondary-foreground: 222.2 47.4% 11.2%

/* Accent colors */
--accent: 210 40% 96.1%
--accent-foreground: 222.2 47.4% 11.2%

/* Destructive (error/danger) */
--destructive: 0 84.2% 60.2%
--destructive-foreground: 210 40% 98%

/* Background and text */
--background: 0 0% 100%
--foreground: 222.2 84% 4.9%

/* Muted (less emphasized content) */
--muted: 210 40% 96.1%
--muted-foreground: 215.4 16.3% 46.9%

/* UI elements */
--border: 214.3 31.8% 91.4%
--input: 214.3 31.8% 91.4%
--ring: 222.2 84% 4.9%
```

### Typography
- **Font Family**: System fonts (system-ui stack)
- **Headings**: Bold, larger sizes (3xl, 2xl, xl, lg)
- **Body**: Regular weight, base size
- **Small Text**: text-sm for secondary information

### Spacing
Following Tailwind's spacing scale:
- `p-2` to `p-6` for padding
- `m-2` to `m-6` for margins
- `gap-2` to `gap-6` for flex/grid gaps

### Border Radius
- **Default**: `rounded-lg` (0.5rem)
- **Cards**: `rounded-lg`
- **Buttons**: `rounded-lg`
- **Small elements**: `rounded-md`

## Layout Components

### AppShell
The main application layout providing structure:
- **Sidebar**: Fixed 64px width, left-aligned
- **Topbar**: 16px height, full width
- **Content Area**: Flexible, scrollable, with padding

```tsx
<AppShell>
  <YourPageContent />
</AppShell>
```

### Sidebar
Navigation component with:
- Brand logo and title at top
- Navigation menu items with icons
- Active state highlighting
- Version info at bottom

### Topbar
Top navigation bar with:
- Page title/breadcrumbs
- Notification icon
- User menu

## Common Patterns

### Cards
```tsx
<div className="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
  <h3 className="text-lg font-semibold mb-2">Card Title</h3>
  <p className="text-muted-foreground">Card content</p>
</div>
```

### Buttons
```tsx
{/* Primary button */}
<button className="px-4 py-2 bg-primary text-primary-foreground rounded-lg hover:bg-primary/90">
  Action
</button>

{/* Secondary button */}
<button className="px-4 py-2 bg-secondary text-secondary-foreground rounded-lg hover:bg-secondary/80">
  Secondary
</button>

{/* Icon button */}
<button className="p-2 hover:bg-gray-100 rounded-lg">
  <Icon className="w-5 h-5" />
</button>
```

### Forms
```tsx
<div className="space-y-4">
  <div>
    <label className="block text-sm font-medium mb-1">Label</label>
    <input 
      type="text" 
      className="w-full px-3 py-2 border border-input rounded-lg focus:ring-2 focus:ring-ring"
    />
  </div>
</div>
```

### Grid Layouts
```tsx
{/* Responsive grid */}
<div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
  {items.map(item => <Card key={item.id} {...item} />)}
</div>
```

## shadcn/ui Integration

### Setup
shadcn/ui components are based on Radix UI primitives and styled with Tailwind.

**Utility function** (already included):
```typescript
// src/shared/lib/utils.ts
import { clsx } from "clsx"
import { twMerge } from "tailwind-merge"

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}
```

### Adding shadcn/ui Components
To add individual components from shadcn/ui:

```bash
npx shadcn@latest add button
npx shadcn@latest add input
npx shadcn@latest add card
npx shadcn@latest add dialog
# etc.
```

Components will be added to `src/components/ui/` and can be imported:

```tsx
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
```

### Recommended Components to Add
- **Button**: Primary UI action component
- **Input**: Form input fields
- **Card**: Content containers
- **Dialog**: Modal windows
- **Select**: Dropdown selections
- **Table**: Data tables
- **Toast**: Notifications
- **Avatar**: User avatars
- **Badge**: Status indicators

## Icons
Using **Lucide React** for icons:

```tsx
import { Home, Calendar, User, Settings } from 'lucide-react'

<Home className="w-5 h-5" />
```

Common sizes:
- `w-4 h-4` - Small icons
- `w-5 h-5` - Regular icons
- `w-6 h-6` - Larger icons

## Responsive Design

### Breakpoints
```
sm: 640px   - Small devices
md: 768px   - Medium devices (tablets)
lg: 1024px  - Large devices (desktops)
xl: 1280px  - Extra large devices
2xl: 1536px - Ultra-wide screens
```

### Mobile-First Approach
```tsx
{/* Stack on mobile, grid on larger screens */}
<div className="flex flex-col md:flex-row gap-4">
  <div>Column 1</div>
  <div>Column 2</div>
</div>
```

## Accessibility

### Best Practices
- Use semantic HTML elements
- Provide `alt` text for images
- Include ARIA labels for icon-only buttons
- Ensure sufficient color contrast
- Support keyboard navigation
- Add focus states to interactive elements

### Example
```tsx
<button 
  aria-label="Close dialog"
  className="p-2 hover:bg-gray-100 rounded-lg focus:ring-2 focus:ring-ring"
>
  <X className="w-4 h-4" />
</button>
```

## Dark Mode
The color system is ready for dark mode. To implement:

1. Add dark mode toggle
2. Add `dark` class to root element
3. Colors will automatically switch based on CSS variables

## Performance
- Use `className` instead of inline styles
- Leverage Tailwind's JIT mode for smaller bundle
- Lazy load heavy components with `React.lazy()`
- Optimize images and assets

## Resources
- [TailwindCSS Documentation](https://tailwindcss.com/docs)
- [shadcn/ui Documentation](https://ui.shadcn.com)
- [Lucide Icons](https://lucide.dev)
- [Radix UI Primitives](https://www.radix-ui.com)
