; NOTE: Assertions have been autogenerated by utils/update_analyze_test_checks.py
; RUN: opt < %s -mtriple=aarch64--linux-gnu -passes="print<cost-model>" -cost-kind=all 2>&1 -disable-output | FileCheck %s

target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"

define void @extract_half() {
; CHECK-LABEL: 'extract_half'
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v2i8_lo = shufflevector <2 x i8> poison, <2 x i8> poison, <1 x i32> zeroinitializer
; CHECK-NEXT:  Cost Model: Found costs of 1 for: %v2i8_hi = shufflevector <2 x i8> poison, <2 x i8> poison, <1 x i32> <i32 1>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v4i8_lo = shufflevector <4 x i8> poison, <4 x i8> poison, <2 x i32> <i32 0, i32 1>
; CHECK-NEXT:  Cost Model: Found costs of 3 for: %v4i8_mi = shufflevector <4 x i8> poison, <4 x i8> poison, <2 x i32> <i32 1, i32 2>
; CHECK-NEXT:  Cost Model: Found costs of 3 for: %v4i8_hi = shufflevector <4 x i8> poison, <4 x i8> poison, <2 x i32> <i32 2, i32 3>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v8i8_lo = shufflevector <8 x i8> poison, <8 x i8> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
; CHECK-NEXT:  Cost Model: Found costs of 8 for: %v8i8_mi = shufflevector <8 x i8> poison, <8 x i8> poison, <4 x i32> <i32 2, i32 3, i32 4, i32 5>
; CHECK-NEXT:  Cost Model: Found costs of 8 for: %v8i8_hi = shufflevector <8 x i8> poison, <8 x i8> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v16i8_lo = shufflevector <16 x i8> poison, <16 x i8> poison, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:  Cost Model: Found costs of 8 for: %v16i8_mi = shufflevector <16 x i8> poison, <16 x i8> poison, <8 x i32> <i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11>
; CHECK-NEXT:  Cost Model: Found costs of 1 for: %v16i8_hi = shufflevector <16 x i8> poison, <16 x i8> poison, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v2i16_lo = shufflevector <2 x i16> poison, <2 x i16> poison, <1 x i32> zeroinitializer
; CHECK-NEXT:  Cost Model: Found costs of 1 for: %v2i16_hi = shufflevector <2 x i16> poison, <2 x i16> poison, <1 x i32> <i32 1>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v4i16_lo = shufflevector <4 x i16> poison, <4 x i16> poison, <2 x i32> <i32 0, i32 1>
; CHECK-NEXT:  Cost Model: Found costs of 3 for: %v4i16_mi = shufflevector <4 x i16> poison, <4 x i16> poison, <2 x i32> <i32 1, i32 2>
; CHECK-NEXT:  Cost Model: Found costs of 3 for: %v4i16_hi = shufflevector <4 x i16> poison, <4 x i16> poison, <2 x i32> <i32 2, i32 3>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v8i16_lo = shufflevector <8 x i16> poison, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
; CHECK-NEXT:  Cost Model: Found costs of 8 for: %v8i16_mi = shufflevector <8 x i16> poison, <8 x i16> poison, <4 x i32> <i32 2, i32 3, i32 4, i32 5>
; CHECK-NEXT:  Cost Model: Found costs of 1 for: %v8i16_hi = shufflevector <8 x i16> poison, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v16i16_lo = shufflevector <16 x i16> poison, <16 x i16> poison, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:  Cost Model: Found costs of 16 for: %v16i16_mi = shufflevector <16 x i16> poison, <16 x i16> poison, <8 x i32> <i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11>
; CHECK-NEXT:  Cost Model: Found costs of 16 for: %v16i16_hi = shufflevector <16 x i16> poison, <16 x i16> poison, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v2i32_lo = shufflevector <2 x i32> poison, <2 x i32> poison, <1 x i32> zeroinitializer
; CHECK-NEXT:  Cost Model: Found costs of 1 for: %v2i32_hi = shufflevector <2 x i32> poison, <2 x i32> poison, <1 x i32> <i32 1>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v4i32_lo = shufflevector <4 x i32> poison, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
; CHECK-NEXT:  Cost Model: Found costs of 3 for: %v4i32_mi = shufflevector <4 x i32> poison, <4 x i32> poison, <2 x i32> <i32 1, i32 2>
; CHECK-NEXT:  Cost Model: Found costs of 1 for: %v4i32_hi = shufflevector <4 x i32> poison, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v8i32_lo = shufflevector <8 x i32> poison, <8 x i32> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
; CHECK-NEXT:  Cost Model: Found costs of 6 for: %v8i32_mi = shufflevector <8 x i32> poison, <8 x i32> poison, <4 x i32> <i32 2, i32 3, i32 4, i32 5>
; CHECK-NEXT:  Cost Model: Found costs of 6 for: %v8i32_hi = shufflevector <8 x i32> poison, <8 x i32> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v16i32_lo = shufflevector <16 x i32> poison, <16 x i32> poison, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:  Cost Model: Found costs of 12 for: %v16i32_mi = shufflevector <16 x i32> poison, <16 x i32> poison, <8 x i32> <i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11>
; CHECK-NEXT:  Cost Model: Found costs of 12 for: %v16i32_hi = shufflevector <16 x i32> poison, <16 x i32> poison, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v2i64_lo = shufflevector <2 x i64> poison, <2 x i64> poison, <1 x i32> zeroinitializer
; CHECK-NEXT:  Cost Model: Found costs of 1 for: %v2i64_hi = shufflevector <2 x i64> poison, <2 x i64> poison, <1 x i32> <i32 1>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v4i64_lo = shufflevector <4 x i64> poison, <4 x i64> poison, <2 x i32> <i32 0, i32 1>
; CHECK-NEXT:  Cost Model: Found costs of 2 for: %v4i64_mi = shufflevector <4 x i64> poison, <4 x i64> poison, <2 x i32> <i32 1, i32 2>
; CHECK-NEXT:  Cost Model: Found costs of 2 for: %v4i64_hi = shufflevector <4 x i64> poison, <4 x i64> poison, <2 x i32> <i32 2, i32 3>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v8i64_lo = shufflevector <8 x i64> poison, <8 x i64> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
; CHECK-NEXT:  Cost Model: Found costs of 4 for: %v8i64_mi = shufflevector <8 x i64> poison, <8 x i64> poison, <4 x i32> <i32 2, i32 3, i32 4, i32 5>
; CHECK-NEXT:  Cost Model: Found costs of 4 for: %v8i64_hi = shufflevector <8 x i64> poison, <8 x i64> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:  Cost Model: Found costs of RThru:0 CodeSize:1 Lat:1 SizeLat:1 for: ret void
;
  %v2i8_lo = shufflevector <2 x i8> poison, <2 x i8> poison, <1 x i32> <i32 0>
  %v2i8_hi = shufflevector <2 x i8> poison, <2 x i8> poison, <1 x i32> <i32 1>
  %v4i8_lo = shufflevector <4 x i8> poison, <4 x i8> poison, <2 x i32> <i32 0, i32 1>
  %v4i8_mi = shufflevector <4 x i8> poison, <4 x i8> poison, <2 x i32> <i32 1, i32 2>
  %v4i8_hi = shufflevector <4 x i8> poison, <4 x i8> poison, <2 x i32> <i32 2, i32 3>
  %v8i8_lo = shufflevector <8 x i8> poison, <8 x i8> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %v8i8_mi = shufflevector <8 x i8> poison, <8 x i8> poison, <4 x i32> <i32 2, i32 3, i32 4, i32 5>
  %v8i8_hi = shufflevector <8 x i8> poison, <8 x i8> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %v16i8_lo = shufflevector <16 x i8> poison, <16 x i8> poison, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %v16i8_mi = shufflevector <16 x i8> poison, <16 x i8> poison, <8 x i32> <i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11>
  %v16i8_hi = shufflevector <16 x i8> poison, <16 x i8> poison, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>

  %v2i16_lo = shufflevector <2 x i16> poison, <2 x i16> poison, <1 x i32> <i32 0>
  %v2i16_hi = shufflevector <2 x i16> poison, <2 x i16> poison, <1 x i32> <i32 1>
  %v4i16_lo = shufflevector <4 x i16> poison, <4 x i16> poison, <2 x i32> <i32 0, i32 1>
  %v4i16_mi = shufflevector <4 x i16> poison, <4 x i16> poison, <2 x i32> <i32 1, i32 2>
  %v4i16_hi = shufflevector <4 x i16> poison, <4 x i16> poison, <2 x i32> <i32 2, i32 3>
  %v8i16_lo = shufflevector <8 x i16> poison, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %v8i16_mi = shufflevector <8 x i16> poison, <8 x i16> poison, <4 x i32> <i32 2, i32 3, i32 4, i32 5>
  %v8i16_hi = shufflevector <8 x i16> poison, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %v16i16_lo = shufflevector <16 x i16> poison, <16 x i16> poison, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %v16i16_mi = shufflevector <16 x i16> poison, <16 x i16> poison, <8 x i32> <i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11>
  %v16i16_hi = shufflevector <16 x i16> poison, <16 x i16> poison, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>

  %v2i32_lo = shufflevector <2 x i32> poison, <2 x i32> poison, <1 x i32> <i32 0>
  %v2i32_hi = shufflevector <2 x i32> poison, <2 x i32> poison, <1 x i32> <i32 1>
  %v4i32_lo = shufflevector <4 x i32> poison, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %v4i32_mi = shufflevector <4 x i32> poison, <4 x i32> poison, <2 x i32> <i32 1, i32 2>
  %v4i32_hi = shufflevector <4 x i32> poison, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %v8i32_lo = shufflevector <8 x i32> poison, <8 x i32> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %v8i32_mi = shufflevector <8 x i32> poison, <8 x i32> poison, <4 x i32> <i32 2, i32 3, i32 4, i32 5>
  %v8i32_hi = shufflevector <8 x i32> poison, <8 x i32> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %v16i32_lo = shufflevector <16 x i32> poison, <16 x i32> poison, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %v16i32_mi = shufflevector <16 x i32> poison, <16 x i32> poison, <8 x i32> <i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11>
  %v16i32_hi = shufflevector <16 x i32> poison, <16 x i32> poison, <8 x i32> <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>

  %v2i64_lo = shufflevector <2 x i64> poison, <2 x i64> poison, <1 x i32> <i32 0>
  %v2i64_hi = shufflevector <2 x i64> poison, <2 x i64> poison, <1 x i32> <i32 1>
  %v4i64_lo = shufflevector <4 x i64> poison, <4 x i64> poison, <2 x i32> <i32 0, i32 1>
  %v4i64_mi = shufflevector <4 x i64> poison, <4 x i64> poison, <2 x i32> <i32 1, i32 2>
  %v4i64_hi = shufflevector <4 x i64> poison, <4 x i64> poison, <2 x i32> <i32 2, i32 3>
  %v8i64_lo = shufflevector <8 x i64> poison, <8 x i64> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %v8i64_mi = shufflevector <8 x i64> poison, <8 x i64> poison, <4 x i32> <i32 2, i32 3, i32 4, i32 5>
  %v8i64_hi = shufflevector <8 x i64> poison, <8 x i64> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>

  ret void
}

