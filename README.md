# Training Extra (SPs)

## Purpose

The **Training Extra** project contains system prompts designed to extend the AI’s knowledge and rules with structured data, metadata, and reference information. These SPs help the AI respond accurately, follow rules, and reduce hallucinations.

---

## Versioning

### Base Versions

* Examples: **V1, V2, etc.**
* Contain the **full, uncompressed content**.
* Serve as reference versions.

---

### Optimized Versions

1. **SC (Short Code)**

   * Frequently used terms are replaced with **short codes**.
   * Reduces size moderately.
   * Retains full information.
   * Example: `Intel Core i9-13900 → INT i9-13900`
   * **Compression:** Moderate (~41%)

2. **TM (Token Mapping)**

   * Terms, structures, and entities are **mapped to tokens**.
   * Achieves strong compression while keeping all explicit data intact.
   * Example: `AMD Ryzen 7 5800X3D → R7-5800X3D`
   * **Compression:** Strong (~50%)

3. **OC (Optimal Compression)**

   * Applies **aggressive token mapping, delta encoding, and list collapsing** to maximize shrinkage.
   * Targets **~60% compression** while being **fully lossless** and reversible.
   * Example: `#TOKEN_MAP C1 → INT i7-12700 (AL, 12c[8P+4E], 2.1/4.9G, D4-3200/D5-4800, 128G max), V → INT ARK; #INSTANCES C1,V`
   * **Compression:** Extreme (~60%)

4. **XC (Extreme Compression)**

   * Combines **all prior methods + single-line folding, token shortening, and maximal field collapsing**.
   * Targets **~80% compression**, fully lossless and reversible.
   * Example: `SYS_V5_XC||CPU:I:i9-13900:RL:24c[8P+16E]:2-5.6G:D4/5-3200/5600:128G:ARK||GPU:N:4070Ti:AD104:7680CU:12G:GX:192b:2610M:285W:H21b/DP14:DLSS3/FG/RT:PP||#RESP:i9 RAM?→128G`
   * **Compression:** Extreme (~80%, currently strongest)

> **Note:** Versions without SC, TM, OC, or XC are just base/reference versions.
