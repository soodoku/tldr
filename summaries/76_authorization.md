### Authorization

#### Chapter 1

Authentication establishes who the requester is; authorization determines what that requester may do.

> "The opening Target breach is used to make the distinction vivid. The attackers obtained valid contractor credentials, so the initial failure involved authentication. But the larger damage was possible because those credentials could reach systems they should never have been able to reach."

_Common Problems_

1. Scalability. Lists and groups become unwieldy as principals × resources × actions proliferate.
2. Flexibility. Static assignments struggle with runtime context such as time, device posture, location, temporary approval, or being on call.
3. Maintainability. Exceptions accumulate, roles proliferate, and effective permissions become difficult to reason about.
4. Inefficiency. Complex systems such as EHRs require combinations of role, department, shift, consent, etc., which become cumbersome when represented through lists and mappings.
5. Auditability. It becomes difficult to answer seemingly simple questions such as “who has access to what?” or to demonstrate regulatory compliance.
6. Security. Stale privileges, excessive permissions, and bespoke mechanisms undermine least privilege and zero-trust designs.
7. Consistency/transparency. Business intent gets translated into many implementation-specific mechanisms, producing policy drift and inconsistent behavior.

- Solution: PBAC

- Data/Code
  - Code: what rule should govern this class of situations?
  - Data: what facts/relationships currently obtain in this particular situation?
  - Decision: evaluate the former over the latter.

- Why now
  - Zero trust: rather than treating network location as the main security boundary, systems repeatedly authorize individual requests. That requires fast, contextual authorization.

#### Chapter 2

- Six challenges:
  - Proximity
  - Inter-operability
  - Flexibility
  - Privacy
  - Scale
  - Consent

  Weak evidence during account creation leads to weak authorization signals; reliance on insecure authentication mechanisms makes authorization moot.

- In the federated model, one or more organizations, called identity providers (IdPs), manage accounts, authentication, and identity attributes. Other organizations, called relying parties (RPs), rely on the IdPs for authentication and account services. For this to work, the interactions between the IdP and the RP are mediated by a protocol. The common protocols used in federated identity systems include the Security Assertion Markup Language (SAML), OAuth, and OpenID Connect (which is based on OAuth).

- In a paper published in the Handbook of Risk Theory (2012), titled “Risk and Trust”
  (https://mng.bz/a9yz), Philip Nickel and Krist Vaesen define trust as the “disposition
  to willingly rely on another person or entity to perform actions that benefit or protect
  oneself or one’s interests in a given domain.”

- Traditionally, authentication is categorized into three primary factors: knowledge,
  possession, and inherence.

Contextual factors
The following sections describe the three contextual authentication factors in detail,
outlining their typical uses, strengths, and limitations.
Behavior factor—Something you do, like mouse movements

Location factor—Somewhere you are located, like geolocation
Location factors use things like GPS, IP addresses, or Wi-Fi locations to verify requests.

Temporal factor—The time you’re in, such as the current local time
Temporal factors assess whether an authentication request occurs at an appropriate
time.

Token-based authentication is a special case of identifier-only authentication, distinguished primarily by whether the token (which is also acting as the identifier) is issued
only after initial authentication using some stronger authentication method.

Risk-based boundaries, attribute lifetimes, and reproofing

Tokens carry stable identity
and scoping claims such as sub (subject), iss (issuer), aud (audience), and tenant_id,
along with limited profile attributes such as email, name, or group references. These
values allow the PEP to identify the caller and map the subject to a Cedar entity, such as
C3::CustomerUser::"{tenant_id}:{external_id}".
