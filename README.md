# DKEM / DKEX / ADKEX — Lattice-based Post-Quantum Key Establishment

Source code, specifications and known-answer test vectors of three post-quantum
algorithms submitted to the Institute of Commercial Cryptography Standards (ICCS)
public-key cryptographic algorithm call (API_PKC).

| Algorithm | Full name | Type | Submission ID | Instances |
|-----------|-----------|------|---------------|-----------|
| [DKEM](DKEM/)   | Ding Key Encapsulation          | KEM          | PKCKEM-380333 | DKEM-128 / 256 / 512 |
| [DKEX](DKEX/)   | Ding Key Exchange               | Key exchange | PKCKEX-359777 | DKEX-128 / 256 / 512 |
| [ADKEX](ADKEX/) | Authenticated Ding Key Exchange | Key exchange | PKCKEX-142803 | ADKEX-128 / 256 / 512 |

## Repository layout

```
<ALG>/
  Specification/<ALG>-Algorithm-Specification.pdf
  Implementations/
    README, README_CN.txt          build & compliance notes
    Reference_Implementation/      portable ISO C
    Optimized_Implementation/      x86-64 AVX2
    Additional_Implementation/
      AArch64_NEON/                ARMv8.2-A NEON
      Cortex-M4/                   STM32 Cortex-M4 (Plantard arithmetic)
  Test_Vectors/                    KAT files (reference and optimized outputs are identical)
```

## Quick start

Every instance folder has a self-contained `build.sh` that compiles the KAT generator
and writes `output/KAT_*.txt`, which can be compared with `Test_Vectors/`:

```bash
cd DKEM/Implementations/Reference_Implementation/DKEM-128
bash build.sh
cmp output/KAT_KEM_DKEM-128.txt ../../../Test_Vectors/KAT_KEM_DKEM-128.txt
```

See each `Implementations/README` for platform requirements and details.

## License

Evaluation use only; see [LICENSE](LICENSE). You may use, modify and redistribute the
code for evaluation, cryptanalysis, benchmarking, academic research and the ICCS NGCC
review. Any other use, including commercial use, requires written permission. No patent
license is granted. Third-party code and the ICCS template files keep their own licenses;
see [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).
