; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mattr=+sve2 -force-streaming-compatible < %s | FileCheck %s
; RUN: llc -mattr=+sme -force-streaming < %s | FileCheck %s
; RUN: llc -force-streaming-compatible < %s | FileCheck %s --check-prefix=NONEON-NOSVE


target triple = "aarch64-unknown-linux-gnu"

define void @store_trunc_v8i16i8(ptr %ap, ptr %dest) {
; CHECK-LABEL: store_trunc_v8i16i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h, vl8
; CHECK-NEXT:    ldr q0, [x0]
; CHECK-NEXT:    st1b { z0.h }, p0, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: store_trunc_v8i16i8:
; NONEON-NOSVE:       // %bb.0:
; NONEON-NOSVE-NEXT:    ldr q0, [x0]
; NONEON-NOSVE-NEXT:    str q0, [sp, #-32]!
; NONEON-NOSVE-NEXT:    .cfi_def_cfa_offset 32
; NONEON-NOSVE-NEXT:    ldrh w8, [sp, #14]
; NONEON-NOSVE-NEXT:    strb w8, [sp, #31]
; NONEON-NOSVE-NEXT:    ldrh w8, [sp, #12]
; NONEON-NOSVE-NEXT:    strb w8, [sp, #30]
; NONEON-NOSVE-NEXT:    ldrh w8, [sp, #10]
; NONEON-NOSVE-NEXT:    strb w8, [sp, #29]
; NONEON-NOSVE-NEXT:    ldrh w8, [sp, #8]
; NONEON-NOSVE-NEXT:    strb w8, [sp, #28]
; NONEON-NOSVE-NEXT:    ldrh w8, [sp, #6]
; NONEON-NOSVE-NEXT:    strb w8, [sp, #27]
; NONEON-NOSVE-NEXT:    ldrh w8, [sp, #4]
; NONEON-NOSVE-NEXT:    strb w8, [sp, #26]
; NONEON-NOSVE-NEXT:    ldrh w8, [sp, #2]
; NONEON-NOSVE-NEXT:    strb w8, [sp, #25]
; NONEON-NOSVE-NEXT:    ldrh w8, [sp]
; NONEON-NOSVE-NEXT:    strb w8, [sp, #24]
; NONEON-NOSVE-NEXT:    ldr d0, [sp, #24]
; NONEON-NOSVE-NEXT:    str d0, [x1]
; NONEON-NOSVE-NEXT:    add sp, sp, #32
; NONEON-NOSVE-NEXT:    ret
  %a = load <8 x i16>, ptr %ap
  %val = trunc <8 x i16> %a to <8 x i8>
  store <8 x i8> %val, ptr %dest
  ret void
}

define void @store_trunc_v4i32i8(ptr %ap, ptr %dest) {
; CHECK-LABEL: store_trunc_v4i32i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s, vl4
; CHECK-NEXT:    ldr q0, [x0]
; CHECK-NEXT:    st1b { z0.s }, p0, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: store_trunc_v4i32i8:
; NONEON-NOSVE:       // %bb.0:
; NONEON-NOSVE-NEXT:    ldr q0, [x0]
; NONEON-NOSVE-NEXT:    str q0, [sp, #-16]!
; NONEON-NOSVE-NEXT:    .cfi_def_cfa_offset 16
; NONEON-NOSVE-NEXT:    ldp w9, w8, [sp, #8]
; NONEON-NOSVE-NEXT:    ldp w10, w11, [sp]
; NONEON-NOSVE-NEXT:    strb w8, [x1, #3]
; NONEON-NOSVE-NEXT:    strb w9, [x1, #2]
; NONEON-NOSVE-NEXT:    strb w11, [x1, #1]
; NONEON-NOSVE-NEXT:    strb w10, [x1]
; NONEON-NOSVE-NEXT:    add sp, sp, #16
; NONEON-NOSVE-NEXT:    ret
  %a = load <4 x i32>, ptr %ap
  %val = trunc <4 x i32> %a to <4 x i8>
  store <4 x i8> %val, ptr %dest
  ret void
}

define void @store_trunc_v4i32i16(ptr %ap, ptr %dest) {
; CHECK-LABEL: store_trunc_v4i32i16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s, vl4
; CHECK-NEXT:    ldr q0, [x0]
; CHECK-NEXT:    st1h { z0.s }, p0, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: store_trunc_v4i32i16:
; NONEON-NOSVE:       // %bb.0:
; NONEON-NOSVE-NEXT:    ldr q0, [x0]
; NONEON-NOSVE-NEXT:    str q0, [sp, #-32]!
; NONEON-NOSVE-NEXT:    .cfi_def_cfa_offset 32
; NONEON-NOSVE-NEXT:    ldp w8, w9, [sp, #8]
; NONEON-NOSVE-NEXT:    strh w9, [sp, #30]
; NONEON-NOSVE-NEXT:    strh w8, [sp, #28]
; NONEON-NOSVE-NEXT:    ldp w8, w9, [sp]
; NONEON-NOSVE-NEXT:    strh w9, [sp, #26]
; NONEON-NOSVE-NEXT:    strh w8, [sp, #24]
; NONEON-NOSVE-NEXT:    ldr d0, [sp, #24]
; NONEON-NOSVE-NEXT:    str d0, [x1]
; NONEON-NOSVE-NEXT:    add sp, sp, #32
; NONEON-NOSVE-NEXT:    ret
  %a = load <4 x i32>, ptr %ap
  %val = trunc <4 x i32> %a to <4 x i16>
  store <4 x i16> %val, ptr %dest
  ret void
}

define void @store_trunc_v2i64i8(ptr %ap, ptr %dest) {
; CHECK-LABEL: store_trunc_v2i64i8:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d, vl2
; CHECK-NEXT:    ldr q0, [x0]
; CHECK-NEXT:    st1w { z0.d }, p0, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: store_trunc_v2i64i8:
; NONEON-NOSVE:       // %bb.0:
; NONEON-NOSVE-NEXT:    ldr q0, [x0]
; NONEON-NOSVE-NEXT:    str q0, [sp, #-32]!
; NONEON-NOSVE-NEXT:    .cfi_def_cfa_offset 32
; NONEON-NOSVE-NEXT:    ldp x8, x9, [sp]
; NONEON-NOSVE-NEXT:    stp w8, w9, [sp, #24]
; NONEON-NOSVE-NEXT:    ldr d0, [sp, #24]
; NONEON-NOSVE-NEXT:    str d0, [x1]
; NONEON-NOSVE-NEXT:    add sp, sp, #32
; NONEON-NOSVE-NEXT:    ret
  %a = load <2 x i64>, ptr %ap
  %val = trunc <2 x i64> %a to <2 x i32>
  store <2 x i32> %val, ptr %dest
  ret void
}

define void @store_trunc_v2i256i64(ptr %ap, ptr %dest) {
; CHECK-LABEL: store_trunc_v2i256i64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ldr d1, [x0, #32]
; CHECK-NEXT:    ptrue p0.d, vl1
; CHECK-NEXT:    ldr d0, [x0]
; CHECK-NEXT:    splice z0.d, p0, { z0.d, z1.d }
; CHECK-NEXT:    str q0, [x1]
; CHECK-NEXT:    ret
;
; NONEON-NOSVE-LABEL: store_trunc_v2i256i64:
; NONEON-NOSVE:       // %bb.0:
; NONEON-NOSVE-NEXT:    ldr x8, [x0, #32]
; NONEON-NOSVE-NEXT:    ldr x9, [x0]
; NONEON-NOSVE-NEXT:    stp x9, x8, [sp, #-32]!
; NONEON-NOSVE-NEXT:    .cfi_def_cfa_offset 32
; NONEON-NOSVE-NEXT:    ldp d0, d1, [sp]
; NONEON-NOSVE-NEXT:    stp d0, d1, [sp, #16]
; NONEON-NOSVE-NEXT:    ldr q0, [sp, #16]
; NONEON-NOSVE-NEXT:    str q0, [x1]
; NONEON-NOSVE-NEXT:    add sp, sp, #32
; NONEON-NOSVE-NEXT:    ret
  %a = load <2 x i256>, ptr %ap
  %val = trunc <2 x i256> %a to <2 x i64>
  store <2 x i64> %val, ptr %dest
  ret void
}
