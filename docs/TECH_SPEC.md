# NAVIA -- AI CAREER NAVIGATOR

## TECH SPEC (MINIMAL MVP IMPLEMENTATION)

Version: 1.0

------------------------------------------------------------------------

# 1. CLIENT APPLICATION

## Platform:

- iOS 18+

## Framework:

- SwiftUI

## Architecture:

- MVVM (Model-View-ViewModel)
- NavigationStack routing

------------------------------------------------------------------------

# 2. VIDEO PLAYER

## Technology:

- AVPlayer
- HLS streaming required

## Features:

- playback speed (1x--2x)
- picture-in-picture (PiP)
- resume playback
- autoplay next lesson

------------------------------------------------------------------------

# 3. BACKEND (REST API)

## Authentication

- POST /auth/register
- POST /auth/login
- GET /user/profile

------------------------------------------------------------------------

## Career Paths

- GET /paths
- GET /paths/{id}

------------------------------------------------------------------------

## Lessons

- GET /lessons/{id}

------------------------------------------------------------------------

## Progress

- POST /progress/update
- GET /progress/user

------------------------------------------------------------------------

## Recommendations

- POST /recommendation

Input:

- interest
- experience
- goal
- time availability

Output:

- ranked career paths (top 3)

------------------------------------------------------------------------

## Subscription

- GET /subscription/status
- POST /subscription/verify (Apple receipt)

------------------------------------------------------------------------

# 4. DATA MODELS

## User

- id
- email
- subscription_status

------------------------------------------------------------------------

## CareerPath

- id
- title
- description
- modules\[\]
- duration
- difficulty

------------------------------------------------------------------------

## Module

- id
- title
- lessons\[\]

------------------------------------------------------------------------

## Lesson

- id
- title
- video_url
- duration

------------------------------------------------------------------------

## Progress

- user_id
- path_id
- lesson_id
- completion_percent

------------------------------------------------------------------------

# 5. AI RECOMMENDATION ENGINE (MVP RULE-BASED)

## Input:

- interest
- experience level
- goal
- available time

------------------------------------------------------------------------

## Logic:

1.  Map interest → career cluster
2.  Filter by experience match
3.  Rank by goal alignment
4.  Adjust by time commitment fit

------------------------------------------------------------------------

## Output:

Top 3 ranked Career Paths:

- primary (highest score)
- secondary
- alternative

------------------------------------------------------------------------

# 6. AUTHENTICATION

- Email/password
- Apple Sign-In (required for iOS compliance)

------------------------------------------------------------------------

# 7. PAYMENT SYSTEM

- Apple In-App Purchases (subscription model)

Plan:

- NAVIA All Access (monthly/yearly)

------------------------------------------------------------------------

# 8. ANALYTICS (FIREBASE)

## Events:

- app_install
- onboarding_start
- onboarding_complete
- recommendation_shown
- path_selected
- lesson_started
- lesson_completed
- subscription_started
- subscription_cancelled

------------------------------------------------------------------------

# 9. PERFORMANCE REQUIREMENTS

- video start \< 2 seconds
- smooth playback on 4G
- lesson resume accuracy 100%
- app cold start \< 2.5 seconds

------------------------------------------------------------------------

# 10. NON-FUNCTIONAL REQUIREMENTS

- scalable to 10k+ users MVP stage
- crash-free rate \> 99%
- stable video streaming under load

------------------------------------------------------------------------

END OF TECH SPEC
