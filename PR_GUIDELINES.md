# Pull Request Guidelines

## Overview
This document outlines the standards and best practices for creating pull requests in the DentalFlow project.

## PR Creation Checklist

### Before Creating a PR
- [ ] Code follows the project architecture and conventions
- [ ] All tests pass locally
- [ ] Code has been linted (`npm run lint`)
- [ ] Build completes successfully (`npm run build`)
- [ ] No console errors or warnings
- [ ] TypeScript types are properly defined (no `any` unless justified)
- [ ] Changes are minimal and focused on the issue at hand

### PR Title
Format: `[Type] Brief description`

Types:
- `feat`: New feature
- `fix`: Bug fix
- `refactor`: Code refactoring
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

Examples:
- `[feat] Add patient search functionality`
- `[fix] Resolve appointment calendar timezone issue`
- `[refactor] Improve database query performance`

### PR Description
Include:
1. **What**: What changes were made
2. **Why**: Why these changes were necessary
3. **How**: How the changes were implemented
4. **Testing**: How to test the changes
5. **Screenshots**: If UI changes are involved
6. **Breaking Changes**: Any breaking changes (if applicable)

Template:
```markdown
## Description
Brief description of the changes

## Motivation
Why these changes are needed

## Changes Made
- List of specific changes
- Be detailed but concise

## Testing
1. Steps to test the changes
2. Expected behavior

## Screenshots (if applicable)
Before/After screenshots for UI changes

## Breaking Changes
List any breaking changes and migration steps
```

## Code Quality Standards

### TypeScript
- Always use TypeScript strict mode
- Define proper types/interfaces
- Avoid `any` - use `unknown` if type is truly unknown
- Use type inference where obvious
- Export types that might be reused

### React
- Use functional components with hooks
- Keep components small and focused (< 200 lines)
- Extract complex logic into custom hooks
- Use proper prop types
- Avoid inline functions in JSX when possible

### Styling
- Use Tailwind utility classes
- Follow the DentalFlow UI Kit guidelines
- Maintain responsive design (mobile-first)
- Use CSS variables for theming
- Keep custom CSS minimal

### File Organization
- Place files in appropriate module directories
- Shared code goes in `src/shared/`
- Keep related files together
- Use index files for clean exports

## Review Process

### Self-Review
Before requesting review:
1. Review your own changes line by line
2. Remove debug code and console.logs
3. Check for commented-out code
4. Verify all files are necessary
5. Ensure proper error handling

### Code Review Guidelines
Reviewers should check for:
- **Functionality**: Does it work as intended?
- **Architecture**: Follows project structure?
- **Quality**: Clean, readable code?
- **Security**: No vulnerabilities introduced?
- **Performance**: No unnecessary re-renders or queries?
- **Testing**: Adequate test coverage?

### Addressing Feedback
- Respond to all comments
- Make requested changes or explain why not
- Mark conversations as resolved when addressed
- Request re-review after significant changes

## Testing Requirements

### Unit Tests
- Test utility functions
- Test custom hooks
- Test complex component logic

### Integration Tests
- Test user workflows
- Test API interactions
- Test routing and navigation

### Manual Testing
- Test on different screen sizes
- Test in different browsers
- Test error states
- Test loading states

## Common Issues to Avoid

### ❌ Don't
- Commit `node_modules/` or build artifacts
- Include unrelated changes
- Leave TODO comments without issues
- Use hardcoded values (use environment variables)
- Ignore TypeScript errors
- Skip error handling
- Write overly complex code

### ✅ Do
- Keep PRs focused and small
- Write descriptive commit messages
- Include tests for new features
- Update documentation when needed
- Handle errors gracefully
- Use meaningful variable names
- Add comments for complex logic only

## Git Workflow

### Branch Naming
Format: `type/short-description`

Examples:
- `feat/patient-search`
- `fix/appointment-timezone`
- `refactor/database-queries`

### Commit Messages
Format: `type: description`

Examples:
- `feat: add patient search component`
- `fix: resolve timezone issue in appointments`
- `refactor: optimize database queries`

Keep commits:
- Atomic (one logical change per commit)
- Descriptive
- Present tense

### Merging
- Squash small commits before merging
- Keep main branch history clean
- Delete branch after merge
- Keep PR branch up to date with main

## Security Considerations

### Before Committing
- Never commit secrets or API keys
- Use environment variables for sensitive data
- Review dependencies for vulnerabilities
- Sanitize user inputs
- Validate data on both client and server

### During Review
- Check for SQL injection risks
- Verify authentication/authorization
- Review data validation
- Check for XSS vulnerabilities
- Ensure proper error messages (no sensitive data)

## Performance Considerations

### Client-Side
- Lazy load routes and components
- Optimize images and assets
- Minimize bundle size
- Avoid unnecessary re-renders
- Use pagination for large lists

### Database
- Optimize queries
- Add proper indexes
- Avoid N+1 queries
- Use connection pooling
- Implement caching where appropriate

## Documentation

### When to Update Docs
- Adding new features
- Changing architecture
- Modifying APIs
- Updating environment variables
- Changing deployment process

### Where to Document
- `ARCHITECTURE.md` - Architecture decisions
- `UI_KIT_DENTALFLOW.md` - UI/UX patterns
- `README.md` - Setup and getting started
- Code comments - Complex logic only
- JSDoc - Public APIs and utilities

## Deployment

### Pre-Deployment Checklist
- [ ] All tests pass in CI/CD
- [ ] PR approved by required reviewers
- [ ] No merge conflicts
- [ ] Environment variables documented
- [ ] Migration scripts ready (if needed)
- [ ] Rollback plan in place

### Post-Deployment
- Monitor error rates in Sentry
- Check application logs
- Verify critical paths work
- Monitor performance metrics
- Be available for immediate fixes

## Getting Help

If you need help with:
- **Architecture questions**: Review `ARCHITECTURE.md` or ask in team chat
- **UI/UX patterns**: Check `UI_KIT_DENTALFLOW.md`
- **Technical issues**: Create an issue with detailed description
- **Process questions**: Ask team lead or refer to this document

## Continuous Improvement

These guidelines are living documents. If you find:
- Outdated information
- Missing guidelines
- Better practices

Please submit a PR to update this document!
