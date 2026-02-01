<!--
AnonOdds - The First Anonymous SportsBook
Copyright (c) 2026 AnonOdds
Created by: Skotos (Creator/Owner/Admin)
All Rights Reserved.
-->

# ![AnonOdds - The First Anonymous SportsBook](logo.png)

[![GitHub stars](https://img.shields.io/github/stars/SomeAnonPerson/AnonOdds.svg)](https://github.com/SomeAnonPerson/AnonOdds/stargazers) [![GitHub license](https://img.shields.io/github/license/SomeAnonPerson/AnonOdds.svg)](https://raw.githubusercontent.com/SomeAnonPerson/AnonOdds/refs/heads/Beta/LICENSE.MD)

## A Complete Anonymous Sports Betting Platform

> ### AnonOdds: The First Anonymous SportsBook
>
> A revolutionary anonymous sportsbook ecosystem featuring multiple platforms built with privacy-first design principles and advanced security architecture.

**AnonOdds** is a proprietary, multi-platform anonymous sports betting system. This repository serves as the main hub containing all core components of the AnonOdds ecosystem.

---

## 📁 Repository Structure

This repository contains three essential components of the AnonOdds platform:

### 🌐 **Website** - Laravel Backend & Web Platform
The main web application and API backend for AnonOdds, built with Laravel 12.47.0.

**Features:**
- Pure HTML/CSS interface (Zero JavaScript)
- RESTful API for mobile and web clients
- User authentication and account management
- Betting engine and odds management
- Transaction processing and settlement
- Admin panel for operators

**Location:** `./Website`  
**Framework:** Laravel 12.47.0  
**Technology Stack:** PHP 8.2+, MySQL/PostgreSQL, Pure HTML/CSS

**Key Characteristics:**
- Server-side rendering for maximum security
- Bootstrap architecture with `bootstrap/app.php` middleware configuration
- Completely JavaScript-free frontend
- Advanced encryption for sensitive data
- Tor-compatible deployment architecture

---

### 📱 **AndroidApp** - Mobile Application
The native Android application providing users with mobile access to AnonOdds betting platform.

**Features:**
- Native Android UI/UX
- Secure authentication integration
- Real-time odds and bet placement
- Account management and balance tracking
- Withdrawal and deposit functions
- Push notifications for significant events
- Offline functionality support

**Location:** `./AndroidApp`  
**Platform:** Android (Native)  
**Minimum API Level:** Android 9.0+  
**Language:** Kotlin/Java

**Key Characteristics:**
- Direct API communication with Website backend
- End-to-end encryption for sensitive communications
- Anonymous user support
- Privacy-focused data handling
- Minimal permissions requirements

---

### 📚 **AnonOddsDocumentation** - Comprehensive Documentation
Complete documentation for developers, operators, and users of the AnonOdds platform.

**Contains:**
- Architecture and design documentation
- API endpoint specifications
- Database schema and relationships
- Deployment guides
- Security policies and protocols
- User guides and tutorials
- Developer quick-start guides
- Configuration reference
- Troubleshooting and FAQs
- Legal and compliance information

**Location:** `./AnonOddsDocumentation`  
**Format:** Markdown, diagrams, and reference guides

**Key Topics:**
- System architecture overview
- Installation and setup instructions (for authorized parties)
- API documentation
- Security best practices
- Privacy and anonymity features
- Operational procedures

---

## 🏗️ System Architecture

```
AnonOdds Ecosystem
├── Website (Laravel 12.47.0)
│   ├── Frontend (Pure HTML/CSS)
│   ├── Backend API
│   ├── Authentication System
│   ├── Betting Engine
│   └── Admin Dashboard
│
├── AndroidApp (Native Android)
│   ├── User Interface
│   ├── API Client
│   ├── Secure Storage
│   └── Synchronization
│
└── AnonOddsDocumentation
    ├── System Architecture
    ├── API Specifications
    ├── Deployment Guides
    ├── Security Policies
    └── User Documentation
```

---

## 🔐 Security & Privacy

AnonOdds is built with security and anonymity as fundamental principles:

- ✅ Pure HTML/CSS architecture eliminates JavaScript attack vectors
- ✅ Server-side processing for all sensitive operations
- ✅ End-to-end encryption for mobile-to-backend communications
- ✅ Advanced anonymization protocols
- ✅ Zero-knowledge architecture where applicable
- ✅ Tor-compatible infrastructure
- ✅ Regular security audits and updates
- ✅ Compliance with privacy regulations

---

## 📋 Getting Started with AnonOdds

### For Users
Access the AnonOdds platform through:
- **Web Interface**: Visit the AnonOdds website
- **Mobile**: Download and install the AnonOdds Android application

### For Developers
To understand the codebase and architecture:

1. **Review Documentation**
   ```
   Read: ./AnonOddsDocumentation/
   ```

2. **Explore Backend Code**
   ```
   Navigate to: ./Website/
   Reference: ./Website/README.md
   ```

3. **Review Mobile Implementation**
   ```
   Navigate to: ./AndroidApp/
   Reference: ./AndroidApp/README.md
   ```

### For Operators & Administrators
For deployment, configuration, and operational information:

1. **Deployment Guide**
   ```
   See: ./AnonOddsDocumentation/deployment/
   ```

2. **Configuration Reference**
   ```
   See: ./AnonOddsDocumentation/configuration/
   ```

3. **Operational Procedures**
   ```
   See: ./AnonOddsDocumentation/operations/
   ```

---

## 📖 Documentation

Comprehensive documentation is available in each component:

| Component | README | Documentation |
|-----------|--------|----------------|
| **Website** | `./Website/README.md` | `./AnonOddsDocumentation/website/` |
| **AndroidApp** | `./AndroidApp/README.md` | `./AnonOddsDocumentation/mobile/` |
| **Full Docs** | N/A | `./AnonOddsDocumentation/` |

---

## 📊 Technology Overview

### Backend Stack
- **Framework**: Laravel 12.47.0
- **Language**: PHP 8.2+
- **Database**: MySQL 8.0+ or PostgreSQL 13+
- **Frontend**: Pure HTML/CSS (No JavaScript)
- **API**: RESTful with JSON responses

### Mobile Stack
- **Platform**: Android (Native)
- **Language**: Kotlin/Java
- **Minimum API**: Android 9.0+
- **Architecture**: MVVM with modern Android best practices

### Infrastructure
- **Deployment**: Docker containers recommended
- **Web Server**: Nginx/Apache with PHP-FPM
- **Database**: MySQL or PostgreSQL
- **Caching**: Redis (optional)
- **Reverse Proxy**: Tor-compatible nginx configuration

---

## 🔄 Component Interaction

```
User
├── Web Browser → Website (Laravel)
│   ├── Pure HTML/CSS Interface
│   ├── Server-Side Rendering
│   └── RESTful API
│
├── Android App → Website API
│   ├── Secure Authentication
│   ├── Encrypted Communication
│   └── Real-time Synchronization
│
└── Documentation
    ├── Architecture Details
    ├── API Specifications
    └── Deployment Procedures
```

---

## ✅ Community Participation

AnonOdds welcomes community involvement within the bounds of our proprietary license:

**You MAY:**
- View and study the source code
- Submit bug reports and issues
- Suggest features and improvements
- Participate in discussions
- Review documentation

**You MAY NOT** (without written authorization from Skotos):
- Make code modifications
- Fork or redistribute the code
- Deploy your own instance
- Create derivative works
- Use for competitive purposes

For complete terms, see the [LICENSE.md](./Website/LICENSE.md) file.

---

## 🚀 Quick Links

| Resource | Location |
|----------|----------|
| Website README | `./Website/README.md` |
| Android README | `./AndroidApp/README.md` |
| Full Documentation | `./AnonOddsDocumentation/` |
| License Agreement | `./Website/LICENSE.md` |
| API Specification | `./AnonOddsDocumentation/api/` |
| Architecture Guide | `./AnonOddsDocumentation/architecture/` |
| Deployment Guide | `./AnonOddsDocumentation/deployment/` |

---

## 📞 Support & Contact

For support, questions, and inquiries:

- **Bug Reports**: Use the issue tracking system in each component
- **Feature Suggestions**: Submit through proper channels
- **Licensing Inquiries**: Contact Skotos via secure channels
- **Security Issues**: Report through secure disclosure process

---

## ⚖️ License

AnonOdds is proprietary software owned and created by Skotos.

- **Licensing Terms**: See `./Website/LICENSE.md`
- **Creator/Owner**: Skotos
- **Copyright**: © 2026 AnonOdds

---

## 🔐 Security Notice

AnonOdds is committed to maintaining the highest security standards. If you discover a security vulnerability, please report it responsibly through secure channels rather than public issue trackers.

---

## 📝 Changelog

For updates and version history:
- **Website Changes**: See `./Website/CHANGELOG.md`
- **Android Changes**: See `./AndroidApp/CHANGELOG.md`
- **Documentation Updates**: See `./AnonOddsDocumentation/CHANGELOG.md`

---

---

**AnonOdds** - The First Anonymous SportsBook  
**Created by Skotos**  
**© 2026 AnonOdds. All Rights Reserved.**

---

*This is the main hub for the AnonOdds ecosystem. For component-specific information, navigate to the individual folder README files.*