define void @extract_qtr() {
; CHECK-LABEL: 'extract_qtr'
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v4i8_lo = shufflevector <4 x i8> poison, <4 x i8> poison, <1 x i32> zeroinitializer
; CHECK-NEXT:  Cost Model: Found costs of 3 for: %v4i8_mi = shufflevector <4 x i8> poison, <4 x i8> poison, <1 x i32> <i32 1>
; CHECK-NEXT:  Cost Model: Found costs of 3 for: %v4i8_hi = shufflevector <4 x i8> poison, <4 x i8> poison, <1 x i32> <i32 2>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v8i8_lo = shufflevector <8 x i8> poison, <8 x i8> poison, <2 x i32> <i32 0, i32 1>
; CHECK-NEXT:  Cost Model: Found costs of 8 for: %v8i8_mi = shufflevector <8 x i8> poison, <8 x i8> poison, <2 x i32> <i32 2, i32 3>
; CHECK-NEXT:  Cost Model: Found costs of 8 for: %v8i8_hi = shufflevector <8 x i8> poison, <8 x i8> poison, <2 x i32> <i32 4, i32 5>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v16i8_lo = shufflevector <16 x i8> poison, <16 x i8> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
; CHECK-NEXT:  Cost Model: Found costs of 8 for: %v16i8_mi = shufflevector <16 x i8> poison, <16 x i8> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:  Cost Model: Found costs of 8 for: %v16i8_hi = shufflevector <16 x i8> poison, <16 x i8> poison, <4 x i32> <i32 8, i32 9, i32 10, i32 11>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v4i16_lo = shufflevector <4 x i16> poison, <4 x i16> poison, <1 x i32> zeroinitializer
; CHECK-NEXT:  Cost Model: Found costs of 3 for: %v4i16_mi = shufflevector <4 x i16> poison, <4 x i16> poison, <1 x i32> <i32 1>
; CHECK-NEXT:  Cost Model: Found costs of 3 for: %v4i16_hi = shufflevector <4 x i16> poison, <4 x i16> poison, <1 x i32> <i32 2>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v8i16_lo = shufflevector <8 x i16> poison, <8 x i16> poison, <2 x i32> <i32 0, i32 1>
; CHECK-NEXT:  Cost Model: Found costs of 8 for: %v8i16_mi = shufflevector <8 x i16> poison, <8 x i16> poison, <2 x i32> <i32 2, i32 3>
; CHECK-NEXT:  Cost Model: Found costs of 8 for: %v8i16_hi = shufflevector <8 x i16> poison, <8 x i16> poison, <2 x i32> <i32 4, i32 5>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v16i16_lo = shufflevector <16 x i16> poison, <16 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
; CHECK-NEXT:  Cost Model: Found costs of 1 for: %v16i16_mi = shufflevector <16 x i16> poison, <16 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:  Cost Model: Found costs of 16 for: %v16i16_hi = shufflevector <16 x i16> poison, <16 x i16> poison, <4 x i32> <i32 8, i32 9, i32 10, i32 11>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v4i32_lo = shufflevector <4 x i32> poison, <4 x i32> poison, <1 x i32> zeroinitializer
; CHECK-NEXT:  Cost Model: Found costs of 3 for: %v4i32_mi = shufflevector <4 x i32> poison, <4 x i32> poison, <1 x i32> <i32 1>
; CHECK-NEXT:  Cost Model: Found costs of 3 for: %v4i32_hi = shufflevector <4 x i32> poison, <4 x i32> poison, <1 x i32> <i32 2>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v8i32_lo = shufflevector <8 x i32> poison, <8 x i32> poison, <2 x i32> <i32 0, i32 1>
; CHECK-NEXT:  Cost Model: Found costs of 1 for: %v8i32_mi = shufflevector <8 x i32> poison, <8 x i32> poison, <2 x i32> <i32 2, i32 3>
; CHECK-NEXT:  Cost Model: Found costs of 6 for: %v8i32_hi = shufflevector <8 x i32> poison, <8 x i32> poison, <2 x i32> <i32 4, i32 5>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v16i32_lo = shufflevector <16 x i32> poison, <16 x i32> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
; CHECK-NEXT:  Cost Model: Found costs of 12 for: %v16i32_mi = shufflevector <16 x i32> poison, <16 x i32> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
; CHECK-NEXT:  Cost Model: Found costs of 12 for: %v16i32_hi = shufflevector <16 x i32> poison, <16 x i32> poison, <4 x i32> <i32 8, i32 9, i32 10, i32 11>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v4i64_lo = shufflevector <4 x i64> poison, <4 x i64> poison, <1 x i32> zeroinitializer
; CHECK-NEXT:  Cost Model: Found costs of 1 for: %v4i64_mi = shufflevector <4 x i64> poison, <4 x i64> poison, <1 x i32> <i32 1>
; CHECK-NEXT:  Cost Model: Found costs of 2 for: %v4i64_hi = shufflevector <4 x i64> poison, <4 x i64> poison, <1 x i32> <i32 2>
; CHECK-NEXT:  Cost Model: Found costs of 0 for: %v8i64_lo = shufflevector <8 x i64> poison, <8 x i64> poison, <2 x i32> <i32 0, i32 1>
; CHECK-NEXT:  Cost Model: Found costs of 4 for: %v8i64_mi = shufflevector <8 x i64> poison, <8 x i64> poison, <2 x i32> <i32 2, i32 3>
; CHECK-NEXT:  Cost Model: Found costs of 4 for: %v8i64_hi = shufflevector <8 x i64> poison, <8 x i64> poison, <2 x i32> <i32 4, i32 5>
; CHECK-NEXT:  Cost Model: Found costs of RThru:0 CodeSize:1 Lat:1 SizeLat:1 for: ret void
;
  %v4i8_lo = shufflevector <4 x i8> poison, <4 x i8> poison, <1 x i32> <i32 0>
  %v4i8_mi = shufflevector <4 x i8> poison, <4 x i8> poison, <1 x i32> <i32 1>
  %v4i8_hi = shufflevector <4 x i8> poison, <4 x i8> poison, <1 x i32> <i32 2>
  %v8i8_lo = shufflevector <8 x i8> poison, <8 x i8> poison, <2 x i32> <i32 0, i32 1>
  %v8i8_mi = shufflevector <8 x i8> poison, <8 x i8> poison, <2 x i32> <i32 2, i32 3>
  %v8i8_hi = shufflevector <8 x i8> poison, <8 x i8> poison, <2 x i32> <i32 4, i32 5>
  %v16i8_lo = shufflevector <16 x i8> poison, <16 x i8> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %v16i8_mi = shufflevector <16 x i8> poison, <16 x i8> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %v16i8_hi = shufflevector <16 x i8> poison, <16 x i8> poison, <4 x i32> <i32 8, i32 9, i32 10, i32 11>

  %v4i16_lo = shufflevector <4 x i16> poison, <4 x i16> poison, <1 x i32> <i32 0>
  %v4i16_mi = shufflevector <4 x i16> poison, <4 x i16> poison, <1 x i32> <i32 1>
  %v4i16_hi = shufflevector <4 x i16> poison, <4 x i16> poison, <1 x i32> <i32 2>
  %v8i16_lo = shufflevector <8 x i16> poison, <8 x i16> poison, <2 x i32> <i32 0, i32 1>
  %v8i16_mi = shufflevector <8 x i16> poison, <8 x i16> poison, <2 x i32> <i32 2, i32 3>
  %v8i16_hi = shufflevector <8 x i16> poison, <8 x i16> poison, <2 x i32> <i32 4, i32 5>
  %v16i16_lo = shufflevector <16 x i16> poison, <16 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %v16i16_mi = shufflevector <16 x i16> poison, <16 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %v16i16_hi = shufflevector <16 x i16> poison, <16 x i16> poison, <4 x i32> <i32 8, i32 9, i32 10, i32 11>

  %v4i32_lo = shufflevector <4 x i32> poison, <4 x i32> poison, <1 x i32> <i32 0>
  %v4i32_mi = shufflevector <4 x i32> poison, <4 x i32> poison, <1 x i32> <i32 1>
  %v4i32_hi = shufflevector <4 x i32> poison, <4 x i32> poison, <1 x i32> <i32 2>
  %v8i32_lo = shufflevector <8 x i32> poison, <8 x i32> poison, <2 x i32> <i32 0, i32 1>
  %v8i32_mi = shufflevector <8 x i32> poison, <8 x i32> poison, <2 x i32> <i32 2, i32 3>
  %v8i32_hi = shufflevector <8 x i32> poison, <8 x i32> poison, <2 x i32> <i32 4, i32 5>
  %v16i32_lo = shufflevector <16 x i32> poison, <16 x i32> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %v16i32_mi = shufflevector <16 x i32> poison, <16 x i32> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %v16i32_hi = shufflevector <16 x i32> poison, <16 x i32> poison, <4 x i32> <i32 8, i32 9, i32 10, i32 11>

  %v4i64_lo = shufflevector <4 x i64> poison, <4 x i64> poison, <1 x i32> <i32 0>
  %v4i64_mi = shufflevector <4 x i64> poison, <4 x i64> poison, <1 x i32> <i32 1>
  %v4i64_hi = shufflevector <4 x i64> poison, <4 x i64> poison, <1 x i32> <i32 2>
  %v8i64_lo = shufflevector <8 x i64> poison, <8 x i64> poison, <2 x i32> <i32 0, i32 1>
  %v8i64_mi = shufflevector <8 x i64> poison, <8 x i64> poison, <2 x i32> <i32 2, i32 3>
  %v8i64_hi = shufflevector <8 x i64> poison, <8 x i64> poison, <2 x i32> <i32 4, i32 5>

  ret void
}
