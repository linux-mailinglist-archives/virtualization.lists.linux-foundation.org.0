Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E95132C3CFC
	for <lists.virtualization@lfdr.de>; Wed, 25 Nov 2020 10:52:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 857BC86AB1;
	Wed, 25 Nov 2020 09:52:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0q1vMh9if5Q7; Wed, 25 Nov 2020 09:52:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A1B3B86AE1;
	Wed, 25 Nov 2020 09:52:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F071C0052;
	Wed, 25 Nov 2020 09:52:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D61FC0052
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EAB7786AC6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:52:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fJ_uLZ3AhfUp
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:51:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BCA3386A84
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:51:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 1ED6C305D3E8; Wed, 25 Nov 2020 11:35:55 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id E9ADA3072785;
 Wed, 25 Nov 2020 11:35:54 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v10 75/81] KVM: introspection: add KVMI_VCPU_EVENT_PF
Date: Wed, 25 Nov 2020 11:35:54 +0200
Message-Id: <20201125093600.2766-76-alazar@bitdefender.com>
In-Reply-To: <20201125093600.2766-1-alazar@bitdefender.com>
References: <20201125093600.2766-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
 virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBldmVudCBp
cyBzZW50IHdoZW4gYSAjUEYgb2NjdXJzIGR1ZSB0byBhIGZhaWxlZCBwZXJtaXNzaW9uIGNoZWNr
CmluIHRoZSBzaGFkb3cgcGFnZSB0YWJsZXMsIGZvciBhIHBhZ2UgaW4gd2hpY2ggdGhlIGludHJv
c3BlY3Rpb24gdG9vbApoYXMgc2hvd24gaW50ZXJlc3QuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaSBE
b27Im3UgPG1kb250dUBiaXRkZWZlbmRlci5jb20+CkNvLWRldmVsb3BlZC1ieTogQWRhbGJlcnQg
TGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBM
YXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi92aXJ0L2t2
bS9rdm1pLnJzdCAgICAgICAgICAgICAgIHwgIDY2ICsrKysrKysrKysKIGFyY2gveDg2L2luY2x1
ZGUvYXNtL2t2bWlfaG9zdC5oICAgICAgICAgICAgICB8ICAgMSArCiBhcmNoL3g4Ni9rdm0va3Zt
aS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxMjIgKysrKysrKysrKysrKysrKysrCiBp
bmNsdWRlL3VhcGkvbGludXgva3ZtaS5oICAgICAgICAgICAgICAgICAgICAgfCAgMTAgKysKIC4u
Li90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jICB8ICA3NiArKysrKysr
KysrKwogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMgICAgICAgICAgICAgICAgIHwgMTE2
ICsrKysrKysrKysrKysrKysrCiB2aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmggICAg
ICAgICAgICAgfCAgIDcgKwogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX21zZy5jICAgICAg
ICAgICAgIHwgIDE5ICsrKwogOCBmaWxlcyBjaGFuZ2VkLCA0MTcgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QgYi9Eb2N1bWVudGF0aW9u
L3ZpcnQva3ZtL2t2bWkucnN0CmluZGV4IDE1NDBmNzVjNDQ2Mi4uYmRjYzkwNjZhZTI4IDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0CisrKyBiL0RvY3VtZW50YXRp
b24vdmlydC9rdm0va3ZtaS5yc3QKQEAgLTU0Myw2ICs1NDMsNyBAQCB0aGUgZm9sbG93aW5nIGV2
ZW50czo6CiAJS1ZNSV9WQ1BVX0VWRU5UX0RFU0NSSVBUT1IKIAlLVk1JX1ZDUFVfRVZFTlRfSFlQ
RVJDQUxMCiAJS1ZNSV9WQ1BVX0VWRU5UX01TUgorCUtWTUlfVkNQVV9FVkVOVF9QRgogCUtWTUlf
VkNQVV9FVkVOVF9YU0VUQlYKIAogV2hlbiBhbiBldmVudCBpcyBlbmFibGVkLCB0aGUgaW50cm9z
cGVjdGlvbiB0b29sIGlzIG5vdGlmaWVkIGFuZApAQCAtMTM5OCwzICsxMzk5LDY4IEBAIHJlZ2lz
dGVyIChzZWUgKipLVk1JX1ZDUFVfQ09OVFJPTF9FVkVOVFMqKikuCiBgYGt2bWlfdmNwdV9ldmVu
dGBgICh3aXRoIHRoZSB2Q1BVIHN0YXRlKSwgdGhlIE1TUiBudW1iZXIgKGBgbXNyYGApLAogdGhl
IG9sZCB2YWx1ZSAoYGBvbGRfdmFsdWVgYCkgYW5kIHRoZSBuZXcgdmFsdWUgKGBgbmV3X3ZhbHVl
YGApIGFyZSBzZW50CiB0byB0aGUgaW50cm9zcGVjdGlvbiB0b29sLiBUaGUgKkNPTlRJTlVFKiBh
Y3Rpb24gd2lsbCBzZXQgdGhlIGBgbmV3X3ZhbGBgLgorCisxMC4gS1ZNSV9WQ1BVX0VWRU5UX1BG
CistLS0tLS0tLS0tLS0tLS0tLS0tLS0tCisKKzpBcmNoaXRlY3R1cmVzOiB4ODYKKzpWZXJzaW9u
czogPj0gMQorOkFjdGlvbnM6IENPTlRJTlVFLCBDUkFTSCwgUkVUUlkKKzpQYXJhbWV0ZXJzOgor
Cis6OgorCisJc3RydWN0IGt2bWlfdmNwdV9ldmVudDsKKwlzdHJ1Y3Qga3ZtaV92Y3B1X2V2ZW50
X3BmIHsKKwkJX191NjQgZ3ZhOworCQlfX3U2NCBncGE7CisJCV9fdTggYWNjZXNzOworCQlfX3U4
IHBhZGRpbmcxOworCQlfX3UxNiBwYWRkaW5nMjsKKwkJX191MzIgcGFkZGluZzM7CisJfTsKKwor
OlJldHVybnM6CisKKzo6CisKKwlzdHJ1Y3Qga3ZtaV92Y3B1X2hkcjsKKwlzdHJ1Y3Qga3ZtaV92
Y3B1X2V2ZW50X3JlcGx5OworCitUaGlzIGV2ZW50IGlzIHNlbnQgd2hlbiBhIGh5cGVydmlzb3Ig
cGFnZSBmYXVsdCBvY2N1cnMgZHVlIHRvIGEgZmFpbGVkCitwZXJtaXNzaW9uIGNoZWNrcywgdGhl
IGludHJvc3BlY3Rpb24gaGFzIGJlZW4gZW5hYmxlZCBmb3IgdGhpcyBldmVudAorKHNlZSAqS1ZN
SV9WQ1BVX0NPTlRST0xfRVZFTlRTKikgYW5kIHRoZSBldmVudCB3YXMgZ2VuZXJhdGVkIGZvciBh
CitwYWdlIGluIHdoaWNoIHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wgaGFzIHNob3duIGludGVyZXN0
IChpZS4gaGFzCitwcmV2aW91c2x5IHRvdWNoZWQgaXQgYnkgYWRqdXN0aW5nIHRoZSBzcHRlIHBl
cm1pc3Npb25zOyBzZWUKKypLVk1JX1ZNX1NFVF9QQUdFX0FDQ0VTUyopLgorCitUaGVzZSBwZXJt
aXNzaW9ucyBjYW4gYmUgdXNlZCBieSB0aGUgaW50cm9zcGVjdGlvbiB0b29sIHRvIGd1YXJhbnRl
ZQordGhlIHB1cnBvc2Ugb2YgY29kZSBhcmVhcyBpbnNpZGUgdGhlIGd1ZXN0IChjb2RlLCByb2Rh
dGEsIHN0YWNrLCBoZWFwCitldGMuKSBFYWNoIGF0dGVtcHQgYXQgYW4gb3BlcmF0aW9uIHVuZml0
dGluZyBmb3IgYSBjZXJ0YWluIG1lbW9yeQorcmFuZ2UgKGVnLiBleGVjdXRlIGNvZGUgaW4gaGVh
cCkgdHJpZ2dlcnMgYSBwYWdlIGZhdWx0IGFuZCBnaXZlcyB0aGUKK2ludHJvc3BlY3Rpb24gdG9v
bCB0aGUgY2hhbmNlIHRvIGF1ZGl0IHRoZSBjb2RlIGF0dGVtcHRpbmcgdGhlIG9wZXJhdGlvbi4K
KworYGBrdm1pX3ZjcHVfZXZlbnRgYCAod2l0aCB0aGUgdkNQVSBzdGF0ZSksIGd1ZXN0IHZpcnR1
YWwgYWRkcmVzcyAoYGBndmFgYCkKK2lmIGF2YWlsYWJsZSBvciB+MCAoVU5NQVBQRURfR1ZBKSwg
Z3Vlc3QgcGh5c2ljYWwgYWRkcmVzcyAoYGBncGFgYCkKK2FuZCB0aGUgYGBhY2Nlc3NgYCBmbGFn
cyAoZS5nLiBLVk1JX1BBR0VfQUNDRVNTX1IpIGFyZSBzZW50IHRvIHRoZQoraW50cm9zcGVjdGlv
biB0b29sLgorCitJbiBjYXNlIG9mIGEgcmVzdHJpY3RlZCByZWFkIGFjY2VzcywgdGhlIGd1ZXN0
IGFkZHJlc3MgaXMgdGhlIGxvY2F0aW9uCitvZiB0aGUgbWVtb3J5IGJlaW5nIHJlYWQuIE9uIHdy
aXRlIGFjY2VzcywgdGhlIGd1ZXN0IGFkZHJlc3MgaXMgdGhlCitsb2NhdGlvbiBvZiB0aGUgbWVt
b3J5IGJlaW5nIHdyaXR0ZW4uIE9uIGV4ZWN1dGUgYWNjZXNzLCB0aGUgZ3Vlc3QKK2FkZHJlc3Mg
aXMgdGhlIGxvY2F0aW9uIG9mIHRoZSBpbnN0cnVjdGlvbiBiZWluZyBleGVjdXRlZAorKGBgZ3Zh
ID09IGt2bWlfdmNwdV9ldmVudC5hcmNoLnJlZ3MucmlwYGApLgorCitJbiB0aGUgY3VycmVudCBp
bXBsZW1lbnRhdGlvbiwgbW9zdCBvZiB0aGVzZSBldmVudHMgYXJlIHNlbnQgZHVyaW5nCitlbXVs
YXRpb24uIElmIHRoZSBwYWdlIGZhdWx0IGhhcyBzZXQgbW9yZSB0aGFuIG9uZSBhY2Nlc3MgYml0
CisoZS5nLiByLXgvLXJ3KSwgdGhlIGludHJvc3BlY3Rpb24gdG9vbCBtYXkgcmVjZWl2ZSBtb3Jl
IHRoYW4gb25lCitLVk1JX1ZDUFVfRVZFTlRfUEYgYW5kIHRoZSBvcmRlciBkZXBlbmRzIG9uIHRo
ZSBLVk0gZW11bGF0b3IuIEFub3RoZXIKK2NhdXNlIG9mIG11bHRpcGxlIGV2ZW50cyBpcyB3aGVu
IHRoZSBwYWdlIGZhdWx0IGlzIHRyaWdnZXJlZCBvbiBhY2Nlc3MKK2Nyb3NzaW5nIHRoZSBwYWdl
IGJvdW5kYXJ5LgorCitUaGUgKkNPTlRJTlVFKiBhY3Rpb24gd2lsbCBjb250aW51ZSB0aGUgcGFn
ZSBmYXVsdCBoYW5kbGluZyAoZS5nLiB2aWEKK2VtdWxhdGlvbikuCisKK1RoZSAqUkVUUlkqIGFj
dGlvbiBpcyB1c2VkIGJ5IHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wgdG8gcmV0cnkgdGhlCitleGVj
dXRpb24gb2YgdGhlIGN1cnJlbnQgaW5zdHJ1Y3Rpb24sIHVzdWFsbHkgYmVjYXVzZSBpdCBjaGFu
Z2VkIHRoZQoraW5zdHJ1Y3Rpb24gcG9pbnRlciBvciB0aGUgcGFnZSByZXN0cmljdGlvbnMuCmRp
ZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1pX2hvc3QuaCBiL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL2t2bWlfaG9zdC5oCmluZGV4IDQyMDM1OGM0YTlhZS4uMzE1MDBkM2ZmNjlkIDEw
MDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1pX2hvc3QuaAorKysgYi9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS9rdm1pX2hvc3QuaApAQCAtNTMsNiArNTMsNyBAQCBzdHJ1Y3Qga3ZtX3Zj
cHVfYXJjaF9pbnRyb3NwZWN0aW9uIHsKIH07CiAKIHN0cnVjdCBrdm1fYXJjaF9pbnRyb3NwZWN0
aW9uIHsKKwlzdHJ1Y3Qga3ZtX3BhZ2VfdHJhY2tfbm90aWZpZXJfbm9kZSBrcHRuX25vZGU7CiB9
OwogCiAjZGVmaW5lIFNMT1RTX1NJWkUgQklUU19UT19MT05HUyhLVk1fTUVNX1NMT1RTX05VTSkK
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9rdm1pLmMgYi9hcmNoL3g4Ni9rdm0va3ZtaS5jCmlu
ZGV4IGFjZDQ3NTZlMGQ3OC4uY2Q2NDc2MjY0M2Q2IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0v
a3ZtaS5jCisrKyBiL2FyY2gveDg2L2t2bS9rdm1pLmMKQEAgLTE3LDEwICsxNywyNiBAQCB2b2lk
IGt2bWlfYXJjaF9pbml0X3ZjcHVfZXZlbnRzX21hc2sodW5zaWduZWQgbG9uZyAqc3VwcG9ydGVk
KQogCXNldF9iaXQoS1ZNSV9WQ1BVX0VWRU5UX0hZUEVSQ0FMTCwgc3VwcG9ydGVkKTsKIAlzZXRf
Yml0KEtWTUlfVkNQVV9FVkVOVF9ERVNDUklQVE9SLCBzdXBwb3J0ZWQpOwogCXNldF9iaXQoS1ZN
SV9WQ1BVX0VWRU5UX01TUiwgc3VwcG9ydGVkKTsKKwlzZXRfYml0KEtWTUlfVkNQVV9FVkVOVF9Q
Riwgc3VwcG9ydGVkKTsKIAlzZXRfYml0KEtWTUlfVkNQVV9FVkVOVF9UUkFQLCBzdXBwb3J0ZWQp
OwogCXNldF9iaXQoS1ZNSV9WQ1BVX0VWRU5UX1hTRVRCViwgc3VwcG9ydGVkKTsKIH0KIAorc3Rh
dGljIGJvb2wga3ZtaV90cmFja19wcmVyZWFkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3BhX3Qg
Z3BhLCBndmFfdCBndmEsCisJCQkgICAgICAgaW50IGJ5dGVzLAorCQkJICAgICAgIHN0cnVjdCBr
dm1fcGFnZV90cmFja19ub3RpZmllcl9ub2RlICpub2RlKTsKK3N0YXRpYyBib29sIGt2bWlfdHJh
Y2tfcHJld3JpdGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBncGFfdCBncGEsIGd2YV90IGd2YSwK
KwkJCQljb25zdCB1OCAqbmV3LCBpbnQgYnl0ZXMsCisJCQkJc3RydWN0IGt2bV9wYWdlX3RyYWNr
X25vdGlmaWVyX25vZGUgKm5vZGUpOworc3RhdGljIGJvb2wga3ZtaV90cmFja19wcmVleGVjKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3BhX3QgZ3BhLCBndmFfdCBndmEsCisJCQkgICAgICAgc3Ry
dWN0IGt2bV9wYWdlX3RyYWNrX25vdGlmaWVyX25vZGUgKm5vZGUpOworc3RhdGljIHZvaWQga3Zt
aV90cmFja19jcmVhdGVfc2xvdChzdHJ1Y3Qga3ZtICprdm0sCisJCQkJICAgc3RydWN0IGt2bV9t
ZW1vcnlfc2xvdCAqc2xvdCwKKwkJCQkgICB1bnNpZ25lZCBsb25nIG5wYWdlcywKKwkJCQkgICBz
dHJ1Y3Qga3ZtX3BhZ2VfdHJhY2tfbm90aWZpZXJfbm9kZSAqbm9kZSk7CitzdGF0aWMgdm9pZCBr
dm1pX3RyYWNrX2ZsdXNoX3Nsb3Qoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX21lbW9yeV9z
bG90ICpzbG90LAorCQkJCSAgc3RydWN0IGt2bV9wYWdlX3RyYWNrX25vdGlmaWVyX25vZGUgKm5v
ZGUpOworCiBzdGF0aWMgdW5zaWduZWQgaW50IGt2bWlfdmNwdV9tb2RlKGNvbnN0IHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwKIAkJCQkgICBjb25zdCBzdHJ1Y3Qga3ZtX3NyZWdzICpzcmVncykKIHsK
QEAgLTk1OSwzICs5NzUsMTA5IEBAIHZvaWQga3ZtaV9hcmNoX3VwZGF0ZV9wYWdlX3RyYWNraW5n
KHN0cnVjdCBrdm0gKmt2bSwKIAkJfQogCX0KIH0KKwordm9pZCBrdm1pX2FyY2hfaG9vayhzdHJ1
Y3Qga3ZtICprdm0pCit7CisJc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pID0gS1ZNSShr
dm0pOworCisJa3ZtaS0+YXJjaC5rcHRuX25vZGUudHJhY2tfcHJlcmVhZCA9IGt2bWlfdHJhY2tf
cHJlcmVhZDsKKwlrdm1pLT5hcmNoLmtwdG5fbm9kZS50cmFja19wcmV3cml0ZSA9IGt2bWlfdHJh
Y2tfcHJld3JpdGU7CisJa3ZtaS0+YXJjaC5rcHRuX25vZGUudHJhY2tfcHJlZXhlYyA9IGt2bWlf
dHJhY2tfcHJlZXhlYzsKKwlrdm1pLT5hcmNoLmtwdG5fbm9kZS50cmFja19jcmVhdGVfc2xvdCA9
IGt2bWlfdHJhY2tfY3JlYXRlX3Nsb3Q7CisJa3ZtaS0+YXJjaC5rcHRuX25vZGUudHJhY2tfZmx1
c2hfc2xvdCA9IGt2bWlfdHJhY2tfZmx1c2hfc2xvdDsKKworCWt2bV9wYWdlX3RyYWNrX3JlZ2lz
dGVyX25vdGlmaWVyKGt2bSwgJmt2bWktPmFyY2gua3B0bl9ub2RlKTsKK30KKwordm9pZCBrdm1p
X2FyY2hfdW5ob29rKHN0cnVjdCBrdm0gKmt2bSkKK3sKKwlzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rp
b24gKmt2bWkgPSBLVk1JKGt2bSk7CisKKwlrdm1fcGFnZV90cmFja191bnJlZ2lzdGVyX25vdGlm
aWVyKGt2bSwgJmt2bWktPmFyY2gua3B0bl9ub2RlKTsKK30KKworc3RhdGljIGJvb2wga3ZtaV90
cmFja19wcmVyZWFkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3BhX3QgZ3BhLCBndmFfdCBndmEs
CisJCQkgICAgICAgaW50IGJ5dGVzLAorCQkJICAgICAgIHN0cnVjdCBrdm1fcGFnZV90cmFja19u
b3RpZmllcl9ub2RlICpub2RlKQoreworCXN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaTsK
Kwlib29sIHJldCA9IHRydWU7CisKKwlrdm1pID0ga3ZtaV9nZXQodmNwdS0+a3ZtKTsKKwlpZiAo
IWt2bWkpCisJCXJldHVybiB0cnVlOworCisJaWYgKGlzX3ZjcHVfZXZlbnRfZW5hYmxlZCh2Y3B1
LCBLVk1JX1ZDUFVfRVZFTlRfUEYpKQorCQlyZXQgPSBrdm1pX3BmX2V2ZW50KHZjcHUsIGdwYSwg
Z3ZhLCBLVk1JX1BBR0VfQUNDRVNTX1IpOworCisJa3ZtaV9wdXQodmNwdS0+a3ZtKTsKKworCXJl
dHVybiByZXQ7Cit9CisKK3N0YXRpYyBib29sIGt2bWlfdHJhY2tfcHJld3JpdGUoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCBncGFfdCBncGEsIGd2YV90IGd2YSwKKwkJCQljb25zdCB1OCAqbmV3LCBp
bnQgYnl0ZXMsCisJCQkJc3RydWN0IGt2bV9wYWdlX3RyYWNrX25vdGlmaWVyX25vZGUgKm5vZGUp
Cit7CisJc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pOworCWJvb2wgcmV0ID0gdHJ1ZTsK
KworCWt2bWkgPSBrdm1pX2dldCh2Y3B1LT5rdm0pOworCWlmICgha3ZtaSkKKwkJcmV0dXJuIHRy
dWU7CisKKwlpZiAoaXNfdmNwdV9ldmVudF9lbmFibGVkKHZjcHUsIEtWTUlfVkNQVV9FVkVOVF9Q
RikpCisJCXJldCA9IGt2bWlfcGZfZXZlbnQodmNwdSwgZ3BhLCBndmEsIEtWTUlfUEFHRV9BQ0NF
U1NfVyk7CisKKwlrdm1pX3B1dCh2Y3B1LT5rdm0pOworCisJcmV0dXJuIHJldDsKK30KKworc3Rh
dGljIGJvb2wga3ZtaV90cmFja19wcmVleGVjKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3BhX3Qg
Z3BhLCBndmFfdCBndmEsCisJCQkgICAgICAgc3RydWN0IGt2bV9wYWdlX3RyYWNrX25vdGlmaWVy
X25vZGUgKm5vZGUpCit7CisJc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pOworCWJvb2wg
cmV0ID0gdHJ1ZTsKKworCWt2bWkgPSBrdm1pX2dldCh2Y3B1LT5rdm0pOworCWlmICgha3ZtaSkK
KwkJcmV0dXJuIHRydWU7CisKKwlpZiAoaXNfdmNwdV9ldmVudF9lbmFibGVkKHZjcHUsIEtWTUlf
VkNQVV9FVkVOVF9QRikpCisJCXJldCA9IGt2bWlfcGZfZXZlbnQodmNwdSwgZ3BhLCBndmEsIEtW
TUlfUEFHRV9BQ0NFU1NfWCk7CisKKwlrdm1pX3B1dCh2Y3B1LT5rdm0pOworCisJcmV0dXJuIHJl
dDsKK30KKworc3RhdGljIHZvaWQga3ZtaV90cmFja19jcmVhdGVfc2xvdChzdHJ1Y3Qga3ZtICpr
dm0sCisJCQkJICAgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqc2xvdCwKKwkJCQkgICB1bnNpZ25l
ZCBsb25nIG5wYWdlcywKKwkJCQkgICBzdHJ1Y3Qga3ZtX3BhZ2VfdHJhY2tfbm90aWZpZXJfbm9k
ZSAqbm9kZSkKK3sKKwlzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWk7CisKKwlrdm1pID0g
a3ZtaV9nZXQoa3ZtKTsKKwlpZiAoIWt2bWkpCisJCXJldHVybjsKKworCWt2bWlfYWRkX21lbXNs
b3Qoa3ZtLCBzbG90LCBucGFnZXMpOworCisJa3ZtaV9wdXQoa3ZtKTsKK30KKworc3RhdGljIHZv
aWQga3ZtaV90cmFja19mbHVzaF9zbG90KHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bV9tZW1v
cnlfc2xvdCAqc2xvdCwKKwkJCQkgIHN0cnVjdCBrdm1fcGFnZV90cmFja19ub3RpZmllcl9ub2Rl
ICpub2RlKQoreworCXN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaTsKKworCWt2bWkgPSBr
dm1pX2dldChrdm0pOworCWlmICgha3ZtaSkKKwkJcmV0dXJuOworCisJa3ZtaV9yZW1vdmVfbWVt
c2xvdChrdm0sIHNsb3QpOworCisJa3ZtaV9wdXQoa3ZtKTsKK30KZGlmZiAtLWdpdCBhL2luY2x1
ZGUvdWFwaS9saW51eC9rdm1pLmggYi9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oCmluZGV4IDQy
YzhlNjM0MmZjZi4uM2I0MzJiMzdiMTdjIDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvbGludXgv
a3ZtaS5oCisrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9rdm1pLmgKQEAgLTcyLDYgKzcyLDcgQEAg
ZW51bSB7CiAJS1ZNSV9WQ1BVX0VWRU5UX1hTRVRCViAgICAgPSBLVk1JX1ZDUFVfRVZFTlRfSUQo
NSksCiAJS1ZNSV9WQ1BVX0VWRU5UX0RFU0NSSVBUT1IgPSBLVk1JX1ZDUFVfRVZFTlRfSUQoNiks
CiAJS1ZNSV9WQ1BVX0VWRU5UX01TUiAgICAgICAgPSBLVk1JX1ZDUFVfRVZFTlRfSUQoNyksCisJ
S1ZNSV9WQ1BVX0VWRU5UX1BGICAgICAgICAgPSBLVk1JX1ZDUFVfRVZFTlRfSUQoOCksCiAKIAlL
Vk1JX05FWFRfVkNQVV9FVkVOVAogfTsKQEAgLTIxMCw0ICsyMTEsMTMgQEAgc3RydWN0IGt2bWlf
dm1fc2V0X3BhZ2VfYWNjZXNzIHsKIAlzdHJ1Y3Qga3ZtaV9wYWdlX2FjY2Vzc19lbnRyeSBlbnRy
aWVzWzBdOwogfTsKIAorc3RydWN0IGt2bWlfdmNwdV9ldmVudF9wZiB7CisJX191NjQgZ3ZhOwor
CV9fdTY0IGdwYTsKKwlfX3U4IGFjY2VzczsKKwlfX3U4IHBhZGRpbmcxOworCV9fdTE2IHBhZGRp
bmcyOworCV9fdTMyIHBhZGRpbmczOworfTsKKwogI2VuZGlmIC8qIF9VQVBJX19MSU5VWF9LVk1J
X0ggKi8KZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3Zt
aV90ZXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5j
CmluZGV4IGM5ZDZlZTU3ZDUwNi4uZTM2YjU3NGMyNjRlIDEwMDY0NAotLS0gYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMKQEAgLTQ3LDYgKzQ3LDExIEBAIHN0cnVj
dCB2Y3B1X3JlcGx5IHsKIAlzdHJ1Y3Qga3ZtaV92Y3B1X2V2ZW50X3JlcGx5IHJlcGx5OwogfTsK
IAorc3RydWN0IHBmX2V2IHsKKwlzdHJ1Y3QgdmNwdV9ldmVudCB2Y3B1X2V2OworCXN0cnVjdCBr
dm1pX3ZjcHVfZXZlbnRfcGYgcGY7Cit9OworCiBzdHJ1Y3QgdmNwdV93b3JrZXJfZGF0YSB7CiAJ
c3RydWN0IGt2bV92bSAqdm07CiAJaW50IHZjcHVfaWQ7CkBAIC01NCw2ICs1OSwxMCBAQCBzdHJ1
Y3QgdmNwdV93b3JrZXJfZGF0YSB7CiAJYm9vbCByZXN0YXJ0X29uX3NodXRkb3duOwogfTsKIAor
dHlwZWRlZiB2b2lkICgqZmN0X3BmX2V2ZW50KShzdHJ1Y3Qga3ZtX3ZtICp2bSwgc3RydWN0IGt2
bWlfbXNnX2hkciAqaGRyLAorCQkJCXN0cnVjdCBwZl9ldiAqZXYsCisJCQkJc3RydWN0IHZjcHVf
cmVwbHkgKnJwbCk7CisKIGVudW0gewogCUdVRVNUX1RFU1RfTk9PUCA9IDAsCiAJR1VFU1RfVEVT
VF9CUCwKQEAgLTYxLDYgKzcwLDcgQEAgZW51bSB7CiAJR1VFU1RfVEVTVF9ERVNDUklQVE9SLAog
CUdVRVNUX1RFU1RfSFlQRVJDQUxMLAogCUdVRVNUX1RFU1RfTVNSLAorCUdVRVNUX1RFU1RfUEYs
CiAJR1VFU1RfVEVTVF9YU0VUQlYsCiB9OwogCkBAIC0xMTQsNiArMTI0LDExIEBAIHN0YXRpYyB2
b2lkIGd1ZXN0X21zcl90ZXN0KHZvaWQpCiAJd3Jtc3IoTVNSX01JU0NfRkVBVFVSRVNfRU5BQkxF
UywgbXNyKTsKIH0KIAorc3RhdGljIHZvaWQgZ3Vlc3RfcGZfdGVzdCh2b2lkKQoreworCSooKHVp
bnQ4X3QgKil0ZXN0X2d2YSkgPSBHVUVTVF9URVNUX1BGOworfQorCiAvKiBmcm9tIGZwdS9pbnRl
cm5hbC5oICovCiBzdGF0aWMgdTY0IHhnZXRidih1MzIgaW5kZXgpCiB7CkBAIC0xNzQsNiArMTg5
LDkgQEAgc3RhdGljIHZvaWQgZ3Vlc3RfY29kZSh2b2lkKQogCQljYXNlIEdVRVNUX1RFU1RfTVNS
OgogCQkJZ3Vlc3RfbXNyX3Rlc3QoKTsKIAkJCWJyZWFrOworCQljYXNlIEdVRVNUX1RFU1RfUEY6
CisJCQlndWVzdF9wZl90ZXN0KCk7CisJCQlicmVhazsKIAkJY2FzZSBHVUVTVF9URVNUX1hTRVRC
VjoKIAkJCWd1ZXN0X3hzZXRidl90ZXN0KCk7CiAJCQlicmVhazsKQEAgLTE3MzgsNiArMTc1Niw2
MyBAQCBzdGF0aWMgdm9pZCB0ZXN0X2NtZF92bV9zZXRfcGFnZV9hY2Nlc3Moc3RydWN0IGt2bV92
bSAqdm0pCiAJc2V0X3BhZ2VfYWNjZXNzKGdwYSwgZnVsbF9hY2Nlc3MpOwogfQogCitzdGF0aWMg
dm9pZCB0ZXN0X3BmKHN0cnVjdCBrdm1fdm0gKnZtLCBmY3RfcGZfZXZlbnQgY2JrKQoreworCV9f
dTE2IGV2ZW50X2lkID0gS1ZNSV9WQ1BVX0VWRU5UX1BGOworCXN0cnVjdCB2Y3B1X3dvcmtlcl9k
YXRhIGRhdGEgPSB7CisJCS52bSA9IHZtLAorCQkudmNwdV9pZCA9IFZDUFVfSUQsCisJCS50ZXN0
X2lkID0gR1VFU1RfVEVTVF9QRiwKKwl9OworCXN0cnVjdCBrdm1pX21zZ19oZHIgaGRyOworCXN0
cnVjdCB2Y3B1X3JlcGx5IHJwbCA9IHt9OworCXB0aHJlYWRfdCB2Y3B1X3RocmVhZDsKKwlzdHJ1
Y3QgcGZfZXYgZXY7CisKKwlzZXRfcGFnZV9hY2Nlc3ModGVzdF9ncGEsIEtWTUlfUEFHRV9BQ0NF
U1NfUik7CisJZW5hYmxlX3ZjcHVfZXZlbnQodm0sIGV2ZW50X2lkKTsKKworCSooKHVpbnQ4X3Qg
Kil0ZXN0X2h2YSkgPSB+R1VFU1RfVEVTVF9QRjsKKworCXZjcHVfdGhyZWFkID0gc3RhcnRfdmNw
dV93b3JrZXIoJmRhdGEpOworCisJcmVjZWl2ZV92Y3B1X2V2ZW50KCZoZHIsICZldi52Y3B1X2V2
LCBzaXplb2YoZXYpLCBldmVudF9pZCk7CisKKwlwcl9kZWJ1ZygiUEYgZXZlbnQsIGdwYSAweCVs
bHgsIGd2YSAweCVsbHgsIGFjY2VzcyAweCV4XG4iLAorCQkgZXYucGYuZ3BhLCBldi5wZi5ndmEs
IGV2LnBmLmFjY2Vzcyk7CisKKwlURVNUX0FTU0VSVChldi5wZi5ncGEgPT0gdGVzdF9ncGEgJiYg
ZXYucGYuZ3ZhID09IHRlc3RfZ3ZhLAorCQkiVW5leHBlY3RlZCAjUEYgZXZlbnQsIGdwYSAweCVs
bHggKGV4cGVuZGVkIDB4JWx4KSwgZ3ZhIDB4JWxseCAoZXhwZWN0ZWQgMHglbHgpXG4iLAorCQll
di5wZi5ncGEsIHRlc3RfZ3BhLCBldi5wZi5ndmEsIHRlc3RfZ3ZhKTsKKworCWNiayh2bSwgJmhk
ciwgJmV2LCAmcnBsKTsKKworCXdhaXRfdmNwdV93b3JrZXIodmNwdV90aHJlYWQpOworCisJVEVT
VF9BU1NFUlQoKigodWludDhfdCAqKXRlc3RfaHZhKSA9PSBHVUVTVF9URVNUX1BGLAorCQkiV3Jp
dGUgZmFpbGVkLCBleHBlY3RlZCAweCV4LCByZXN1bHQgMHgleFxuIiwKKwkJR1VFU1RfVEVTVF9Q
RiwgKigodWludDhfdCAqKXRlc3RfaHZhKSk7CisKKwlkaXNhYmxlX3ZjcHVfZXZlbnQodm0sIGV2
ZW50X2lkKTsKKwlzZXRfcGFnZV9hY2Nlc3ModGVzdF9ncGEsIEtWTUlfUEFHRV9BQ0NFU1NfUiB8
CisJCQkJICBLVk1JX1BBR0VfQUNDRVNTX1cgfAorCQkJCSAgS1ZNSV9QQUdFX0FDQ0VTU19YKTsK
K30KKworc3RhdGljIHZvaWQgY2JrX3Rlc3RfZXZlbnRfcGYoc3RydWN0IGt2bV92bSAqdm0sIHN0
cnVjdCBrdm1pX21zZ19oZHIgKmhkciwKKwkJCQlzdHJ1Y3QgcGZfZXYgKmV2LCBzdHJ1Y3QgdmNw
dV9yZXBseSAqcnBsKQoreworCXNldF9wYWdlX2FjY2Vzcyh0ZXN0X2dwYSwgS1ZNSV9QQUdFX0FD
Q0VTU19SIHwgS1ZNSV9QQUdFX0FDQ0VTU19XKTsKKworCXJlcGx5X3RvX2V2ZW50KGhkciwgJmV2
LT52Y3B1X2V2LCBLVk1JX0VWRU5UX0FDVElPTl9SRVRSWSwKKwkJCXJwbCwgc2l6ZW9mKCpycGwp
KTsKK30KKworc3RhdGljIHZvaWQgdGVzdF9ldmVudF9wZihzdHJ1Y3Qga3ZtX3ZtICp2bSkKK3sK
Kwl0ZXN0X3BmKHZtLCBjYmtfdGVzdF9ldmVudF9wZik7Cit9CisKIHN0YXRpYyB2b2lkIHRlc3Rf
aW50cm9zcGVjdGlvbihzdHJ1Y3Qga3ZtX3ZtICp2bSkKIHsKIAlzcmFuZG9tKHRpbWUoMCkpOwpA
QCAtMTc3MSw2ICsxODQ2LDcgQEAgc3RhdGljIHZvaWQgdGVzdF9pbnRyb3NwZWN0aW9uKHN0cnVj
dCBrdm1fdm0gKnZtKQogCXRlc3RfZXZlbnRfZGVzY3JpcHRvcih2bSk7CiAJdGVzdF9jbWRfdmNw
dV9jb250cm9sX21zcih2bSk7CiAJdGVzdF9jbWRfdm1fc2V0X3BhZ2VfYWNjZXNzKHZtKTsKKwl0
ZXN0X2V2ZW50X3BmKHZtKTsKIAogCXVuaG9va19pbnRyb3NwZWN0aW9uKHZtKTsKIH0KZGlmZiAt
LWdpdCBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5jIGIvdmlydC9rdm0vaW50cm9zcGVj
dGlvbi9rdm1pLmMKaW5kZXggMDc5YjM1NTU0MGI0Li5hMjI4MTc4ZGRiYTIgMTAwNjQ0Ci0tLSBh
L3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5jCisrKyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rp
b24va3ZtaS5jCkBAIC0zNzYsNiArMzc2LDggQEAgc3RhdGljIHZvaWQgX19rdm1pX3VuaG9vayhz
dHJ1Y3Qga3ZtICprdm0pCiAJc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pID0gS1ZNSShr
dm0pOwogCiAJd2FpdF9mb3JfY29tcGxldGlvbl9raWxsYWJsZSgma3ZtLT5rdm1pX2NvbXBsZXRl
KTsKKworCWt2bWlfYXJjaF91bmhvb2soa3ZtKTsKIAlrdm1pX3NvY2tfcHV0KGt2bWkpOwogfQog
CkBAIC00MjMsNiArNDI1LDggQEAgc3RhdGljIGludCBfX2t2bWlfaG9vayhzdHJ1Y3Qga3ZtICpr
dm0sCiAJaWYgKCFrdm1pX3NvY2tfZ2V0KGt2bWksIGhvb2stPmZkKSkKIAkJcmV0dXJuIC1FSU5W
QUw7CiAKKwlrdm1pX2FyY2hfaG9vayhrdm0pOworCiAJcmV0dXJuIDA7CiB9CiAKQEAgLTEwNTQs
MyArMTA1OCwxMTUgQEAgaW50IGt2bWlfc2V0X2dmbl9hY2Nlc3Moc3RydWN0IGt2bSAqa3ZtLCBn
Zm5fdCBnZm4sIHU4IGFjY2VzcykKIAogCXJldHVybiBlcnI7CiB9CisKK3N0YXRpYyBpbnQga3Zt
aV9nZXRfZ2ZuX2FjY2VzcyhzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksIGNvbnN0IGdm
bl90IGdmbiwKKwkJCSAgICAgICB1OCAqYWNjZXNzKQoreworCXN0cnVjdCBrdm1pX21lbV9hY2Nl
c3MgKm07CisKKwlyZWFkX2xvY2soJmt2bWktPmFjY2Vzc190cmVlX2xvY2spOworCW0gPSBfX2t2
bWlfZ2V0X2dmbl9hY2Nlc3Moa3ZtaSwgZ2ZuKTsKKwlpZiAobSkKKwkJKmFjY2VzcyA9IG0tPmFj
Y2VzczsKKwlyZWFkX3VubG9jaygma3ZtaS0+YWNjZXNzX3RyZWVfbG9jayk7CisKKwlyZXR1cm4g
bSA/IDAgOiAtMTsKK30KKworYm9vbCBrdm1pX3Jlc3RyaWN0ZWRfcGFnZV9hY2Nlc3Moc3RydWN0
IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pLCBncGFfdCBncGEsCisJCQkJIHU4IGFjY2VzcykKK3sK
Kwl1OCBhbGxvd2VkX2FjY2VzczsKKwlpbnQgZXJyOworCisJZXJyID0ga3ZtaV9nZXRfZ2ZuX2Fj
Y2Vzcyhrdm1pLCBncGFfdG9fZ2ZuKGdwYSksICZhbGxvd2VkX2FjY2Vzcyk7CisJaWYgKGVycikK
KwkJcmV0dXJuIGZhbHNlOworCisJLyoKKwkgKiBXZSB3YW50IHRvIGJlIG5vdGlmaWVkIG9ubHkg
Zm9yIHZpb2xhdGlvbnMgaW52b2x2aW5nIGFjY2VzcworCSAqIGJpdHMgdGhhdCB3ZSd2ZSBzcGVj
aWZpY2FsbHkgY2xlYXJlZAorCSAqLworCWlmIChhY2Nlc3MgJiAofmFsbG93ZWRfYWNjZXNzKSkK
KwkJcmV0dXJuIHRydWU7CisKKwlyZXR1cm4gZmFsc2U7Cit9CisKK2Jvb2wga3ZtaV9wZl9ldmVu
dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdwYV90IGdwYSwgZ3ZhX3QgZ3ZhLCB1OCBhY2Nlc3Mp
Cit7CisJYm9vbCByZXQgPSBmYWxzZTsKKwl1MzIgYWN0aW9uOworCisJaWYgKCFrdm1pX3Jlc3Ry
aWN0ZWRfcGFnZV9hY2Nlc3MoS1ZNSSh2Y3B1LT5rdm0pLCBncGEsIGFjY2VzcykpCisJCXJldHVy
biB0cnVlOworCisJYWN0aW9uID0ga3ZtaV9tc2dfc2VuZF92Y3B1X3BmKHZjcHUsIGdwYSwgZ3Zh
LCBhY2Nlc3MpOworCXN3aXRjaCAoYWN0aW9uKSB7CisJY2FzZSBLVk1JX0VWRU5UX0FDVElPTl9D
T05USU5VRToKKwkJcmV0ID0gdHJ1ZTsKKwkJYnJlYWs7CisJY2FzZSBLVk1JX0VWRU5UX0FDVElP
Tl9SRVRSWToKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJa3ZtaV9oYW5kbGVfY29tbW9uX2V2ZW50
X2FjdGlvbnModmNwdSwgYWN0aW9uKTsKKwl9CisKKwlyZXR1cm4gcmV0OworfQorCit2b2lkIGt2
bWlfYWRkX21lbXNsb3Qoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpz
bG90LAorCQkgICAgICB1bnNpZ25lZCBsb25nIG5wYWdlcykKK3sKKwlzdHJ1Y3Qga3ZtX2ludHJv
c3BlY3Rpb24gKmt2bWkgPSBLVk1JKGt2bSk7CisJZ2ZuX3Qgc3RhcnQgPSBzbG90LT5iYXNlX2dm
bjsKKwlnZm5fdCBlbmQgPSBzdGFydCArIG5wYWdlczsKKwlpbnQgaWR4OworCisJaWR4ID0gc3Jj
dV9yZWFkX2xvY2soJmt2bS0+c3JjdSk7CisJc3Bpbl9sb2NrKCZrdm0tPm1tdV9sb2NrKTsKKwly
ZWFkX2xvY2soJmt2bWktPmFjY2Vzc190cmVlX2xvY2spOworCisJd2hpbGUgKHN0YXJ0IDwgZW5k
KSB7CisJCXN0cnVjdCBrdm1pX21lbV9hY2Nlc3MgKm07CisKKwkJbSA9IF9fa3ZtaV9nZXRfZ2Zu
X2FjY2Vzcyhrdm1pLCBzdGFydCk7CisJCWlmIChtKQorCQkJa3ZtaV9hcmNoX3VwZGF0ZV9wYWdl
X3RyYWNraW5nKGt2bSwgc2xvdCwgbSk7CisJCXN0YXJ0Kys7CisJfQorCisJcmVhZF91bmxvY2so
Jmt2bWktPmFjY2Vzc190cmVlX2xvY2spOworCXNwaW5fdW5sb2NrKCZrdm0tPm1tdV9sb2NrKTsK
KwlzcmN1X3JlYWRfdW5sb2NrKCZrdm0tPnNyY3UsIGlkeCk7Cit9CisKK3ZvaWQga3ZtaV9yZW1v
dmVfbWVtc2xvdChzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3Qp
Cit7CisJc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pID0gS1ZNSShrdm0pOworCWdmbl90
IHN0YXJ0ID0gc2xvdC0+YmFzZV9nZm47CisJZ2ZuX3QgZW5kID0gc3RhcnQgKyBzbG90LT5ucGFn
ZXM7CisJaW50IGlkeDsKKworCWlkeCA9IHNyY3VfcmVhZF9sb2NrKCZrdm0tPnNyY3UpOworCXNw
aW5fbG9jaygma3ZtLT5tbXVfbG9jayk7CisJd3JpdGVfbG9jaygma3ZtaS0+YWNjZXNzX3RyZWVf
bG9jayk7CisKKwl3aGlsZSAoc3RhcnQgPCBlbmQpIHsKKwkJc3RydWN0IGt2bWlfbWVtX2FjY2Vz
cyAqbTsKKworCQltID0gX19rdm1pX2dldF9nZm5fYWNjZXNzKGt2bWksIHN0YXJ0KTsKKwkJaWYg
KG0pIHsKKwkJCXU4IHByZXZfYWNjZXNzID0gbS0+YWNjZXNzOworCisJCQltLT5hY2Nlc3MgPSBm
dWxsX2FjY2VzczsKKwkJCWt2bWlfYXJjaF91cGRhdGVfcGFnZV90cmFja2luZyhrdm0sIHNsb3Qs
IG0pOworCQkJbS0+YWNjZXNzID0gcHJldl9hY2Nlc3M7CisJCX0KKwkJc3RhcnQrKzsKKwl9CisK
Kwl3cml0ZV91bmxvY2soJmt2bWktPmFjY2Vzc190cmVlX2xvY2spOworCXNwaW5fdW5sb2NrKCZr
dm0tPm1tdV9sb2NrKTsKKwlzcmN1X3JlYWRfdW5sb2NrKCZrdm0tPnNyY3UsIGlkeCk7Cit9CmRp
ZmYgLS1naXQgYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmggYi92aXJ0L2t2bS9p
bnRyb3NwZWN0aW9uL2t2bWlfaW50LmgKaW5kZXggNDE3MjBiMTk0NDU4Li5iZjY1NDVlNjY0MjUg
MTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaAorKysgYi92aXJ0
L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmgKQEAgLTYzLDYgKzYzLDcgQEAgaW50IGt2bWlf
bXNnX3ZjcHVfcmVwbHkoY29uc3Qgc3RydWN0IGt2bWlfdmNwdV9tc2dfam9iICpqb2IsCiB1MzIg
a3ZtaV9tc2dfc2VuZF92Y3B1X3BhdXNlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiB1MzIga3Zt
aV9tc2dfc2VuZF92Y3B1X2h5cGVyY2FsbChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogdTMyIGt2
bWlfbXNnX3NlbmRfdmNwdV9icChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU2NCBncGEsIHU4IGlu
c25fbGVuKTsKK3UzMiBrdm1pX21zZ19zZW5kX3ZjcHVfcGYoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LCB1NjQgZ3BhLCB1NjQgZ3ZhLCB1OCBhY2Nlc3MpOwogCiAvKiBrdm1pLmMgKi8KIHZvaWQgKmt2
bWlfbXNnX2FsbG9jKHZvaWQpOwpAQCAtOTMsNiArOTQsMTAgQEAgaW50IGt2bWlfY21kX3dyaXRl
X3BoeXNpY2FsKHN0cnVjdCBrdm0gKmt2bSwgdTY0IGdwYSwgc2l6ZV90IHNpemUsCiAJCQkgICAg
Y29uc3Qgdm9pZCAqYnVmKTsKIGludCBrdm1pX2NtZF92Y3B1X3BhdXNlKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSwgYm9vbCB3YWl0KTsKIGludCBrdm1pX3NldF9nZm5fYWNjZXNzKHN0cnVjdCBrdm0g
Kmt2bSwgZ2ZuX3QgZ2ZuLCB1OCBhY2Nlc3MpOworYm9vbCBrdm1pX3BmX2V2ZW50KHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwgZ3BhX3QgZ3BhLCBndmFfdCBndmEsIHU4IGFjY2Vzcyk7Cit2b2lkIGt2
bWlfYWRkX21lbXNsb3Qoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpz
bG90LAorCQkgICAgICB1bnNpZ25lZCBsb25nIG5wYWdlcyk7Cit2b2lkIGt2bWlfcmVtb3ZlX21l
bXNsb3Qoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90KTsKIAog
LyogYXJjaCAqLwogdm9pZCBrdm1pX2FyY2hfaW5pdF92Y3B1X2V2ZW50c19tYXNrKHVuc2lnbmVk
IGxvbmcgKnN1cHBvcnRlZCk7CkBAIC0xMTQsNSArMTE5LDcgQEAgdm9pZCBrdm1pX2FyY2hfc2Vu
ZF9wZW5kaW5nX2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiB2b2lkIGt2bWlfYXJjaF91
cGRhdGVfcGFnZV90cmFja2luZyhzdHJ1Y3Qga3ZtICprdm0sCiAJCQkJICAgIHN0cnVjdCBrdm1f
bWVtb3J5X3Nsb3QgKnNsb3QsCiAJCQkJICAgIHN0cnVjdCBrdm1pX21lbV9hY2Nlc3MgKm0pOwor
dm9pZCBrdm1pX2FyY2hfaG9vayhzdHJ1Y3Qga3ZtICprdm0pOwordm9pZCBrdm1pX2FyY2hfdW5o
b29rKHN0cnVjdCBrdm0gKmt2bSk7CiAKICNlbmRpZgpkaWZmIC0tZ2l0IGEvdmlydC9rdm0vaW50
cm9zcGVjdGlvbi9rdm1pX21zZy5jIGIvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX21zZy5j
CmluZGV4IGEzZDZkM2RmMzA3OC4uMjc2Yjg5ODkxMmZkIDEwMDY0NAotLS0gYS92aXJ0L2t2bS9p
bnRyb3NwZWN0aW9uL2t2bWlfbXNnLmMKKysrIGIvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1p
X21zZy5jCkBAIC04NzAsMyArODcwLDIyIEBAIHUzMiBrdm1pX21zZ19zZW5kX3ZjcHVfYnAoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCB1NjQgZ3BhLCB1OCBpbnNuX2xlbikKIAogCXJldHVybiBhY3Rp
b247CiB9CisKK3UzMiBrdm1pX21zZ19zZW5kX3ZjcHVfcGYoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LCB1NjQgZ3BhLCB1NjQgZ3ZhLCB1OCBhY2Nlc3MpCit7CisJc3RydWN0IGt2bWlfdmNwdV9ldmVu
dF9wZiBlOworCXUzMiBhY3Rpb247CisJaW50IGVycjsKKworCW1lbXNldCgmZSwgMCwgc2l6ZW9m
KGUpKTsKKwllLmdwYSA9IGdwYTsKKwllLmd2YSA9IGd2YTsKKwllLmFjY2VzcyA9IGFjY2VzczsK
KworCWVyciA9IGt2bWlfc2VuZF92Y3B1X2V2ZW50KHZjcHUsIEtWTUlfVkNQVV9FVkVOVF9QRiwg
JmUsIHNpemVvZihlKSwKKwkJCQkgICBOVUxMLCAwLCAmYWN0aW9uKTsKKwlpZiAoZXJyKQorCQly
ZXR1cm4gS1ZNSV9FVkVOVF9BQ1RJT05fQ09OVElOVUU7CisKKwlyZXR1cm4gYWN0aW9uOworfQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
