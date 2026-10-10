# API Testing — Sample Report

**API:** JSONPlaceholder public demo API  
**Base URL:** `https://jsonplaceholder.typicode.com`  
**Note:** Demo API only; not a production commerce service.

| ID | Method | Endpoint | Validation | Status |
|---|---|---|---|---|
| API-TC-001 | GET | `/posts/1` | HTTP 200, JSON fields exist, `id` equals 1 | Not Run |
| API-TC-002 | GET | `/posts/999999` | Observe non-existing resource behavior and document actual result | Not Run |
| API-TC-003 | POST | `/posts` | Verify status and response fields for sample JSON body | Not Run |

## Example Postman test script for GET /posts/1
```javascript
pm.test("Status code is 200", () => pm.response.to.have.status(200));
pm.test("Response is JSON", () => pm.response.to.be.json);
pm.test("Expected fields exist", function () {
  const body = pm.response.json();
  pm.expect(body).to.have.property("userId");
  pm.expect(body).to.have.property("id");
  pm.expect(body).to.have.property("title");
  pm.expect(body).to.have.property("body");
});
pm.test("Post ID is 1", () => pm.expect(pm.response.json().id).to.eql(1));
```

Import the collection, execute it online, then record actual status, response time, assertions, and date. Do not report pass/fail counts before execution. JSONPlaceholder POST behavior is simulated and not durable production storage.
