# Robot Framework Practice Project

This repository demonstrates best practices for organizing, writing, and running Robot Framework tests for both API and UI automation. It includes examples of bad, normal, good, and best practices, as well as environment-based testing and advanced keyword usage.

---

## 📁 Project Structure

```
.
├── tests/                # Robot Framework test suites
│   ├── APIgeneral.robot
│   ├── bad_practice_login.robot
│   ├── best_practice_login.robot
│   ├── good_practice_login.robot
│   ├── normal_practice_login.robot
│   ├── saucedemo_login.robot
│   ├── test_api_env.robot
│   ├── test_api_param.robot
│   └── textvalidation.robot
├── resources/            # Shared resource and keyword files
│   ├── UsersAPI.resource
│   └── saucedemo_login_keywords.resource
├── variables/            # Environment variable files
│   ├── dev_env.py
│   └── staging_env.py
├── results/              # Test output (ignored by git)
├── libs/                 # Custom Python libraries (if any)
├── .gitignore
└── README.md
```

---

## 🧩 Test Script Explanations

### UI Tests (Selenium, [saucedemo.com](https://www.saucedemo.com/))

- **bad_practice_login.robot**  
  Hardcoded values, no keyword reuse, not maintainable.

- **normal_practice_login.robot**  
  Uses variables, but lacks keyword reuse.

- **good_practice_login.robot**  
  Uses variables and custom keywords for better structure.

- **best_practice_login.robot**  
  Uses test templates, POM-style keywords, and supports multiple roles.  
  Checks for correct login results for each user type.

- **saucedemo_login.robot**  
  Demonstrates login tests for various user roles using a test template and custom keywords.

### API Tests ([dummyjson.com](https://dummyjson.com/) & [jsonplaceholder.typicode.com](https://jsonplaceholder.typicode.com/))

- **APIgeneral.robot, good_API_gerenal.robot, best_API_general.robot**  
  Data-driven API tests for GET, POST, PUT, DELETE using a test template and the `/posts` resource on jsonplaceholder.typicode.com.

- **test_api_param.robot, UsersAPI.resource**  
  API tests with parameterized requests for GET, POST, PUT, DELETE on `/users` using dummyjson.com.  
  Uses a resource file for session and keyword management.  
  Requires an API key for POST/PUT/DELETE (demo: `dummyjson-demo-key`).

- **test_api_env.robot**  
  Best-practice API test that supports multiple environments (dev, staging) via variable files and dummyjson.com.

- **testtoken.robot**  
  Demonstrates token-based and public endpoint testing on jsonplaceholder.typicode.com.

### Text & Data Validation

- **textvalidation.robot**  
  Demonstrates string and JSON validation, string replacement, and basic data checks.

---

## 🛠️ Installation

1. **Clone the repository:**
   ```
   git clone https://github.com/mongoemon/robotframeworkpractice.git
   cd robotframeworkpractice
   ```

2. **Create and activate a virtual environment (recommended):**
   ```
   python -m venv .venv
   .venv\Scripts\activate   # On Windows
   ```

3. **Install dependencies:**
   ```
   pip install -r requirements.txt
   ```
   If `requirements.txt` is missing, install manually:
   ```
   pip install robotframework robotframework-seleniumlibrary robotframework-requests robotframework-jsonlibrary robotframework-appiumlibrary
   ```

4. **(Optional) Install browser drivers for UI tests:**
   - [ChromeDriver](https://chromedriver.chromium.org/downloads) for Chrome
   - [GeckoDriver](https://github.com/mozilla/geckodriver/releases) for Firefox

---

## 🚀 Running the Tests

### UI Tests

Run a specific UI test suite:
```
robot tests/best_practice_login.robot
```

### API Tests

Run API tests with default (dev) environment:
```
robot --variablefile variables/dev_env.py tests/test_api_env.robot
```

Run API tests with staging environment:
```
robot --variablefile variables/staging_env.py tests/test_api_env.robot
```

Run parameterized API tests:
```
robot tests/test_api_param.robot
```

Run general API tests:
```
robot tests/good_API_gerenal.robot
robot tests/best_API_general.robot
```

Run token-based API tests:
```
robot tests/testtoken.robot
```

### Text Validation Tests

```
robot tests/textvalidation.robot
```

---

## 🔑 API Key for DummyJSON

For POST, PUT, DELETE requests to [dummyjson.com](https://dummyjson.com/), an API key is required.  
This project uses the demo key:  
```
x-api-key: dummyjson-demo-key
```
See [DummyJSON docs](https://dummyjson.com/docs/auth) for more info.

---

## 📝 Notes

- Test results are saved in the `results/` folder (ignored by git).
- You can add more environments by creating new variable files in the `variables/` folder.
- Custom keywords are organized in the `resources/` folder for reuse and maintainability.

---

## 🤝 Contributing

Feel free to fork, open issues, or submit pull requests to improve this project!