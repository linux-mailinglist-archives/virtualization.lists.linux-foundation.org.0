Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CAC42455B
	for <lists.virtualization@lfdr.de>; Wed,  6 Oct 2021 19:55:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F86C83C0A;
	Wed,  6 Oct 2021 17:55:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h4NYUb9G8rDo; Wed,  6 Oct 2021 17:55:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5A5C783B46;
	Wed,  6 Oct 2021 17:55:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19DF2C0023;
	Wed,  6 Oct 2021 17:55:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14AF0C0027
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADDC940684
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R_GQEn1pX_LN
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:55:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5916740637
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:55:40 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 15AD6307CAEE; Wed,  6 Oct 2021 20:31:04 +0300 (EEST)
Received: from localhost (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id E80F4305FFA0;
 Wed,  6 Oct 2021 20:31:03 +0300 (EEST)
X-Is-Junk-Enabled: fGZTSsP0qEJE2AIKtlSuFiRRwg9xyHmJ
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v12 26/77] KVM: x86: page_track: add support for preread,
 prewrite and preexec
Date: Wed,  6 Oct 2021 20:30:22 +0300
Message-Id: <20211006173113.26445-27-alazar@bitdefender.com>
In-Reply-To: <20211006173113.26445-1-alazar@bitdefender.com>
References: <20211006173113.26445-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wanpeng Li <wanpengli@tencent.com>,
 Sean Christopherson <seanjc@google.com>, Joerg Roedel <joro@8bytes.org>,
 virtualization@lists.linux-foundation.org,
 =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
 Jim Mattson <jmattson@google.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhlIGFjY2VzcyB0
