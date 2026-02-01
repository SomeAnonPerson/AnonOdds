<!--
AnonOdds - The First Anonymous SportsBook
Copyright (c) 2026 AnonOdds
Created by: Skotos (Creator/Owner/Admin)
All Rights Reserved.
-->

# ![AnonOdds - The First Anonymous SportsBook](logo.png)

[![GitHub stars](https://img.shields.io/github/stars/SomeAnonPerson/AnonOdds.svg)](https://github.com/SomeAnonPerson/AnonOdds/stargazers) [![GitHub license](https://img.shields.io/github/license/SomeAnonPerson/AnonOdds.svg)](https://raw.githubusercontent.com/SomeAnonPerson/AnonOdds/LICENSE)

> ### AnonOdds - The First Anonymous SportsBook built with Laravel 12.47.0
> 
> A revolutionary anonymous sportsbook platform featuring secure betting, user authentication, advanced patterns, and a pure HTML/CSS interface with zero JavaScript dependencies.

This repository contains a proprietary anonymous sportsbook application built with modern Laravel architecture and privacy-first design principles.

**Key Features:**
- 🎯 Pure HTML/CSS Interface (Zero JavaScript)
- 🔒 Privacy-Focused Architecture
- 🏈 Complete Sportsbook Functionality
- 🎲 Secure Betting System
- 👤 Advanced User Authentication
- 📊 Real-time Odds Management
- 🌐 Anonymous Access & Operations

----------

# About AnonOdds

AnonOdds is a proprietary platform designed to provide the most secure and anonymous sports betting experience available. Built on Laravel 12.47.0, our platform eliminates JavaScript entirely, using pure HTML/CSS for enhanced security and privacy.

## Architecture

AnonOdds is built on Laravel 12.47.0 with the following architectural decisions:

- **Pure HTML/CSS UI**: No JavaScript dependencies for enhanced security and privacy
- **Bootstrap Architecture**: Middleware configuration moved to `bootstrap/app.php` (Kernel.php removed)
- **Modern Laravel Structure**: Utilizes Laravel 12.47.0 best practices and patterns
- **Server-Side Rendering**: All operations performed server-side for maximum security

## Technology Stack

- **Framework**: Laravel 12.47.0
- **PHP**: 8.2+
- **Database**: MySQL 8.0+ / PostgreSQL 13+
- **Frontend**: Pure HTML/CSS (Zero JavaScript)
- **Security**: Advanced encryption and anonymization protocols

----------

# Code Overview

## Folder Structure

- `app/Models` - Contains all the Eloquent models (Users, Bets, Odds, Events, etc.)
- `app/Http/Controllers` - Contains all the application controllers
- `app/Http/Middleware` - Contains authentication and security middleware
- `app/Http/Requests` - Contains all the form requests and validation
- `bootstrap/app.php` - Application bootstrap and middleware configuration (replaces Kernel.php)
- `app/Services/Betting` - Contains the betting logic and odds calculation
- `app/Services/Filters` - Contains the query filters for filtering requests
- `app/Services/Transformers` - Contains all the data transformers
- `config` - Contains all the application configuration files
- `database/factories` - Contains the model factories for all models
- `database/migrations` - Contains all the database migrations
- `database/seeders` - Contains the database seeders
- `routes` - Contains all the routes defined in web.php and api.php
- `resources/views` - Contains all Blade templates (Pure HTML/CSS)
- `tests` - Contains all the application tests
- `tests/Feature` - Contains all the feature tests

## Dependencies

- [laravel-cors](https://github.com/barryvdh/laravel-cors) - For handling Cross-Origin Resource Sharing (CORS)
- Laravel 12.47.0 Framework Components

----------

# Security & Privacy

AnonOdds is built with privacy and security as top priorities:

- ✅ Pure HTML/CSS architecture eliminates JavaScript-based tracking vectors
- ✅ No client-side scripting reduces attack surface
- ✅ Server-side rendering for all functionality
- ✅ Built for anonymous deployment with Tor compatibility
- ✅ Advanced encryption for all sensitive data
- ✅ Zero-knowledge architecture for user privacy

----------

# Contributing & Community

We welcome community participation within the bounds of our proprietary license:

✅ **You MAY:**
- View the source code
- Submit issues and bug reports
- Suggest features and improvements
- Participate in discussions

❌ **You MAY NOT:**
- Make modifications without prior written authorization from Skotos
- Redistribute or fork this code
- Use this code in derivative works
- Deploy your own instance without licensing

Please read our [LICENSE.md](LICENSE.md) for complete terms and conditions.

To submit issues or suggestions, please use our issue tracker or contact us through secure channels.

----------

# License

This project is proprietary software owned by AnonOdds and Skotos. All rights reserved.

For complete licensing terms, see [LICENSE.md](LICENSE.md).

For licensing inquiries, contact: Skotos via secure channels.

----------

# Support

For support and questions, please contact the AnonOdds team through secure channels.

**Created by Skotos - The First Anonymous SportsBook**

----------

# Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history and updates.

----------

**AnonOdds** - Revolutionizing anonymous sports betting since 2026.

---

© 2026 AnonOdds. Created by Skotos. All Rights Reserved.
