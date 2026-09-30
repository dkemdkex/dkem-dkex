# DKEM-512 NTT overflow regression test

Regression test for the int16 overflow in the DKE-512 forward NTT, reported on the ICCS NGCC
public forum and fixed in commit 8e3417a.

With q = 7681, the int16 butterflies of the unfixed forward NTT occasionally exceeded 32767,
so that about one honest DKEM-512 key exchange in 2,000 ended with different keys on the two
sides. `regress_ntt512.c` contains 12 DRNG seeds for which the unfixed code failed in this
way, together with the correct shared secrets. For each seed it runs `kem_keygen`, `kem_enc`
and `kem_dec` through the ICCS API and checks that both parties obtain the expected shared
secret.

## Usage

```bash
bash run_regression.sh ../../DKEM/Implementations/Reference_Implementation/DKEM-512
```

The script copies the given DKEM-512 implementation directory to a temporary directory,
builds it with its own `build.sh` (with the test in place of `KAT_KEM.c`) and runs it. It
prints `PASS` and exits with status 0 if all vectors pass, and `FAIL` with status 1 otherwise.
It works for the reference, optimized (x86-64 AVX2) and AArch64 NEON implementations. The
Cortex-M4 implementation is built for QEMU and is not covered by this script.

The code before commit 8e3417a fails this test on the reference and NEON implementations.
The optimized (AVX2) implementation was not affected by the overflow and passes it both
before and after the fix.
