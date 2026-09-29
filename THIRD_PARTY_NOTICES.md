# Third-Party Notices

The files listed below are **not** covered by the DKEM / DKEX / ADKEX Evaluation
License in [LICENSE](LICENSE). Each is governed by its own license or terms, which
prevail for that file. The original copyright and license header in every such file
is kept unchanged.

In the paths below, `<ALG>` is `DKEM`, `DKEX` or `ADKEX`, and `<INST>` is the instance
folder, such as `DKEM-128`. The portable **Reference_Implementation** contains no
external third-party code, only the ICCS template files of Section 1 (plus
`dilithium/` for DKEX).

---

## 1. ICCS API_PKC template files

Provided by the Institute of Commercial Cryptography Standards (ICCS) for algorithm
submissions to the Next-generation Commercial Cryptographic Algorithms Program (NGCC).

| Files | Status |
|-------|--------|
| `drng.c`, `drng.h`, `auxfunc.c`, `auxfunc.h`, `KAT_KEM.c` (DKEM), `KAT_KEX.c` (DKEX / ADKEX) | Official files, byte-for-byte unchanged |
| `KEM_AlgorithmInstance.c/.h`, `KEX_AlgorithmInstance.c/.h` | Official API template, with the interface bodies filled in by the Owners |

These files carry the ICCS notice in their header and are distributed under the terms
set by ICCS. No license is granted to them by the Owners. The code the Owners wrote
into the `*_AlgorithmInstance` files is covered by [LICENSE](LICENSE).

---

## 2. pq-crystals / PQClean (ML-KEM AVX2), x86-64 optimized implementation

- **Copyright:** the pq-crystals project authors; PQClean contributors
- **License:** Public Domain (CC0 1.0) or Apache-2.0 ([LICENSES/Apache-2.0.txt](LICENSES/Apache-2.0.txt)); some PQClean parts are MIT
- **Upstream:** <https://github.com/pq-crystals/kyber>, <https://github.com/pq-crystals/mlkem>, <https://github.com/PQClean/PQClean>

Files, all under `<ALG>/Implementations/Optimized_Implementation/<INST>/`:

| Path | Content |
|------|---------|
| `avx2/consts_avx2.c`, `avx2/ntt_avx2.c`, `avx2/poly_avx2.c`, `avx2/rejsample_avx2.c` | AVX2 constants, forward NTT, polynomial helpers, rejection sampling |
| `avx2-512p/` | Packed-domain constants and Montgomery reduction (pq-crystals/mlkem, PQClean mlkem-768) |
| `avx2-dkek/` | Vendored ML-KEM NTT assembly, parameters and glue |
| `avx2-linux/*_dkek_*.S`, `avx2-linux/ntt_tobytes_avx2.S` | GNU-as ports of the pq-crystals ML-KEM AVX2 assembly |
| AVX2 CBD sampling in `random_sampling.c` | From the ML-KEM AVX2 reference. The rest of the file is Owners' code under [LICENSE](LICENSE) |

The other `avx2-linux/` assembly (`ntt256/512`, `invntt256/512`, `basemul`,
`basemul512`, `poly_ops`, etc.) and `avx2-512/` are original work of the Owners and are
covered by [LICENSE](LICENSE).

---

## 3. mlkem-native, AArch64 NEON additional implementation

- **Copyright:** Arm Limited; Hanno Becker; Amin Abdulrahman; Matthias Kannwischer; the mlkem-native project authors
- **License:** `Apache-2.0 OR ISC OR MIT`, at the recipient's choice; the Apache-2.0 text is in [LICENSES/Apache-2.0.txt](LICENSES/Apache-2.0.txt)
- **Upstream:** <https://github.com/pq-code-package/mlkem-native>

Files: `<ALG>/Implementations/Additional_Implementation/AArch64_NEON/<INST>/aarch64-native/`
(the whole directory, including `ntt512_compiler.S`, which is marked with the same license).

---

## 4. Plantard arithmetic files with an explicit Apache-2.0 header, Cortex-M4 additional implementation

- **Copyright:** Huang Junhao, a member of the proposal team and one of the Owners
- **License:** Apache-2.0 ([LICENSES/Apache-2.0.txt](LICENSES/Apache-2.0.txt)), as stated in the file headers
- **Reference:** J. Huang et al., "Improved Plantard Arithmetic for Efficient Implementations of Lattice-based Cryptography", TCHES 2022, <https://eprint.iacr.org/2022/956>

Only the following files, which carry an Apache-2.0 header, are covered by this section.
They are all under `<ALG>/Implementations/Additional_Implementation/Cortex-M4/<INST>/cortex-m4/plantard/`:

| File | Instances |
|------|-----------|
| `plantard_zetas.c` | all |
| `plantard512_fastntt.S`, `plantard512_matacc_asm.S` | `*-512` |

All other Cortex-M4 code, including the remaining `plantard/` assembly and macros and
`sm3_compress_asm_m4.S`, is original work of the proposal team and is covered by
[LICENSE](LICENSE).

---

## 5. pq-crystals / dilithium (ML-DSA, FIPS 204), DKEX only

- **Copyright:** the pq-crystals / dilithium authors
- **License:** Public Domain (CC0 1.0) or Apache-2.0; see the `LICENSE` file in each `dilithium/` directory
- **Upstream:** <https://github.com/pq-crystals/dilithium>

Files: `DKEX/Implementations/*/<INST>/dilithium/` (unmodified reference sources, used as
the digital-signature primitive of the DKEX handshake through the pluggable
`adkex_sig.h` interface).

---

| License | Text |
|---------|------|
| Apache-2.0 | [LICENSES/Apache-2.0.txt](LICENSES/Apache-2.0.txt) |
| CC0 1.0 | <https://creativecommons.org/publicdomain/zero/1.0/legalcode> |
| ISC / MIT (mlkem-native alternatives) | <https://github.com/pq-code-package/mlkem-native> (the `LICENSE` file there) |
