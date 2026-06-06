# NAVIA -- AI CAREER NAVIGATOR

## PRODUCT REQUIREMENTS DOCUMENT (PRD)

**Version:** 1.0\
**Platform:** iOS\
**Type:** Subscription AI Career Learning App\
**Stage:** MVP

------------------------------------------------------------------------

# 1. PRODUCT VISION

NAVIA --- це AI-навігатор кар'єри в IT, який допомагає користувачу
обрати правильний напрям, отримати персональний план навчання та пройти
шлях до професії через відео-уроки.

NAVIA не є LMS або бібліотекою курсів.

NAVIA є AI системою навігації кар'єри.

------------------------------------------------------------------------

# 2. PRODUCT POSITIONING

## NAVIA НЕ Є:

- LMS платформою
- курс-маркетплейсом
- відео-бібліотекою

## NAVIA Є:

- AI Career Navigation System
- персональний кар'єрний гід
- subscription-based learning platform

------------------------------------------------------------------------

# 3. CORE VALUE PROPOSITION

Користувач отримує:

- персональний AI-рекомендований кар'єрний шлях
- структуровані career paths
- відео-навчання у форматі підписки
- зрозумілий прогрес до професії

------------------------------------------------------------------------

# 4. BUSINESS GOALS

## Primary Goal

Збільшення платних підписок NAVIA

## Secondary Goals

- підвищення retention (D7 / D30)
- збільшення watch time
- зменшення choice paralysis
- підвищення completion rate
- формування AI-first UX

------------------------------------------------------------------------

# 5. SUCCESS METRICS

## Activation Rate

≥ 60% користувачів починають перший урок

## D7 Retention

≥ 45--50%

## D30 Retention

≥ 30%

## Weekly Watch Time

≥ 60--90 хв

## Path Engagement

≥ 70% користувачів взаємодіють з career paths

------------------------------------------------------------------------

# 6. TARGET AUDIENCE

## Career Switchers

25--45 років, змінюють професію

## Beginners

18--30 років, шукають першу IT-роль

## Junior Specialists

Хочуть змінити або покращити напрям

------------------------------------------------------------------------

# 7. PRODUCT MODEL

## Основна сутність: CAREER PATH

Career Path = структурований шлях до IT-професії

### Приклади:

- Frontend Developer
- QA Engineer
- Python Developer
- DevOps Engineer
- Cybersecurity Specialist
- Data Analyst
- Flutter Developer
- Swift iOS Developer
- IT Project Manager
- Business Analyst
- Vibe Coding (AI-assisted dev)

------------------------------------------------------------------------

# 8. MVP SCOPE

## P0 (Must Have)

- Authentication
- Subscription gating
- AI onboarding questionnaire
- Career path recommendations
- Career paths library (11 paths)
- Video player (HLS)
- Progress tracking
- Continue learning
- Home personalization
- Basic search

------------------------------------------------------------------------

## P1 (Post-launch)

- Favorites
- Watch later
- Push notifications
- Offline downloads
- Streak system

------------------------------------------------------------------------

## P2 (Future AI Layer)

- AI mentor chat
- adaptive learning paths
- AI career coach
- job recommendations

------------------------------------------------------------------------

# 9. ONBOARDING FLOW

## Goal:

User gets first recommendation in \< 60 seconds

------------------------------------------------------------------------

### STEP 1: INTEREST

- Development
- Data / AI
- Design
- Testing
- Security
- Management

------------------------------------------------------------------------

### STEP 2: EXPERIENCE

- Beginner
- Basic knowledge
- Working in IT

------------------------------------------------------------------------

### STEP 3: GOAL

- Change career
- Get first job
- Increase income
- Learn new skill

------------------------------------------------------------------------

### STEP 4: TIME

- 15 min/day
- 30 min/day
- 1 hour/day
- 2+ hours/day

------------------------------------------------------------------------

## OUTPUT

### "Your AI Career Plan"

Recommended:

- Frontend Developer (Primary)
- QA Engineer (Alternative)
- Python Developer (Secondary)

CTA: Start Learning

------------------------------------------------------------------------

# 10. INFORMATION ARCHITECTURE

## TAB BAR

- Home
- Explore
- Search
- Profile

------------------------------------------------------------------------

# 11. HOME SCREEN

## Section 1: Continue Learning

- last lesson
- progress bar
- resume button

## Section 2: Your AI Career Path

Single recommended path only

## Section 3: Recommended Paths

2--3 alternatives

## Section 4: Explore Paths

All 11 career paths

------------------------------------------------------------------------

# 12. EXPLORE SCREEN

Displays Career Paths only.

Each card:

- title
- outcome
- difficulty
- duration

------------------------------------------------------------------------

# 13. CAREER PATH SCREEN

Each path includes:

- overview
- expected outcome
- modules
- lessons
- progress %
- start/continue button

------------------------------------------------------------------------

# 14. LESSON SCREEN

## Video Player Features:

- HLS streaming
- playback speed (1x--2x)
- autoplay next lesson
- PiP support
- resume playback

## UI:

- lesson title
- module name
- progress indicator
- next lesson suggestion

------------------------------------------------------------------------

# 15. PROGRESS SYSTEM

Tracks:

- completed lessons
- path progress %
- last watched lesson
- continue pointer

------------------------------------------------------------------------

# 16. SEARCH

Search across:

- career paths
- modules
- lessons

------------------------------------------------------------------------

# 17. SUBSCRIPTION MODEL

Single plan: NAVIA All Access

Includes:

- all career paths
- all video content
- future updates

------------------------------------------------------------------------

# 18. ANALYTICS EVENTS

## Acquisition

- app_install
- onboarding_start
- onboarding_complete

## Activation

- recommendation_viewed
- path_selected
- lesson_started

## Engagement

- lesson_completed
- continue_learning_clicked

## Revenue

- subscription_started
- subscription_renewed
- subscription_cancelled

------------------------------------------------------------------------

# 19. PUSH NOTIFICATIONS

- "Your next lesson is waiting"
- "Continue your Frontend path"
- "You are 40% through QA Engineer path"

------------------------------------------------------------------------

# 20. TECH STACK

## iOS

- SwiftUI
- iOS 18+

## Architecture

- MVVM

## Video

- AVPlayer + HLS

## Backend

- REST API

## Auth

- Email/password
- Apple Sign-In

## Analytics

- Firebase Analytics

## Crash reporting

- Firebase Crashlytics

------------------------------------------------------------------------

# 21. NON-NEGOTIABLE RULES

- No course catalog-first UX
- No equal-weight list of options on Home
- Always prioritize 1 AI-recommended path
- Product must feel guided, not browsable

------------------------------------------------------------------------

# 22. MVP SUCCESS CRITERIA

- recommendation in \< 60 sec
- first lesson started in first session
- D7 retention ≥ 45%
- subscription conversion measurable

------------------------------------------------------------------------

# 23. PRODUCT PRINCIPLE

NAVIA does not show content.

NAVIA shows direction.

------------------------------------------------------------------------