byBhIHRyYWNrZWQgbWVtb3J5IHBhZ2UgbGVhZHMgdG8gdHdvIHR5cGVzIG9mIGFjdGlvbnMgZnJv
bSB0aGUKaW50cm9zcGVjdGlvbiB0b29sOiBlaXRoZXIgdGhlIGFjY2VzcyBpcyBhbGxvd2VkICht
YXliZSB3aXRoIGRpZmZlcmVudApkYXRhIGZvciB0aGUgc291cmNlIG9wZXJhbmQpIG9yIHRoZSB2
Q1BVIHNob3VsZCByZS1lbnRlciBpbiBndWVzdAoodGhlIHBhZ2UgaXMgbm90IHRyYWNrZWQgYW55
bW9yZSwgdGhlIGluc3RydWN0aW9uIHdhcyBza2lwcGVkL2VtdWxhdGVkIGJ5CnRoZSBpbnRyb3Nw
ZWN0aW9uIHRvb2wsIGV0Yy4pLiBUaGVzZSBuZXcgY2FsbGJhY2tzIG11c3QgcmV0dXJuICd0cnVl
Jwpmb3IgdGhlIGZpcnN0IGNhc2UgYW5kICdmYWxzZScgZm9yIHRoZSBzZWNvbmQuCgpTaWduZWQt
b2ZmLWJ5OiBNaWhhaSBEb27Im3UgPG1kb250dUBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYt
Ynk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiBhcmNoL3g4
Ni9pbmNsdWRlL2FzbS9rdm1fcGFnZV90cmFjay5oIHwgIDQ4ICsrKysrKysrKy0KIGFyY2gveDg2
L2t2bS9tbXUvbW11LmMgICAgICAgICAgICAgICAgfCAgOTUgKysrKysrKysrKysrKysrKysrKysK
IGFyY2gveDg2L2t2bS9tbXUvbW11X2ludGVybmFsLmggICAgICAgfCAgIDYgKysKIGFyY2gveDg2
L2t2bS9tbXUvcGFnZV90cmFjay5jICAgICAgICAgfCAxMjMgKysrKysrKysrKysrKysrKysrKysr
KysrLS0KIGFyY2gveDg2L2t2bS9tbXUvdGRwX21tdS5jICAgICAgICAgICAgfCAxMDYgKysrKysr
KysrKysrKysrKysrKysrKwogYXJjaC94ODYva3ZtL21tdS90ZHBfbW11LmggICAgICAgICAgICB8
ICAgNiArKwogNiBmaWxlcyBjaGFuZ2VkLCAzNzQgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX3BhZ2VfdHJhY2suaCBi
L2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9wYWdlX3RyYWNrLmgKaW5kZXggZGY2ZTU2NzRlYTVj
Li41NmJhNGQyZDBhMzEgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9wYWdl
X3RyYWNrLmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX3BhZ2VfdHJhY2suaApAQCAt
Myw3ICszLDEwIEBACiAjZGVmaW5lIF9BU01fWDg2X0tWTV9QQUdFX1RSQUNLX0gKIAogZW51bSBr
dm1fcGFnZV90cmFja19tb2RlIHsKKwlLVk1fUEFHRV9UUkFDS19QUkVSRUFELAorCUtWTV9QQUdF
X1RSQUNLX1BSRVdSSVRFLAogCUtWTV9QQUdFX1RSQUNLX1dSSVRFLAorCUtWTV9QQUdFX1RSQUNL
X1BSRUVYRUMsCiAJS1ZNX1BBR0VfVFJBQ0tfTUFYLAogfTsKIApAQCAtMjIsNiArMjUsMzMgQEAg
c3RydWN0IGt2bV9wYWdlX3RyYWNrX25vdGlmaWVyX2hlYWQgewogc3RydWN0IGt2bV9wYWdlX3Ry
YWNrX25vdGlmaWVyX25vZGUgewogCXN0cnVjdCBobGlzdF9ub2RlIG5vZGU7CiAKKwkvKgorCSAq
IEl0IGlzIGNhbGxlZCB3aGVuIGd1ZXN0IGlzIHJlYWRpbmcgdGhlIHJlYWQtdHJhY2tlZCBwYWdl
CisJICogYW5kIHRoZSByZWFkIGVtdWxhdGlvbiBpcyBhYm91dCB0byBoYXBwZW4uCisJICoKKwkg
KiBAdmNwdTogdGhlIHZjcHUgd2hlcmUgdGhlIHJlYWQgYWNjZXNzIGhhcHBlbmVkLgorCSAqIEBn
cGE6IHRoZSBwaHlzaWNhbCBhZGRyZXNzIHJlYWQgYnkgZ3Vlc3QuCisJICogQGd2YTogdGhlIHZp
cnR1YWwgYWRkcmVzcyByZWFkIGJ5IGd1ZXN0LgorCSAqIEBieXRlczogdGhlIHJlYWQgbGVuZ3Ro
LgorCSAqIEBub2RlOiB0aGlzIG5vZGUuCisJICovCisJYm9vbCAoKnRyYWNrX3ByZXJlYWQpKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3BhX3QgZ3BhLCBndmFfdCBndmEsCisJCQkgICAgICBpbnQg
Ynl0ZXMsCisJCQkgICAgICBzdHJ1Y3Qga3ZtX3BhZ2VfdHJhY2tfbm90aWZpZXJfbm9kZSAqbm9k
ZSk7CisJLyoKKwkgKiBJdCBpcyBjYWxsZWQgd2hlbiBndWVzdCBpcyB3cml0aW5nIHRoZSB3cml0
ZS10cmFja2VkIHBhZ2UKKwkgKiBhbmQgdGhlIHdyaXRlIGVtdWxhdGlvbiBkaWRuJ3QgaGFwcGVu
ZWQgeWV0LgorCSAqCisJICogQHZjcHU6IHRoZSB2Y3B1IHdoZXJlIHRoZSB3cml0ZSBhY2Nlc3Mg
aGFwcGVuZWQuCisJICogQGdwYTogdGhlIHBoeXNpY2FsIGFkZHJlc3Mgd3JpdHRlbiBieSBndWVz
dC4KKwkgKiBAZ3ZhOiB0aGUgdmlydHVhbCBhZGRyZXNzIHdyaXR0ZW4gYnkgZ3Vlc3QuCisJICog
QG5ldzogdGhlIGRhdGEgd2FzIHdyaXR0ZW4gdG8gdGhlIGFkZHJlc3MuCisJICogQGJ5dGVzOiB0
aGUgd3JpdHRlbiBsZW5ndGguCisJICogQG5vZGU6IHRoaXMgbm9kZQorCSAqLworCWJvb2wgKCp0
cmFja19wcmV3cml0ZSkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBncGFfdCBncGEsIGd2YV90IGd2
YSwKKwkJCSAgICAgICBjb25zdCB1OCAqbmV3LCBpbnQgYnl0ZXMsCisJCQkgICAgICAgc3RydWN0
IGt2bV9wYWdlX3RyYWNrX25vdGlmaWVyX25vZGUgKm5vZGUpOwogCS8qCiAJICogSXQgaXMgY2Fs
bGVkIHdoZW4gZ3Vlc3QgaXMgd3JpdGluZyB0aGUgd3JpdGUtdHJhY2tlZCBwYWdlCiAJICogYW5k
IHdyaXRlIGVtdWxhdGlvbiBpcyBmaW5pc2hlZCBhdCB0aGF0IHRpbWUuCkBAIC0zNiw2ICs2Niwx
NyBAQCBzdHJ1Y3Qga3ZtX3BhZ2VfdHJhY2tfbm90aWZpZXJfbm9kZSB7CiAJdm9pZCAoKnRyYWNr
X3dyaXRlKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdwYV90IGdwYSwgZ3ZhX3QgZ3ZhLAogCQkJ
ICAgIGNvbnN0IHU4ICpuZXcsIGludCBieXRlcywKIAkJCSAgICBzdHJ1Y3Qga3ZtX3BhZ2VfdHJh
Y2tfbm90aWZpZXJfbm9kZSAqbm9kZSk7CisJLyoKKwkgKiBJdCBpcyBjYWxsZWQgd2hlbiBndWVz
dCBpcyBmZXRjaGluZyBmcm9tIGEgZXhlYy10cmFja2VkIHBhZ2UKKwkgKiBhbmQgdGhlIGZldGNo
IGVtdWxhdGlvbiBpcyBhYm91dCB0byBoYXBwZW4uCisJICoKKwkgKiBAdmNwdTogdGhlIHZjcHUg
d2hlcmUgdGhlIGZldGNoIGFjY2VzcyBoYXBwZW5lZC4KKwkgKiBAZ3BhOiB0aGUgcGh5c2ljYWwg
YWRkcmVzcyBmZXRjaGVkIGJ5IGd1ZXN0LgorCSAqIEBndmE6IHRoZSB2aXJ0dWFsIGFkZHJlc3Mg
ZmV0Y2hlZCBieSBndWVzdC4KKwkgKiBAbm9kZTogdGhpcyBub2RlLgorCSAqLworCWJvb2wgKCp0
cmFja19wcmVleGVjKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdwYV90IGdwYSwgZ3ZhX3QgZ3Zh
LAorCQkJICAgICAgc3RydWN0IGt2bV9wYWdlX3RyYWNrX25vdGlmaWVyX25vZGUgKm5vZGUpOwog
CS8qCiAJICogSXQgaXMgY2FsbGVkIHdoZW4gbWVtb3J5IHNsb3QgaXMgYmVpbmcgY3JlYXRlZAog
CSAqCkBAIC00OSw3ICs5MCw3IEBAIHN0cnVjdCBrdm1fcGFnZV90cmFja19ub3RpZmllcl9ub2Rl
IHsKIAkJCQkgIHN0cnVjdCBrdm1fcGFnZV90cmFja19ub3RpZmllcl9ub2RlICpub2RlKTsKIAkv
KgogCSAqIEl0IGlzIGNhbGxlZCB3aGVuIG1lbW9yeSBzbG90IGlzIGJlaW5nIG1vdmVkIG9yIHJl
bW92ZWQKLQkgKiB1c2VycyBjYW4gZHJvcCB3cml0ZS1wcm90ZWN0aW9uIGZvciB0aGUgcGFnZXMg
aW4gdGhhdCBtZW1vcnkgc2xvdAorCSAqIHVzZXJzIGNhbiBkcm9wIGFjdGl2ZSBwcm90ZWN0aW9u
IGZvciB0aGUgcGFnZXMgaW4gdGhhdCBtZW1vcnkgc2xvdAogCSAqCiAJICogQGt2bTogdGhlIGt2
bSB3aGVyZSBtZW1vcnkgc2xvdCBiZWluZyBtb3ZlZCBvciByZW1vdmVkCiAJICogQHNsb3Q6IHRo
ZSBtZW1vcnkgc2xvdCBiZWluZyBtb3ZlZCBvciByZW1vdmVkCkBAIC04NSw3ICsxMjYsMTIgQEAg
a3ZtX3BhZ2VfdHJhY2tfcmVnaXN0ZXJfbm90aWZpZXIoc3RydWN0IGt2bSAqa3ZtLAogdm9pZAog
a3ZtX3BhZ2VfdHJhY2tfdW5yZWdpc3Rlcl9ub3RpZmllcihzdHJ1Y3Qga3ZtICprdm0sCiAJCQkJ
ICAgc3RydWN0IGt2bV9wYWdlX3RyYWNrX25vdGlmaWVyX25vZGUgKm4pOworYm9vbCBrdm1fcGFn
ZV90cmFja19wcmVyZWFkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3BhX3QgZ3BhLCBndmFfdCBn
dmEsCisJCQkgICAgaW50IGJ5dGVzKTsKK2Jvb2wga3ZtX3BhZ2VfdHJhY2tfcHJld3JpdGUoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCBncGFfdCBncGEsIGd2YV90IGd2YSwKKwkJCSAgICAgY29uc3Qg
dTggKm5ldywgaW50IGJ5dGVzKTsKIHZvaWQga3ZtX3BhZ2VfdHJhY2tfd3JpdGUoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCBncGFfdCBncGEsIGd2YV90IGd2YSwKIAkJCSAgY29uc3QgdTggKm5ldywg
aW50IGJ5dGVzKTsKK2Jvb2wga3ZtX3BhZ2VfdHJhY2tfcHJlZXhlYyhzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUsIGdwYV90IGdwYSwgZ3ZhX3QgZ3ZhKTsKIHZvaWQga3ZtX3BhZ2VfdHJhY2tfZmx1c2hf
c2xvdChzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QpOwogI2Vu
ZGlmCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vbW11L21tdS5jIGIvYXJjaC94ODYva3ZtL21t
dS9tbXUuYwppbmRleCBhODAyYzQ2ZDBlMTYuLjgxMjRmZGQ3OGFhZCAxMDA2NDQKLS0tIGEvYXJj
aC94ODYva3ZtL21tdS9tbXUuYworKysgYi9hcmNoL3g4Ni9rdm0vbW11L21tdS5jCkBAIC0xMjMx
LDYgKzEyMzEsMzEgQEAgc3RhdGljIGJvb2wgc3B0ZV93cml0ZV9wcm90ZWN0KHU2NCAqc3B0ZXAs
IGJvb2wgcHRfcHJvdGVjdCkKIAlyZXR1cm4gbW11X3NwdGVfdXBkYXRlKHNwdGVwLCBzcHRlKTsK
IH0KIAorc3RhdGljIGJvb2wgc3B0ZV9yZWFkX3Byb3RlY3QodTY0ICpzcHRlcCkKK3sKKwl1NjQg
c3B0ZSA9ICpzcHRlcDsKKwlib29sIGV4ZWNfb25seV9zdXBwb3J0ZWQgPSAoc2hhZG93X3ByZXNl
bnRfbWFzayA9PSAwdWxsKTsKKworCXJtYXBfcHJpbnRrKCJybWFwX3JlYWRfcHJvdGVjdDogc3B0
ZSAlcCAlbGx4XG4iLCBzcHRlcCwgKnNwdGVwKTsKKworCVdBUk5fT05fT05DRSghZXhlY19vbmx5
X3N1cHBvcnRlZCk7CisKKwlzcHRlID0gc3B0ZSAmIH4oUFRfV1JJVEFCTEVfTUFTSyB8IFBUX1BS
RVNFTlRfTUFTSyk7CisKKwlyZXR1cm4gbW11X3NwdGVfdXBkYXRlKHNwdGVwLCBzcHRlKTsKK30K
Kworc3RhdGljIGJvb2wgc3B0ZV9leGVjX3Byb3RlY3QodTY0ICpzcHRlcCkKK3sKKwl1NjQgc3B0
ZSA9ICpzcHRlcDsKKworCXJtYXBfcHJpbnRrKCJybWFwX2V4ZWNfcHJvdGVjdDogc3B0ZSAlcCAl
bGx4XG4iLCBzcHRlcCwgKnNwdGVwKTsKKworCXNwdGUgPSBzcHRlICYgflBUX1VTRVJfTUFTSzsK
KworCXJldHVybiBtbXVfc3B0ZV91cGRhdGUoc3B0ZXAsIHNwdGUpOworfQorCiBzdGF0aWMgYm9v
bCBfX3JtYXBfd3JpdGVfcHJvdGVjdChzdHJ1Y3Qga3ZtICprdm0sCiAJCQkJIHN0cnVjdCBrdm1f
cm1hcF9oZWFkICpybWFwX2hlYWQsCiAJCQkJIGJvb2wgcHRfcHJvdGVjdCkKQEAgLTEyNDUsNiAr
MTI3MCwzMiBAQCBzdGF0aWMgYm9vbCBfX3JtYXBfd3JpdGVfcHJvdGVjdChzdHJ1Y3Qga3ZtICpr
dm0sCiAJcmV0dXJuIGZsdXNoOwogfQogCitzdGF0aWMgYm9vbCBfX3JtYXBfcmVhZF9wcm90ZWN0
KHN0cnVjdCBrdm0gKmt2bSwKKwkJCQlzdHJ1Y3Qga3ZtX3JtYXBfaGVhZCAqcm1hcF9oZWFkKQor
eworCXN0cnVjdCBybWFwX2l0ZXJhdG9yIGl0ZXI7CisJYm9vbCBmbHVzaCA9IGZhbHNlOworCXU2
NCAqc3B0ZXA7CisKKwlmb3JfZWFjaF9ybWFwX3NwdGUocm1hcF9oZWFkLCAmaXRlciwgc3B0ZXAp
CisJCWZsdXNoIHw9IHNwdGVfcmVhZF9wcm90ZWN0KHNwdGVwKTsKKworCXJldHVybiBmbHVzaDsK
K30KKworc3RhdGljIGJvb2wgX19ybWFwX2V4ZWNfcHJvdGVjdChzdHJ1Y3Qga3ZtICprdm0sCisJ
CQkJc3RydWN0IGt2bV9ybWFwX2hlYWQgKnJtYXBfaGVhZCkKK3sKKwlzdHJ1Y3Qgcm1hcF9pdGVy
YXRvciBpdGVyOworCWJvb2wgZmx1c2ggPSBmYWxzZTsKKwl1NjQgKnNwdGVwOworCisJZm9yX2Vh
Y2hfcm1hcF9zcHRlKHJtYXBfaGVhZCwgJml0ZXIsIHNwdGVwKQorCQlmbHVzaCB8PSBzcHRlX2V4
ZWNfcHJvdGVjdChzcHRlcCk7CisKKwlyZXR1cm4gZmx1c2g7Cit9CisKIHN0YXRpYyBib29sIHNw
dGVfY2xlYXJfZGlydHkodTY0ICpzcHRlcCkKIHsKIAl1NjQgc3B0ZSA9ICpzcHRlcDsKQEAgLTE0
MjMsNiArMTQ3NCw1MCBAQCBib29sIGt2bV9tbXVfc2xvdF9nZm5fd3JpdGVfcHJvdGVjdChzdHJ1
Y3Qga3ZtICprdm0sCiAJcmV0dXJuIHdyaXRlX3Byb3RlY3RlZDsKIH0KIAorYm9vbCBrdm1fbW11
X3Nsb3RfZ2ZuX3JlYWRfcHJvdGVjdChzdHJ1Y3Qga3ZtICprdm0sCisJCQkJICAgc3RydWN0IGt2
bV9tZW1vcnlfc2xvdCAqc2xvdCwgdTY0IGdmbiwKKwkJCQkgICBpbnQgbWluX2xldmVsKQorewor
CXN0cnVjdCBrdm1fcm1hcF9oZWFkICpybWFwX2hlYWQ7CisJYm9vbCByZWFkX3Byb3RlY3RlZCA9
IGZhbHNlOworCWludCBpOworCisJaWYgKGt2bV9tZW1zbG90c19oYXZlX3JtYXBzKGt2bSkpIHsK
KwkJZm9yIChpID0gbWluX2xldmVsOyBpIDw9IEtWTV9NQVhfSFVHRVBBR0VfTEVWRUw7ICsraSkg
eworCQkJcm1hcF9oZWFkID0gZ2ZuX3RvX3JtYXAoZ2ZuLCBpLCBzbG90KTsKKwkJCXJlYWRfcHJv
dGVjdGVkIHw9IF9fcm1hcF9yZWFkX3Byb3RlY3Qoa3ZtLCBybWFwX2hlYWQpOworCQl9CisJfQor
CisJaWYgKGlzX3RkcF9tbXVfZW5hYmxlZChrdm0pKQorCQlyZWFkX3Byb3RlY3RlZCB8PQorCQkJ
a3ZtX3RkcF9tbXVfcmVhZF9wcm90ZWN0X2dmbihrdm0sIHNsb3QsIGdmbiwgbWluX2xldmVsKTsK
KworCXJldHVybiByZWFkX3Byb3RlY3RlZDsKK30KKworYm9vbCBrdm1fbW11X3Nsb3RfZ2ZuX2V4
ZWNfcHJvdGVjdChzdHJ1Y3Qga3ZtICprdm0sCisJCQkJICAgc3RydWN0IGt2bV9tZW1vcnlfc2xv
dCAqc2xvdCwgdTY0IGdmbiwKKwkJCQkgICBpbnQgbWluX2xldmVsKQoreworCXN0cnVjdCBrdm1f
cm1hcF9oZWFkICpybWFwX2hlYWQ7CisJYm9vbCBleGVjX3Byb3RlY3RlZCA9IGZhbHNlOworCWlu
dCBpOworCisJaWYgKGt2bV9tZW1zbG90c19oYXZlX3JtYXBzKGt2bSkpIHsKKwkJZm9yIChpID0g
bWluX2xldmVsOyBpIDw9IEtWTV9NQVhfSFVHRVBBR0VfTEVWRUw7ICsraSkgeworCQkJcm1hcF9o
ZWFkID0gZ2ZuX3RvX3JtYXAoZ2ZuLCBpLCBzbG90KTsKKwkJCWV4ZWNfcHJvdGVjdGVkIHw9IF9f
cm1hcF9leGVjX3Byb3RlY3Qoa3ZtLCBybWFwX2hlYWQpOworCQl9CisJfQorCisJaWYgKGlzX3Rk
cF9tbXVfZW5hYmxlZChrdm0pKQorCQlleGVjX3Byb3RlY3RlZCB8PQorCQkJa3ZtX3RkcF9tbXVf
ZXhlY19wcm90ZWN0X2dmbihrdm0sIHNsb3QsIGdmbiwgbWluX2xldmVsKTsKKworCXJldHVybiBl
eGVjX3Byb3RlY3RlZDsKK30KKwogc3RhdGljIGJvb2wgcm1hcF93cml0ZV9wcm90ZWN0KHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSwgdTY0IGdmbikKIHsKIAlzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpz
bG90OwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL21tdS9tbXVfaW50ZXJuYWwuaCBiL2FyY2gv
eDg2L2t2bS9tbXUvbW11X2ludGVybmFsLmgKaW5kZXggNTg1MTQ2YTcxMmQyLi5kZDVmYjQ4ZTg0
MzMgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9tbXUvbW11X2ludGVybmFsLmgKKysrIGIvYXJj
aC94ODYva3ZtL21tdS9tbXVfaW50ZXJuYWwuaApAQCAtMTI2LDYgKzEyNiwxMiBAQCB2b2lkIGt2
bV9tbXVfZ2ZuX2FsbG93X2xwYWdlKGNvbnN0IHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3Qs
IGdmbl90IGdmbik7CiBib29sIGt2bV9tbXVfc2xvdF9nZm5fd3JpdGVfcHJvdGVjdChzdHJ1Y3Qg
a3ZtICprdm0sCiAJCQkJICAgIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QsIHU2NCBnZm4s
CiAJCQkJICAgIGludCBtaW5fbGV2ZWwpOworYm9vbCBrdm1fbW11X3Nsb3RfZ2ZuX3JlYWRfcHJv
dGVjdChzdHJ1Y3Qga3ZtICprdm0sCisJCQkJICAgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqc2xv
dCwgdTY0IGdmbiwKKwkJCQkgICBpbnQgbWluX2xldmVsKTsKK2Jvb2wga3ZtX21tdV9zbG90X2dm
bl9leGVjX3Byb3RlY3Qoc3RydWN0IGt2bSAqa3ZtLAorCQkJCSAgIHN0cnVjdCBrdm1fbWVtb3J5
X3Nsb3QgKnNsb3QsIHU2NCBnZm4sCisJCQkJICAgaW50IG1pbl9sZXZlbCk7CiB2b2lkIGt2bV9m
bHVzaF9yZW1vdGVfdGxic193aXRoX2FkZHJlc3Moc3RydWN0IGt2bSAqa3ZtLAogCQkJCQl1NjQg
c3RhcnRfZ2ZuLCB1NjQgcGFnZXMpOwogdW5zaWduZWQgaW50IHB0ZV9saXN0X2NvdW50KHN0cnVj
dCBrdm1fcm1hcF9oZWFkICpybWFwX2hlYWQpOwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL21t
dS9wYWdlX3RyYWNrLmMgYi9hcmNoL3g4Ni9rdm0vbW11L3BhZ2VfdHJhY2suYwppbmRleCBmMThi
ZTE3YjU2YTMuLjU2YjNjNzIxZTVlOSAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL21tdS9wYWdl
X3RyYWNrLmMKKysrIGIvYXJjaC94ODYva3ZtL21tdS9wYWdlX3RyYWNrLmMKQEAgLTEsNiArMSw2
IEBACiAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5CiAvKgotICogU3Vw
cG9ydCBLVk0gZ3VzdCBwYWdlIHRyYWNraW5nCisgKiBTdXBwb3J0IEtWTSBndWVzdCBwYWdlIHRy
YWNraW5nCiAgKgogICogVGhpcyBmZWF0dXJlIGFsbG93cyB1cyB0byB0cmFjayBwYWdlIGFjY2Vz
cyBpbiBndWVzdC4gQ3VycmVudGx5LCBvbmx5CiAgKiB3cml0ZSBhY2Nlc3MgaXMgdHJhY2tlZC4K
QEAgLTE1MSw3ICsxNTEsNyBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfZ2ZuX3RyYWNrKHN0cnVjdCBr
dm1fbWVtb3J5X3Nsb3QgKnNsb3QsIGdmbl90IGdmbiwKICAqIEBrdm06IHRoZSBndWVzdCBpbnN0
YW5jZSB3ZSBhcmUgaW50ZXJlc3RlZCBpbi4KICAqIEBzbG90OiB0aGUgQGdmbiBiZWxvbmdzIHRv
LgogICogQGdmbjogdGhlIGd1ZXN0IHBhZ2UuCi0gKiBAbW9kZTogdHJhY2tpbmcgbW9kZSwgY3Vy
cmVudGx5IG9ubHkgd3JpdGUgdHJhY2sgaXMgc3VwcG9ydGVkLgorICogQG1vZGU6IHRyYWNraW5n
IG1vZGUuCiAgKi8KIHZvaWQga3ZtX3Nsb3RfcGFnZV90cmFja19hZGRfcGFnZShzdHJ1Y3Qga3Zt
ICprdm0sCiAJCQkJICBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90LCBnZm5fdCBnZm4sCkBA
IC0xNzMsOSArMTczLDE2IEBAIHZvaWQga3ZtX3Nsb3RfcGFnZV90cmFja19hZGRfcGFnZShzdHJ1
Y3Qga3ZtICprdm0sCiAJICovCiAJa3ZtX21tdV9nZm5fZGlzYWxsb3dfbHBhZ2Uoc2xvdCwgZ2Zu
KTsKIAotCWlmIChtb2RlID09IEtWTV9QQUdFX1RSQUNLX1dSSVRFKQorCWlmIChtb2RlID09IEtW
TV9QQUdFX1RSQUNLX1dSSVRFKSB7CiAJCWlmIChrdm1fbW11X3Nsb3RfZ2ZuX3dyaXRlX3Byb3Rl
Y3Qoa3ZtLCBzbG90LCBnZm4sIFBHX0xFVkVMXzRLKSkKIAkJCWt2bV9mbHVzaF9yZW1vdGVfdGxi
cyhrdm0pOworCX0gZWxzZSBpZiAobW9kZSA9PSBLVk1fUEFHRV9UUkFDS19QUkVSRUFEKSB7CisJ
CWlmIChrdm1fbW11X3Nsb3RfZ2ZuX3JlYWRfcHJvdGVjdChrdm0sIHNsb3QsIGdmbiwgUEdfTEVW
RUxfNEspKQorCQkJa3ZtX2ZsdXNoX3JlbW90ZV90bGJzKGt2bSk7CisJfSBlbHNlIGlmIChtb2Rl
ID09IEtWTV9QQUdFX1RSQUNLX1BSRUVYRUMpIHsKKwkJaWYgKGt2bV9tbXVfc2xvdF9nZm5fZXhl
Y19wcm90ZWN0KGt2bSwgc2xvdCwgZ2ZuLCBQR19MRVZFTF80SykpCisJCQlrdm1fZmx1c2hfcmVt
b3RlX3RsYnMoa3ZtKTsKKwl9CiB9CiBFWFBPUlRfU1lNQk9MX0dQTChrdm1fc2xvdF9wYWdlX3Ry
YWNrX2FkZF9wYWdlKTsKIApAQCAtMTkwLDcgKzE5Nyw3IEBAIEVYUE9SVF9TWU1CT0xfR1BMKGt2
bV9zbG90X3BhZ2VfdHJhY2tfYWRkX3BhZ2UpOwogICogQGt2bTogdGhlIGd1ZXN0IGluc3RhbmNl
IHdlIGFyZSBpbnRlcmVzdGVkIGluLgogICogQHNsb3Q6IHRoZSBAZ2ZuIGJlbG9uZ3MgdG8uCiAg
KiBAZ2ZuOiB0aGUgZ3Vlc3QgcGFnZS4KLSAqIEBtb2RlOiB0cmFja2luZyBtb2RlLCBjdXJyZW50
bHkgb25seSB3cml0ZSB0cmFjayBpcyBzdXBwb3J0ZWQuCisgKiBAbW9kZTogdHJhY2tpbmcgbW9k
ZS4KICAqLwogdm9pZCBrdm1fc2xvdF9wYWdlX3RyYWNrX3JlbW92ZV9wYWdlKHN0cnVjdCBrdm0g
Kmt2bSwKIAkJCQkgICAgIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QsIGdmbl90IGdmbiwK
QEAgLTI4OSwxMiArMjk2LDgwIEBAIGt2bV9wYWdlX3RyYWNrX3VucmVnaXN0ZXJfbm90aWZpZXIo
c3RydWN0IGt2bSAqa3ZtLAogfQogRVhQT1JUX1NZTUJPTF9HUEwoa3ZtX3BhZ2VfdHJhY2tfdW5y
ZWdpc3Rlcl9ub3RpZmllcik7CiAKKy8qCisgKiBOb3RpZnkgdGhlIG5vZGUgdGhhdCBhIHJlYWQg
YWNjZXNzIGlzIGFib3V0IHRvIGhhcHBlbi4gUmV0dXJuaW5nIGZhbHNlCisgKiBkb2Vzbid0IHN0
b3AgdGhlIG90aGVyIG5vZGVzIGZyb20gYmVpbmcgY2FsbGVkLCBidXQgaXQgd2lsbCBzdG9wCisg
KiB0aGUgZW11bGF0aW9uLgorICoKKyAqIFRoZSBub2RlIHNob3VsZCBmaWd1cmUgb3V0IGlmIHRo
ZSByZWFkIHBhZ2UgaXMgdGhlIG9uZSB0aGF0IHRoZSBub2RlCisgKiBpcyBpbnRlcmVzdGVkIGlu
IGJ5IGl0c2VsZi4KKyAqCisgKiBUaGUgbm9kZXMgd2lsbCBhbHdheXMgYmUgaW4gY29uZmxpY3Qg
aWYgdGhleSB0cmFjayB0aGUgc2FtZSBwYWdlOgorICogLSBhY2NlcHRpbmcgYSByZWFkIHdvbid0
IGd1YXJhbnRlZSB0aGF0IHRoZSBuZXh0IG5vZGUgd2lsbCBub3Qgb3ZlcnJpZGUKKyAqICAgdGhl
IGRhdGEgKGZpbGxpbmcgbmV3L2J5dGVzIGFuZCBzZXR0aW5nIGRhdGFfcmVhZHkpCisgKiAtIGZp
bGxpbmcgbmV3L2J5dGVzIHdpdGggY3VzdG9tIGRhdGEgd29uJ3QgZ3VhcmFudGVlIHRoYXQgdGhl
IG5leHQgbm9kZQorICogICB3aWxsIG5vdCBvdmVycmlkZSB0aGF0CisgKi8KK2Jvb2wga3ZtX3Bh
Z2VfdHJhY2tfcHJlcmVhZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdwYV90IGdwYSwgZ3ZhX3Qg
Z3ZhLAorCQkJICAgIGludCBieXRlcykKK3sKKwlzdHJ1Y3Qga3ZtX3BhZ2VfdHJhY2tfbm90aWZp
ZXJfaGVhZCAqaGVhZDsKKwlzdHJ1Y3Qga3ZtX3BhZ2VfdHJhY2tfbm90aWZpZXJfbm9kZSAqbjsK
KwlpbnQgaWR4OworCWJvb2wgcmV0ID0gdHJ1ZTsKKworCWhlYWQgPSAmdmNwdS0+a3ZtLT5hcmNo
LnRyYWNrX25vdGlmaWVyX2hlYWQ7CisKKwlpZiAoaGxpc3RfZW1wdHkoJmhlYWQtPnRyYWNrX25v
dGlmaWVyX2xpc3QpKQorCQlyZXR1cm4gcmV0OworCisJaWR4ID0gc3JjdV9yZWFkX2xvY2soJmhl
YWQtPnRyYWNrX3NyY3UpOworCWhsaXN0X2Zvcl9lYWNoX2VudHJ5X3NyY3UobiwgJmhlYWQtPnRy
YWNrX25vdGlmaWVyX2xpc3QsIG5vZGUsCisJCQkJc3JjdV9yZWFkX2xvY2tfaGVsZCgmaGVhZC0+
dHJhY2tfc3JjdSkpCisJCWlmIChuLT50cmFja19wcmVyZWFkKQorCQkJaWYgKCFuLT50cmFja19w
cmVyZWFkKHZjcHUsIGdwYSwgZ3ZhLCBieXRlcywgbikpCisJCQkJcmV0ID0gZmFsc2U7CisJc3Jj
dV9yZWFkX3VubG9jaygmaGVhZC0+dHJhY2tfc3JjdSwgaWR4KTsKKwlyZXR1cm4gcmV0OworfQor
CisvKgorICogTm90aWZ5IHRoZSBub2RlIHRoYXQgYSB3cml0ZSBhY2Nlc3MgaXMgYWJvdXQgdG8g
aGFwcGVuLiBSZXR1cm5pbmcgZmFsc2UKKyAqIGRvZXNuJ3Qgc3RvcCB0aGUgb3RoZXIgbm9kZXMg
ZnJvbSBiZWluZyBjYWxsZWQsIGJ1dCBpdCB3aWxsIHN0b3AKKyAqIHRoZSBlbXVsYXRpb24uCisg
KgorICogVGhlIG5vZGUgc2hvdWxkIGZpZ3VyZSBvdXQgaWYgdGhlIHdyaXR0ZW4gcGFnZSBpcyB0
aGUgb25lIHRoYXQgdGhlIG5vZGUKKyAqIGlzIGludGVyZXN0ZWQgaW4gYnkgaXRzZWxmLgorICov
Citib29sIGt2bV9wYWdlX3RyYWNrX3ByZXdyaXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3Bh
X3QgZ3BhLCBndmFfdCBndmEsCisJCQkgICAgIGNvbnN0IHU4ICpuZXcsIGludCBieXRlcykKK3sK
KwlzdHJ1Y3Qga3ZtX3BhZ2VfdHJhY2tfbm90aWZpZXJfaGVhZCAqaGVhZDsKKwlzdHJ1Y3Qga3Zt
X3BhZ2VfdHJhY2tfbm90aWZpZXJfbm9kZSAqbjsKKwlpbnQgaWR4OworCWJvb2wgcmV0ID0gdHJ1
ZTsKKworCWhlYWQgPSAmdmNwdS0+a3ZtLT5hcmNoLnRyYWNrX25vdGlmaWVyX2hlYWQ7CisKKwlp
ZiAoaGxpc3RfZW1wdHkoJmhlYWQtPnRyYWNrX25vdGlmaWVyX2xpc3QpKQorCQlyZXR1cm4gcmV0
OworCisJaWR4ID0gc3JjdV9yZWFkX2xvY2soJmhlYWQtPnRyYWNrX3NyY3UpOworCWhsaXN0X2Zv
cl9lYWNoX2VudHJ5X3NyY3UobiwgJmhlYWQtPnRyYWNrX25vdGlmaWVyX2xpc3QsIG5vZGUsCisJ
CQkJc3JjdV9yZWFkX2xvY2tfaGVsZCgmaGVhZC0+dHJhY2tfc3JjdSkpCisJCWlmIChuLT50cmFj
a19wcmV3cml0ZSkKKwkJCWlmICghbi0+dHJhY2tfcHJld3JpdGUodmNwdSwgZ3BhLCBndmEsIG5l
dywgYnl0ZXMsIG4pKQorCQkJCXJldCA9IGZhbHNlOworCXNyY3VfcmVhZF91bmxvY2soJmhlYWQt
PnRyYWNrX3NyY3UsIGlkeCk7CisJcmV0dXJuIHJldDsKK30KKwogLyoKICAqIE5vdGlmeSB0aGUg
bm9kZSB0aGF0IHdyaXRlIGFjY2VzcyBpcyBpbnRlcmNlcHRlZCBhbmQgd3JpdGUgZW11bGF0aW9u
IGlzCiAgKiBmaW5pc2hlZCBhdCB0aGlzIHRpbWUuCiAgKgotICogVGhlIG5vZGUgc2hvdWxkIGZp
Z3VyZSBvdXQgaWYgdGhlIHdyaXR0ZW4gcGFnZSBpcyB0aGUgb25lIHRoYXQgbm9kZSBpcwotICog
aW50ZXJlc3RlZCBpbiBieSBpdHNlbGYuCisgKiBUaGUgbm9kZSBzaG91bGQgZmlndXJlIG91dCBp
ZiB0aGUgd3JpdHRlbiBwYWdlIGlzIHRoZSBvbmUgdGhhdCB0aGUgbm9kZQorICogaXMgaW50ZXJl
c3RlZCBpbiBieSBpdHNlbGYuCiAgKi8KIHZvaWQga3ZtX3BhZ2VfdHJhY2tfd3JpdGUoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LCBncGFfdCBncGEsIGd2YV90IGd2YSwKIAkJCSAgY29uc3QgdTggKm5l
dywgaW50IGJ5dGVzKQpAQCAtMzE2LDEyICszOTEsNDIgQEAgdm9pZCBrdm1fcGFnZV90cmFja193
cml0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdwYV90IGdwYSwgZ3ZhX3QgZ3ZhLAogCXNyY3Vf
cmVhZF91bmxvY2soJmhlYWQtPnRyYWNrX3NyY3UsIGlkeCk7CiB9CiAKKy8qCisgKiBOb3RpZnkg
dGhlIG5vZGUgdGhhdCBhbiBpbnN0cnVjdGlvbiBpcyBhYm91dCB0byBiZSBleGVjdXRlZC4KKyAq
IFJldHVybmluZyBmYWxzZSBkb2Vzbid0IHN0b3AgdGhlIG90aGVyIG5vZGVzIGZyb20gYmVpbmcg
Y2FsbGVkLAorICogYnV0IGl0IHdpbGwgc3RvcCB0aGUgZW11bGF0aW9uIHdpdGggWDg2RU1VTF9S
RVRSWV9JTlNUUi4KKyAqCisgKiBUaGUgbm9kZSBzaG91bGQgZmlndXJlIG91dCBpZiB0aGUgcGFn
ZSBpcyB0aGUgb25lIHRoYXQgdGhlIG5vZGUKKyAqIGlzIGludGVyZXN0ZWQgaW4gYnkgaXRzZWxm
LgorICovCitib29sIGt2bV9wYWdlX3RyYWNrX3ByZWV4ZWMoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LCBncGFfdCBncGEsIGd2YV90IGd2YSkKK3sKKwlzdHJ1Y3Qga3ZtX3BhZ2VfdHJhY2tfbm90aWZp
ZXJfaGVhZCAqaGVhZDsKKwlzdHJ1Y3Qga3ZtX3BhZ2VfdHJhY2tfbm90aWZpZXJfbm9kZSAqbjsK
KwlpbnQgaWR4OworCWJvb2wgcmV0ID0gdHJ1ZTsKKworCWhlYWQgPSAmdmNwdS0+a3ZtLT5hcmNo
LnRyYWNrX25vdGlmaWVyX2hlYWQ7CisKKwlpZiAoaGxpc3RfZW1wdHkoJmhlYWQtPnRyYWNrX25v
dGlmaWVyX2xpc3QpKQorCQlyZXR1cm4gcmV0OworCisJaWR4ID0gc3JjdV9yZWFkX2xvY2soJmhl
YWQtPnRyYWNrX3NyY3UpOworCWhsaXN0X2Zvcl9lYWNoX2VudHJ5X3NyY3UobiwgJmhlYWQtPnRy
YWNrX25vdGlmaWVyX2xpc3QsIG5vZGUsCisJCQkJc3JjdV9yZWFkX2xvY2tfaGVsZCgmaGVhZC0+
dHJhY2tfc3JjdSkpCisJCWlmIChuLT50cmFja19wcmVleGVjKQorCQkJaWYgKCFuLT50cmFja19w
cmVleGVjKHZjcHUsIGdwYSwgZ3ZhLCBuKSkKKwkJCQlyZXQgPSBmYWxzZTsKKwlzcmN1X3JlYWRf
dW5sb2NrKCZoZWFkLT50cmFja19zcmN1LCBpZHgpOworCXJldHVybiByZXQ7Cit9CisKIC8qCiAg
KiBOb3RpZnkgdGhlIG5vZGUgdGhhdCBtZW1vcnkgc2xvdCBpcyBiZWluZyByZW1vdmVkIG9yIG1v
dmVkIHNvIHRoYXQgaXQgY2FuCi0gKiBkcm9wIHdyaXRlLXByb3RlY3Rpb24gZm9yIHRoZSBwYWdl
cyBpbiB0aGUgbWVtb3J5IHNsb3QuCisgKiBkcm9wIGFjdGl2ZSBwcm90ZWN0aW9uIGZvciB0aGUg
cGFnZXMgaW4gdGhlIG1lbW9yeSBzbG90LgogICoKLSAqIFRoZSBub2RlIHNob3VsZCBmaWd1cmUg
b3V0IGl0IGhhcyBhbnkgd3JpdGUtcHJvdGVjdGVkIHBhZ2VzIGluIHRoaXMgc2xvdAotICogYnkg
aXRzZWxmLgorICogVGhlIG5vZGUgc2hvdWxkIGZpZ3VyZSBvdXQgaWYgdGhlIHBhZ2UgaXMgdGhl
IG9uZSB0aGF0IHRoZSBub2RlCisgKiBpcyBpbnRlcmVzdGVkIGluIGJ5IGl0c2VsZi4KICAqLwog
dm9pZCBrdm1fcGFnZV90cmFja19mbHVzaF9zbG90KHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2
bV9tZW1vcnlfc2xvdCAqc2xvdCkKIHsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9tbXUvdGRw
X21tdS5jIGIvYXJjaC94ODYva3ZtL21tdS90ZHBfbW11LmMKaW5kZXggOTUzZjI0ZGVkNmJjLi44
NjY3NDA0N2Y1M2EgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9tbXUvdGRwX21tdS5jCisrKyBi
L2FyY2gveDg2L2t2bS9tbXUvdGRwX21tdS5jCkBAIC0xNDgzLDYgKzE0ODMsMTEyIEBAIGJvb2wg
a3ZtX3RkcF9tbXVfd3JpdGVfcHJvdGVjdF9nZm4oc3RydWN0IGt2bSAqa3ZtLAogCXJldHVybiBz
cHRlX3NldDsKIH0KIAorLyoKKyAqIFJlbW92ZXMgcmVhZC93cml0ZSBhY2Nlc3Mgb24gdGhlIGxh
c3QgbGV2ZWwgU1BURSBtYXBwaW5nIHRoaXMgR0ZOLgorICogUmV0dXJucyB0cnVlIGlmIGFuIFNQ
VEUgd2FzIHNldCBhbmQgYSBUTEIgZmx1c2ggaXMgbmVlZGVkLgorICovCitzdGF0aWMgYm9vbCBy
ZWFkX3Byb3RlY3RfZ2ZuKHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bV9tbXVfcGFnZSAqcm9v
dCwKKwkJCSAgICAgZ2ZuX3QgZ2ZuLCBpbnQgbWluX2xldmVsKQoreworCWJvb2wgZXhlY19vbmx5
X3N1cHBvcnRlZCA9IChzaGFkb3dfcHJlc2VudF9tYXNrID09IDB1bGwpOworCXN0cnVjdCB0ZHBf
aXRlciBpdGVyOworCXU2NCBuZXdfc3B0ZTsKKwlib29sIHNwdGVfc2V0ID0gZmFsc2U7CisKKwlX
QVJOX09OX09OQ0UoIWV4ZWNfb25seV9zdXBwb3J0ZWQpOworCisJcmN1X3JlYWRfbG9jaygpOwor
CisJZm9yX2VhY2hfdGRwX3B0ZV9taW5fbGV2ZWwoaXRlciwgcm9vdC0+c3B0LCByb290LT5yb2xl
LmxldmVsLAorCQkJCSAgIG1pbl9sZXZlbCwgZ2ZuLCBnZm4gKyAxKSB7CisJCWlmICghaXNfc2hh
ZG93X3ByZXNlbnRfcHRlKGl0ZXIub2xkX3NwdGUpIHx8CisJCSAgICAhaXNfbGFzdF9zcHRlKGl0
ZXIub2xkX3NwdGUsIGl0ZXIubGV2ZWwpKQorCQkJY29udGludWU7CisKKwkJaWYgKChpdGVyLm9s
ZF9zcHRlICYgKFBUX1dSSVRBQkxFX01BU0sgfCBQVF9QUkVTRU5UX01BU0spKSA9PSAwKQorCQkJ
YnJlYWs7CisKKwkJbmV3X3NwdGUgPSBpdGVyLm9sZF9zcHRlICYKKwkJCX4oUFRfV1JJVEFCTEVf
TUFTSyB8IFBUX1BSRVNFTlRfTUFTSyB8IHNoYWRvd19tbXVfd3JpdGFibGVfbWFzayk7CisKKwkJ
dGRwX21tdV9zZXRfc3B0ZShrdm0sICZpdGVyLCBuZXdfc3B0ZSk7CisJCXNwdGVfc2V0ID0gdHJ1
ZTsKKwl9CisKKwlyY3VfcmVhZF91bmxvY2soKTsKKworCXJldHVybiBzcHRlX3NldDsKK30KKwor
LyoKKyAqIFJlbW92ZXMgcmVhZC93cml0ZSBhY2Nlc3Mgb24gdGhlIGxhc3QgbGV2ZWwgU1BURSBt
YXBwaW5nIHRoaXMgR0ZOLgorICogUmV0dXJucyB0cnVlIGlmIGFuIFNQVEUgd2FzIHNldCBhbmQg
YSBUTEIgZmx1c2ggaXMgbmVlZGVkLgorICovCitib29sIGt2bV90ZHBfbW11X3JlYWRfcHJvdGVj
dF9nZm4oc3RydWN0IGt2bSAqa3ZtLAorCQkJCSAgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqc2xv
dCwgZ2ZuX3QgZ2ZuLAorCQkJCSAgaW50IG1pbl9sZXZlbCkKK3sKKwlzdHJ1Y3Qga3ZtX21tdV9w
YWdlICpyb290OworCWJvb2wgc3B0ZV9zZXQgPSBmYWxzZTsKKworCWxvY2tkZXBfYXNzZXJ0X2hl
bGRfd3JpdGUoJmt2bS0+bW11X2xvY2spOworCWZvcl9lYWNoX3RkcF9tbXVfcm9vdChrdm0sIHJv
b3QsIHNsb3QtPmFzX2lkKQorCQlzcHRlX3NldCB8PSByZWFkX3Byb3RlY3RfZ2ZuKGt2bSwgcm9v
dCwgZ2ZuLCBtaW5fbGV2ZWwpOworCisJcmV0dXJuIHNwdGVfc2V0OworfQorCisvKgorICogUmVt
b3ZlcyBleGN1dGUgYWNjZXNzIG9uIHRoZSBsYXN0IGxldmVsIFNQVEUgbWFwcGluZyB0aGlzIEdG
Ti4KKyAqIFJldHVybnMgdHJ1ZSBpZiBhbiBTUFRFIHdhcyBzZXQgYW5kIGEgVExCIGZsdXNoIGlz
IG5lZWRlZC4KKyAqLworc3RhdGljIGJvb2wgZXhlY19wcm90ZWN0X2dmbihzdHJ1Y3Qga3ZtICpr
dm0sIHN0cnVjdCBrdm1fbW11X3BhZ2UgKnJvb3QsCisJCQkgICAgIGdmbl90IGdmbiwgaW50IG1p
bl9sZXZlbCkKK3sKKwlzdHJ1Y3QgdGRwX2l0ZXIgaXRlcjsKKwl1NjQgbmV3X3NwdGU7CisJYm9v
bCBzcHRlX3NldCA9IGZhbHNlOworCisJcmN1X3JlYWRfbG9jaygpOworCisJZm9yX2VhY2hfdGRw
X3B0ZV9taW5fbGV2ZWwoaXRlciwgcm9vdC0+c3B0LCByb290LT5yb2xlLmxldmVsLAorCQkJCSAg
IG1pbl9sZXZlbCwgZ2ZuLCBnZm4gKyAxKSB7CisJCWlmICghaXNfc2hhZG93X3ByZXNlbnRfcHRl
KGl0ZXIub2xkX3NwdGUpIHx8CisJCSAgICAhaXNfbGFzdF9zcHRlKGl0ZXIub2xkX3NwdGUsIGl0
ZXIubGV2ZWwpKQorCQkJY29udGludWU7CisKKwkJaWYgKChpdGVyLm9sZF9zcHRlICYgUFRfVVNF
Ul9NQVNLKSA9PSAwKQorCQkJYnJlYWs7CisKKwkJbmV3X3NwdGUgPSBpdGVyLm9sZF9zcHRlICYg
flBUX1VTRVJfTUFTSzsKKworCQl0ZHBfbW11X3NldF9zcHRlKGt2bSwgJml0ZXIsIG5ld19zcHRl
KTsKKwkJc3B0ZV9zZXQgPSB0cnVlOworCX0KKworCXJjdV9yZWFkX3VubG9jaygpOworCisJcmV0
dXJuIHNwdGVfc2V0OworfQorCisvKgorICogUmVtb3ZlcyBleGN1dGUgYWNjZXNzIG9uIHRoZSBs
YXN0IGxldmVsIFNQVEUgbWFwcGluZyB0aGlzIEdGTi4KKyAqIFJldHVybnMgdHJ1ZSBpZiBhbiBT
UFRFIHdhcyBzZXQgYW5kIGEgVExCIGZsdXNoIGlzIG5lZWRlZC4KKyAqLworYm9vbCBrdm1fdGRw
X21tdV9leGVjX3Byb3RlY3RfZ2ZuKHN0cnVjdCBrdm0gKmt2bSwKKwkJCQkgIHN0cnVjdCBrdm1f
bWVtb3J5X3Nsb3QgKnNsb3QsIGdmbl90IGdmbiwKKwkJCQkgIGludCBtaW5fbGV2ZWwpCit7CisJ
c3RydWN0IGt2bV9tbXVfcGFnZSAqcm9vdDsKKwlib29sIHNwdGVfc2V0ID0gZmFsc2U7CisKKwls
b2NrZGVwX2Fzc2VydF9oZWxkX3dyaXRlKCZrdm0tPm1tdV9sb2NrKTsKKwlmb3JfZWFjaF90ZHBf
bW11X3Jvb3Qoa3ZtLCByb290LCBzbG90LT5hc19pZCkKKwkJc3B0ZV9zZXQgfD0gZXhlY19wcm90
ZWN0X2dmbihrdm0sIHJvb3QsIGdmbiwgbWluX2xldmVsKTsKKworCXJldHVybiBzcHRlX3NldDsK
K30KKwogLyoKICAqIFJldHVybiB0aGUgbGV2ZWwgb2YgdGhlIGxvd2VzdCBsZXZlbCBTUFRFIGFk
ZGVkIHRvIHNwdGVzLgogICogVGhhdCBTUFRFIG1heSBiZSBub24tcHJlc2VudC4KZGlmZiAtLWdp
dCBhL2FyY2gveDg2L2t2bS9tbXUvdGRwX21tdS5oIGIvYXJjaC94ODYva3ZtL21tdS90ZHBfbW11
LmgKaW5kZXggY2VhZjdmZjNjYTdjLi41ZDJkNGQ2MmUyZjMgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2
L2t2bS9tbXUvdGRwX21tdS5oCisrKyBiL2FyY2gveDg2L2t2bS9tbXUvdGRwX21tdS5oCkBAIC03
MSw2ICs3MSwxMiBAQCBib29sIGt2bV90ZHBfbW11X3phcF9jb2xsYXBzaWJsZV9zcHRlcyhzdHJ1
Y3Qga3ZtICprdm0sCiBib29sIGt2bV90ZHBfbW11X3dyaXRlX3Byb3RlY3RfZ2ZuKHN0cnVjdCBr
dm0gKmt2bSwKIAkJCQkgICBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90LCBnZm5fdCBnZm4s
CiAJCQkJICAgaW50IG1pbl9sZXZlbCk7Citib29sIGt2bV90ZHBfbW11X3JlYWRfcHJvdGVjdF9n
Zm4oc3RydWN0IGt2bSAqa3ZtLAorCQkJCSAgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqc2xvdCwg
Z2ZuX3QgZ2ZuLAorCQkJCSAgaW50IG1pbl9sZXZlbCk7Citib29sIGt2bV90ZHBfbW11X2V4ZWNf
cHJvdGVjdF9nZm4oc3RydWN0IGt2bSAqa3ZtLAorCQkJCSAgc3RydWN0IGt2bV9tZW1vcnlfc2xv
dCAqc2xvdCwgZ2ZuX3QgZ2ZuLAorCQkJCSAgaW50IG1pbl9sZXZlbCk7CiAKIHN0YXRpYyBpbmxp
bmUgdm9pZCBrdm1fdGRwX21tdV93YWxrX2xvY2tsZXNzX2JlZ2luKHZvaWQpCiB7Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
