Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 31732155E39
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:36:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D496E86999;
	Fri,  7 Feb 2020 18:36:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eEIPvvz4Ls7k; Fri,  7 Feb 2020 18:36:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9DB47869DE;
	Fri,  7 Feb 2020 18:36:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6CE50C1D81;
	Fri,  7 Feb 2020 18:36:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91027C1D8A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 65BF187FC9
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R7OLhaGShrbB
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 08E9787F84
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 10C0F305D3F4; Fri,  7 Feb 2020 20:16:40 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 015D2305207A;
 Fri,  7 Feb 2020 20:16:40 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 32/78] KVM: x86: page_track: add support for preread,
 prewrite and preexec
Date: Fri,  7 Feb 2020 20:15:50 +0200
Message-Id: <20200207181636.1065-33-alazar@bitdefender.com>
In-Reply-To: <20200207181636.1065-1-alazar@bitdefender.com>
References: <20200207181636.1065-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhlc2UgY2FsbGJh
Y2tzIHJldHVybiBhIGJvb2xlYW4gdmFsdWUuIElmIGZhbHNlLCB0aGUgZW11bGF0aW9uIHNob3Vs
ZApzdG9wIGFuZCB0aGUgaW5zdHJ1Y3Rpb24gc2hvdWxkIGJlIHJlZXhlY3V0ZWQgaW4gZ3Vlc3Qu
CgpTaWduZWQtb2ZmLWJ5OiBNaWhhaSBEb27Im3UgPG1kb250dUBiaXRkZWZlbmRlci5jb20+ClNp
Z25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KLS0t
CiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1fcGFnZV90cmFjay5oIHwgIDQ4ICsrKysrKysrKyst
CiBhcmNoL3g4Ni9rdm0vbW11LmggICAgICAgICAgICAgICAgICAgIHwgICA0ICsKIGFyY2gveDg2
L2t2bS9tbXUvbW11LmMgICAgICAgICAgICAgICAgfCAgODEgKysrKysrKysrKysrKysrKysKIGFy
Y2gveDg2L2t2bS9tbXUvcGFnZV90cmFjay5jICAgICAgICAgfCAxMjAgKysrKysrKysrKysrKysr
KysrKysrKysrLS0KIDQgZmlsZXMgY2hhbmdlZCwgMjQzIGluc2VydGlvbnMoKyksIDEwIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9wYWdlX3RyYWNr
LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1fcGFnZV90cmFjay5oCmluZGV4IGRjNTI4YzZm
MmViMC4uNjQ2Y2JmYTA3Njc2IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1f
cGFnZV90cmFjay5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9wYWdlX3RyYWNrLmgK
QEAgLTMsNyArMywxMCBAQAogI2RlZmluZSBfQVNNX1g4Nl9LVk1fUEFHRV9UUkFDS19ICiAKIGVu
dW0ga3ZtX3BhZ2VfdHJhY2tfbW9kZSB7CisJS1ZNX1BBR0VfVFJBQ0tfUFJFUkVBRCwKKwlLVk1f
UEFHRV9UUkFDS19QUkVXUklURSwKIAlLVk1fUEFHRV9UUkFDS19XUklURSwKKwlLVk1fUEFHRV9U
UkFDS19QUkVFWEVDLAogCUtWTV9QQUdFX1RSQUNLX01BWCwKIH07CiAKQEAgLTIyLDYgKzI1LDMz
IEBAIHN0cnVjdCBrdm1fcGFnZV90cmFja19ub3RpZmllcl9oZWFkIHsKIHN0cnVjdCBrdm1fcGFn
ZV90cmFja19ub3RpZmllcl9ub2RlIHsKIAlzdHJ1Y3QgaGxpc3Rfbm9kZSBub2RlOwogCisJLyoK
KwkgKiBJdCBpcyBjYWxsZWQgd2hlbiBndWVzdCBpcyByZWFkaW5nIHRoZSByZWFkLXRyYWNrZWQg
cGFnZQorCSAqIGFuZCB0aGUgcmVhZCBlbXVsYXRpb24gaXMgYWJvdXQgdG8gaGFwcGVuLgorCSAq
CisJICogQHZjcHU6IHRoZSB2Y3B1IHdoZXJlIHRoZSByZWFkIGFjY2VzcyBoYXBwZW5lZC4KKwkg
KiBAZ3BhOiB0aGUgcGh5c2ljYWwgYWRkcmVzcyByZWFkIGJ5IGd1ZXN0LgorCSAqIEBndmE6IHRo
ZSB2aXJ0dWFsIGFkZHJlc3MgcmVhZCBieSBndWVzdC4KKwkgKiBAYnl0ZXM6IHRoZSByZWFkIGxl
bmd0aC4KKwkgKiBAbm9kZTogdGhpcyBub2RlLgorCSAqLworCWJvb2wgKCp0cmFja19wcmVyZWFk
KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdwYV90IGdwYSwgZ3ZhX3QgZ3ZhLAorCQkJICAgICAg
aW50IGJ5dGVzLAorCQkJICAgICAgc3RydWN0IGt2bV9wYWdlX3RyYWNrX25vdGlmaWVyX25vZGUg
Km5vZGUpOworCS8qCisJICogSXQgaXMgY2FsbGVkIHdoZW4gZ3Vlc3QgaXMgd3JpdGluZyB0aGUg
d3JpdGUtdHJhY2tlZCBwYWdlCisJICogYW5kIHRoZSB3cml0ZSBlbXVsYXRpb24gZGlkbid0IGhh
cHBlbmVkIHlldC4KKwkgKgorCSAqIEB2Y3B1OiB0aGUgdmNwdSB3aGVyZSB0aGUgd3JpdGUgYWNj
ZXNzIGhhcHBlbmVkLgorCSAqIEBncGE6IHRoZSBwaHlzaWNhbCBhZGRyZXNzIHdyaXR0ZW4gYnkg
Z3Vlc3QuCisJICogQGd2YTogdGhlIHZpcnR1YWwgYWRkcmVzcyB3cml0dGVuIGJ5IGd1ZXN0Lgor
CSAqIEBuZXc6IHRoZSBkYXRhIHdhcyB3cml0dGVuIHRvIHRoZSBhZGRyZXNzLgorCSAqIEBieXRl
czogdGhlIHdyaXR0ZW4gbGVuZ3RoLgorCSAqIEBub2RlOiB0aGlzIG5vZGUKKwkgKi8KKwlib29s
ICgqdHJhY2tfcHJld3JpdGUpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3BhX3QgZ3BhLCBndmFf
dCBndmEsCisJCQkgICAgICAgY29uc3QgdTggKm5ldywgaW50IGJ5dGVzLAorCQkJICAgICAgIHN0
cnVjdCBrdm1fcGFnZV90cmFja19ub3RpZmllcl9ub2RlICpub2RlKTsKIAkvKgogCSAqIEl0IGlz
IGNhbGxlZCB3aGVuIGd1ZXN0IGlzIHdyaXRpbmcgdGhlIHdyaXRlLXRyYWNrZWQgcGFnZQogCSAq
IGFuZCB3cml0ZSBlbXVsYXRpb24gaXMgZmluaXNoZWQgYXQgdGhhdCB0aW1lLgpAQCAtMzYsNiAr
NjYsMTcgQEAgc3RydWN0IGt2bV9wYWdlX3RyYWNrX25vdGlmaWVyX25vZGUgewogCXZvaWQgKCp0
cmFja193cml0ZSkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBncGFfdCBncGEsIGd2YV90IGd2YSwK
IAkJCSAgICBjb25zdCB1OCAqbmV3LCBpbnQgYnl0ZXMsCiAJCQkgICAgc3RydWN0IGt2bV9wYWdl
X3RyYWNrX25vdGlmaWVyX25vZGUgKm5vZGUpOworCS8qCisJICogSXQgaXMgY2FsbGVkIHdoZW4g
Z3Vlc3QgaXMgZmV0Y2hpbmcgZnJvbSBhIGV4ZWMtdHJhY2tlZCBwYWdlCisJICogYW5kIHRoZSBm
ZXRjaCBlbXVsYXRpb24gaXMgYWJvdXQgdG8gaGFwcGVuLgorCSAqCisJICogQHZjcHU6IHRoZSB2
Y3B1IHdoZXJlIHRoZSBmZXRjaCBhY2Nlc3MgaGFwcGVuZWQuCisJICogQGdwYTogdGhlIHBoeXNp
Y2FsIGFkZHJlc3MgZmV0Y2hlZCBieSBndWVzdC4KKwkgKiBAZ3ZhOiB0aGUgdmlydHVhbCBhZGRy
ZXNzIGZldGNoZWQgYnkgZ3Vlc3QuCisJICogQG5vZGU6IHRoaXMgbm9kZS4KKwkgKi8KKwlib29s
ICgqdHJhY2tfcHJlZXhlYykoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBncGFfdCBncGEsIGd2YV90
IGd2YSwKKwkJCSAgICAgIHN0cnVjdCBrdm1fcGFnZV90cmFja19ub3RpZmllcl9ub2RlICpub2Rl
KTsKIAkvKgogCSAqIEl0IGlzIGNhbGxlZCB3aGVuIG1lbW9yeSBzbG90IGlzIGJlaW5nIGNyZWF0
ZWQKIAkgKgpAQCAtNDksNyArOTAsNyBAQCBzdHJ1Y3Qga3ZtX3BhZ2VfdHJhY2tfbm90aWZpZXJf
bm9kZSB7CiAJCQkJICBzdHJ1Y3Qga3ZtX3BhZ2VfdHJhY2tfbm90aWZpZXJfbm9kZSAqbm9kZSk7
CiAJLyoKIAkgKiBJdCBpcyBjYWxsZWQgd2hlbiBtZW1vcnkgc2xvdCBpcyBiZWluZyBtb3ZlZCBv
ciByZW1vdmVkCi0JICogdXNlcnMgY2FuIGRyb3Agd3JpdGUtcHJvdGVjdGlvbiBmb3IgdGhlIHBh
Z2VzIGluIHRoYXQgbWVtb3J5IHNsb3QKKwkgKiB1c2VycyBjYW4gZHJvcCBhY3RpdmUgcHJvdGVj
dGlvbiBmb3IgdGhlIHBhZ2VzIGluIHRoYXQgbWVtb3J5IHNsb3QKIAkgKgogCSAqIEBrdm06IHRo
ZSBrdm0gd2hlcmUgbWVtb3J5IHNsb3QgYmVpbmcgbW92ZWQgb3IgcmVtb3ZlZAogCSAqIEBzbG90
OiB0aGUgbWVtb3J5IHNsb3QgYmVpbmcgbW92ZWQgb3IgcmVtb3ZlZApAQCAtODIsNyArMTIzLDEy
IEBAIGt2bV9wYWdlX3RyYWNrX3JlZ2lzdGVyX25vdGlmaWVyKHN0cnVjdCBrdm0gKmt2bSwKIHZv
aWQKIGt2bV9wYWdlX3RyYWNrX3VucmVnaXN0ZXJfbm90aWZpZXIoc3RydWN0IGt2bSAqa3ZtLAog
CQkJCSAgIHN0cnVjdCBrdm1fcGFnZV90cmFja19ub3RpZmllcl9ub2RlICpuKTsKK2Jvb2wga3Zt
X3BhZ2VfdHJhY2tfcHJlcmVhZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdwYV90IGdwYSwgZ3Zh
X3QgZ3ZhLAorCQkJICAgIGludCBieXRlcyk7Citib29sIGt2bV9wYWdlX3RyYWNrX3ByZXdyaXRl
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3BhX3QgZ3BhLCBndmFfdCBndmEsCisJCQkgICAgIGNv
bnN0IHU4ICpuZXcsIGludCBieXRlcyk7CiB2b2lkIGt2bV9wYWdlX3RyYWNrX3dyaXRlKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSwgZ3BhX3QgZ3BhLCBndmFfdCBndmEsCiAJCQkgIGNvbnN0IHU4ICpu
ZXcsIGludCBieXRlcyk7Citib29sIGt2bV9wYWdlX3RyYWNrX3ByZWV4ZWMoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCBncGFfdCBncGEsIGd2YV90IGd2YSk7CiB2b2lkIGt2bV9wYWdlX3RyYWNrX2Zs
dXNoX3Nsb3Qoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90KTsK
ICNlbmRpZgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL21tdS5oIGIvYXJjaC94ODYva3ZtL21t
dS5oCmluZGV4IGQ1NTY3NGY0NGExOC4uYjNhMjBmYzk4YzY5IDEwMDY0NAotLS0gYS9hcmNoL3g4
Ni9rdm0vbW11LmgKKysrIGIvYXJjaC94ODYva3ZtL21tdS5oCkBAIC0yMDksNiArMjA5LDEwIEBA
IHZvaWQga3ZtX21tdV9nZm5fZGlzYWxsb3dfbHBhZ2Uoc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAq
c2xvdCwgZ2ZuX3QgZ2ZuKTsKIHZvaWQga3ZtX21tdV9nZm5fYWxsb3dfbHBhZ2Uoc3RydWN0IGt2
bV9tZW1vcnlfc2xvdCAqc2xvdCwgZ2ZuX3QgZ2ZuKTsKIGJvb2wga3ZtX21tdV9zbG90X2dmbl93
cml0ZV9wcm90ZWN0KHN0cnVjdCBrdm0gKmt2bSwKIAkJCQkgICAgc3RydWN0IGt2bV9tZW1vcnlf
c2xvdCAqc2xvdCwgdTY0IGdmbik7Citib29sIGt2bV9tbXVfc2xvdF9nZm5fcmVhZF9wcm90ZWN0
KHN0cnVjdCBrdm0gKmt2bSwKKwkJCQkgICBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90LCB1
NjQgZ2ZuKTsKK2Jvb2wga3ZtX21tdV9zbG90X2dmbl9leGVjX3Byb3RlY3Qoc3RydWN0IGt2bSAq
a3ZtLAorCQkJCSAgIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QsIHU2NCBnZm4pOwogaW50
IGt2bV9hcmNoX3dyaXRlX2xvZ19kaXJ0eShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCiBpbnQg
a3ZtX21tdV9wb3N0X2luaXRfdm0oc3RydWN0IGt2bSAqa3ZtKTsKZGlmZiAtLWdpdCBhL2FyY2gv
eDg2L2t2bS9tbXUvbW11LmMgYi9hcmNoL3g4Ni9rdm0vbW11L21tdS5jCmluZGV4IGYyZTAxNmRm
ZmZlNi4uMTI0ZTdjYTczYjQ4IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vbW11L21tdS5jCisr
KyBiL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKQEAgLTE2NDgsNiArMTY0OCwzMSBAQCBzdGF0aWMg
Ym9vbCBzcHRlX3dyaXRlX3Byb3RlY3QodTY0ICpzcHRlcCwgYm9vbCBwdF9wcm90ZWN0KQogCXJl
dHVybiBtbXVfc3B0ZV91cGRhdGUoc3B0ZXAsIHNwdGUpOwogfQogCitzdGF0aWMgYm9vbCBzcHRl
X3JlYWRfcHJvdGVjdCh1NjQgKnNwdGVwKQoreworCXU2NCBzcHRlID0gKnNwdGVwOworCWJvb2wg
ZXhlY19vbmx5X3N1cHBvcnRlZCA9IChzaGFkb3dfcHJlc2VudF9tYXNrID09IDB1bGwpOworCisJ
cm1hcF9wcmludGsoInJtYXBfcmVhZF9wcm90ZWN0OiBzcHRlICVwICVsbHhcbiIsIHNwdGVwLCAq
c3B0ZXApOworCisJV0FSTl9PTl9PTkNFKCFleGVjX29ubHlfc3VwcG9ydGVkKTsKKworCXNwdGUg
PSBzcHRlICYgfihQVF9XUklUQUJMRV9NQVNLIHwgUFRfUFJFU0VOVF9NQVNLKTsKKworCXJldHVy
biBtbXVfc3B0ZV91cGRhdGUoc3B0ZXAsIHNwdGUpOworfQorCitzdGF0aWMgYm9vbCBzcHRlX2V4
ZWNfcHJvdGVjdCh1NjQgKnNwdGVwKQoreworCXU2NCBzcHRlID0gKnNwdGVwOworCisJcm1hcF9w
cmludGsoInJtYXBfZXhlY19wcm90ZWN0OiBzcHRlICVwICVsbHhcbiIsIHNwdGVwLCAqc3B0ZXAp
OworCisJc3B0ZSA9IHNwdGUgJiB+UFRfVVNFUl9NQVNLOworCisJcmV0dXJuIG1tdV9zcHRlX3Vw
ZGF0ZShzcHRlcCwgc3B0ZSk7Cit9CisKIHN0YXRpYyBib29sIF9fcm1hcF93cml0ZV9wcm90ZWN0
KHN0cnVjdCBrdm0gKmt2bSwKIAkJCQkgc3RydWN0IGt2bV9ybWFwX2hlYWQgKnJtYXBfaGVhZCwK
IAkJCQkgYm9vbCBwdF9wcm90ZWN0KQpAQCAtMTY2Miw2ICsxNjg3LDMyIEBAIHN0YXRpYyBib29s
IF9fcm1hcF93cml0ZV9wcm90ZWN0KHN0cnVjdCBrdm0gKmt2bSwKIAlyZXR1cm4gZmx1c2g7CiB9
CiAKK3N0YXRpYyBib29sIF9fcm1hcF9yZWFkX3Byb3RlY3Qoc3RydWN0IGt2bSAqa3ZtLAorCQkJ
CXN0cnVjdCBrdm1fcm1hcF9oZWFkICpybWFwX2hlYWQpCit7CisJdTY0ICpzcHRlcDsKKwlzdHJ1
Y3Qgcm1hcF9pdGVyYXRvciBpdGVyOworCWJvb2wgZmx1c2ggPSBmYWxzZTsKKworCWZvcl9lYWNo
X3JtYXBfc3B0ZShybWFwX2hlYWQsICZpdGVyLCBzcHRlcCkKKwkJZmx1c2ggfD0gc3B0ZV9yZWFk
X3Byb3RlY3Qoc3B0ZXApOworCisJcmV0dXJuIGZsdXNoOworfQorCitzdGF0aWMgYm9vbCBfX3Jt
YXBfZXhlY19wcm90ZWN0KHN0cnVjdCBrdm0gKmt2bSwKKwkJCQlzdHJ1Y3Qga3ZtX3JtYXBfaGVh
ZCAqcm1hcF9oZWFkKQoreworCXU2NCAqc3B0ZXA7CisJc3RydWN0IHJtYXBfaXRlcmF0b3IgaXRl
cjsKKwlib29sIGZsdXNoID0gZmFsc2U7CisKKwlmb3JfZWFjaF9ybWFwX3NwdGUocm1hcF9oZWFk
LCAmaXRlciwgc3B0ZXApCisJCWZsdXNoIHw9IHNwdGVfZXhlY19wcm90ZWN0KHNwdGVwKTsKKwor
CXJldHVybiBmbHVzaDsKK30KKwogc3RhdGljIGJvb2wgc3B0ZV9jbGVhcl9kaXJ0eSh1NjQgKnNw
dGVwKQogewogCXU2NCBzcHRlID0gKnNwdGVwOwpAQCAtMTgzNyw2ICsxODg4LDM2IEBAIGJvb2wg
a3ZtX21tdV9zbG90X2dmbl93cml0ZV9wcm90ZWN0KHN0cnVjdCBrdm0gKmt2bSwKIAlyZXR1cm4g
d3JpdGVfcHJvdGVjdGVkOwogfQogCitib29sIGt2bV9tbXVfc2xvdF9nZm5fcmVhZF9wcm90ZWN0
KHN0cnVjdCBrdm0gKmt2bSwKKwkJCQkgICBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90LCB1
NjQgZ2ZuKQoreworCXN0cnVjdCBrdm1fcm1hcF9oZWFkICpybWFwX2hlYWQ7CisJaW50IGk7CisJ
Ym9vbCByZWFkX3Byb3RlY3RlZCA9IGZhbHNlOworCisJZm9yIChpID0gUFRfUEFHRV9UQUJMRV9M
RVZFTDsgaSA8PSBQVF9NQVhfSFVHRVBBR0VfTEVWRUw7ICsraSkgeworCQlybWFwX2hlYWQgPSBf
X2dmbl90b19ybWFwKGdmbiwgaSwgc2xvdCk7CisJCXJlYWRfcHJvdGVjdGVkIHw9IF9fcm1hcF9y
ZWFkX3Byb3RlY3Qoa3ZtLCBybWFwX2hlYWQpOworCX0KKworCXJldHVybiByZWFkX3Byb3RlY3Rl
ZDsKK30KKworYm9vbCBrdm1fbW11X3Nsb3RfZ2ZuX2V4ZWNfcHJvdGVjdChzdHJ1Y3Qga3ZtICpr
dm0sCisJCQkJICAgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqc2xvdCwgdTY0IGdmbikKK3sKKwlz
dHJ1Y3Qga3ZtX3JtYXBfaGVhZCAqcm1hcF9oZWFkOworCWludCBpOworCWJvb2wgZXhlY19wcm90
ZWN0ZWQgPSBmYWxzZTsKKworCWZvciAoaSA9IFBUX1BBR0VfVEFCTEVfTEVWRUw7IGkgPD0gUFRf
TUFYX0hVR0VQQUdFX0xFVkVMOyArK2kpIHsKKwkJcm1hcF9oZWFkID0gX19nZm5fdG9fcm1hcChn
Zm4sIGksIHNsb3QpOworCQlleGVjX3Byb3RlY3RlZCB8PSBfX3JtYXBfZXhlY19wcm90ZWN0KGt2
bSwgcm1hcF9oZWFkKTsKKwl9CisKKwlyZXR1cm4gZXhlY19wcm90ZWN0ZWQ7Cit9CisKIHN0YXRp
YyBib29sIHJtYXBfd3JpdGVfcHJvdGVjdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU2NCBnZm4p
CiB7CiAJc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqc2xvdDsKZGlmZiAtLWdpdCBhL2FyY2gveDg2
L2t2bS9tbXUvcGFnZV90cmFjay5jIGIvYXJjaC94ODYva3ZtL21tdS9wYWdlX3RyYWNrLmMKaW5k
ZXggZjM2ZTc0NDMwYWQyLi5jYzNlYjJjYzdlMzggMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9t
bXUvcGFnZV90cmFjay5jCisrKyBiL2FyY2gveDg2L2t2bS9tbXUvcGFnZV90cmFjay5jCkBAIC0x
LDYgKzEsNiBAQAogLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQogLyoK
LSAqIFN1cHBvcnQgS1ZNIGd1c3QgcGFnZSB0cmFja2luZworICogU3VwcG9ydCBLVk0gZ3Vlc3Qg
cGFnZSB0cmFja2luZwogICoKICAqIFRoaXMgZmVhdHVyZSBhbGxvd3MgdXMgdG8gdHJhY2sgcGFn
ZSBhY2Nlc3MgaW4gZ3Vlc3QuIEN1cnJlbnRseSwgb25seQogICogd3JpdGUgYWNjZXNzIGlzIHRy
YWNrZWQuCkBAIC05OSw3ICs5OSw3IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9nZm5fdHJhY2soc3Ry
dWN0IGt2bV9tZW1vcnlfc2xvdCAqc2xvdCwgZ2ZuX3QgZ2ZuLAogICogQGt2bTogdGhlIGd1ZXN0
IGluc3RhbmNlIHdlIGFyZSBpbnRlcmVzdGVkIGluLgogICogQHNsb3Q6IHRoZSBAZ2ZuIGJlbG9u
Z3MgdG8uCiAgKiBAZ2ZuOiB0aGUgZ3Vlc3QgcGFnZS4KLSAqIEBtb2RlOiB0cmFja2luZyBtb2Rl
LCBjdXJyZW50bHkgb25seSB3cml0ZSB0cmFjayBpcyBzdXBwb3J0ZWQuCisgKiBAbW9kZTogdHJh
Y2tpbmcgbW9kZS4KICAqLwogdm9pZCBrdm1fc2xvdF9wYWdlX3RyYWNrX2FkZF9wYWdlKHN0cnVj
dCBrdm0gKmt2bSwKIAkJCQkgIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QsIGdmbl90IGdm
biwKQEAgLTExNyw5ICsxMTcsMTYgQEAgdm9pZCBrdm1fc2xvdF9wYWdlX3RyYWNrX2FkZF9wYWdl
KHN0cnVjdCBrdm0gKmt2bSwKIAkgKi8KIAlrdm1fbW11X2dmbl9kaXNhbGxvd19scGFnZShzbG90
LCBnZm4pOwogCi0JaWYgKG1vZGUgPT0gS1ZNX1BBR0VfVFJBQ0tfV1JJVEUpCisJaWYgKG1vZGUg
PT0gS1ZNX1BBR0VfVFJBQ0tfUFJFV1JJVEUgfHwgbW9kZSA9PSBLVk1fUEFHRV9UUkFDS19XUklU
RSkgewogCQlpZiAoa3ZtX21tdV9zbG90X2dmbl93cml0ZV9wcm90ZWN0KGt2bSwgc2xvdCwgZ2Zu
KSkKIAkJCWt2bV9mbHVzaF9yZW1vdGVfdGxicyhrdm0pOworCX0gZWxzZSBpZiAobW9kZSA9PSBL
Vk1fUEFHRV9UUkFDS19QUkVSRUFEKSB7CisJCWlmIChrdm1fbW11X3Nsb3RfZ2ZuX3JlYWRfcHJv
dGVjdChrdm0sIHNsb3QsIGdmbikpCisJCQlrdm1fZmx1c2hfcmVtb3RlX3RsYnMoa3ZtKTsKKwl9
IGVsc2UgaWYgKG1vZGUgPT0gS1ZNX1BBR0VfVFJBQ0tfUFJFRVhFQykgeworCQlpZiAoa3ZtX21t
dV9zbG90X2dmbl9leGVjX3Byb3RlY3Qoa3ZtLCBzbG90LCBnZm4pKQorCQkJa3ZtX2ZsdXNoX3Jl
bW90ZV90bGJzKGt2bSk7CisJfQogfQogRVhQT1JUX1NZTUJPTF9HUEwoa3ZtX3Nsb3RfcGFnZV90
cmFja19hZGRfcGFnZSk7CiAKQEAgLTEzNCw3ICsxNDEsNyBAQCBFWFBPUlRfU1lNQk9MX0dQTChr
dm1fc2xvdF9wYWdlX3RyYWNrX2FkZF9wYWdlKTsKICAqIEBrdm06IHRoZSBndWVzdCBpbnN0YW5j
ZSB3ZSBhcmUgaW50ZXJlc3RlZCBpbi4KICAqIEBzbG90OiB0aGUgQGdmbiBiZWxvbmdzIHRvLgog
ICogQGdmbjogdGhlIGd1ZXN0IHBhZ2UuCi0gKiBAbW9kZTogdHJhY2tpbmcgbW9kZSwgY3VycmVu
dGx5IG9ubHkgd3JpdGUgdHJhY2sgaXMgc3VwcG9ydGVkLgorICogQG1vZGU6IHRyYWNraW5nIG1v
ZGUuCiAgKi8KIHZvaWQga3ZtX3Nsb3RfcGFnZV90cmFja19yZW1vdmVfcGFnZShzdHJ1Y3Qga3Zt
ICprdm0sCiAJCQkJICAgICBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90LCBnZm5fdCBnZm4s
CkBAIC0yMjcsMTIgKzIzNCw3OCBAQCBrdm1fcGFnZV90cmFja191bnJlZ2lzdGVyX25vdGlmaWVy
KHN0cnVjdCBrdm0gKmt2bSwKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGt2bV9wYWdlX3RyYWNrX3Vu
cmVnaXN0ZXJfbm90aWZpZXIpOwogCisvKgorICogTm90aWZ5IHRoZSBub2RlIHRoYXQgYSByZWFk
IGFjY2VzcyBpcyBhYm91dCB0byBoYXBwZW4uIFJldHVybmluZyBmYWxzZQorICogZG9lc24ndCBz
dG9wIHRoZSBvdGhlciBub2RlcyBmcm9tIGJlaW5nIGNhbGxlZCwgYnV0IGl0IHdpbGwgc3RvcAor
ICogdGhlIGVtdWxhdGlvbi4KKyAqCisgKiBUaGUgbm9kZSBzaG91bGQgZmlndXJlIG91dCBpZiB0
aGUgcmVhZCBwYWdlIGlzIHRoZSBvbmUgdGhhdCB0aGUgbm9kZQorICogaXMgaW50ZXJlc3RlZCBp
biBieSBpdHNlbGYuCisgKgorICogVGhlIG5vZGVzIHdpbGwgYWx3YXlzIGJlIGluIGNvbmZsaWN0
IGlmIHRoZXkgdHJhY2sgdGhlIHNhbWUgcGFnZToKKyAqIC0gYWNjZXB0aW5nIGEgcmVhZCB3b24n
dCBndWFyYW50ZWUgdGhhdCB0aGUgbmV4dCBub2RlIHdpbGwgbm90IG92ZXJyaWRlCisgKiAgIHRo
ZSBkYXRhIChmaWxsaW5nIG5ldy9ieXRlcyBhbmQgc2V0dGluZyBkYXRhX3JlYWR5KQorICogLSBm
aWxsaW5nIG5ldy9ieXRlcyB3aXRoIGN1c3RvbSBkYXRhIHdvbid0IGd1YXJhbnRlZSB0aGF0IHRo
ZSBuZXh0IG5vZGUKKyAqICAgd2lsbCBub3Qgb3ZlcnJpZGUgdGhhdAorICovCitib29sIGt2bV9w
YWdlX3RyYWNrX3ByZXJlYWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBncGFfdCBncGEsIGd2YV90
IGd2YSwKKwkJCSAgICBpbnQgYnl0ZXMpCit7CisJc3RydWN0IGt2bV9wYWdlX3RyYWNrX25vdGlm
aWVyX2hlYWQgKmhlYWQ7CisJc3RydWN0IGt2bV9wYWdlX3RyYWNrX25vdGlmaWVyX25vZGUgKm47
CisJaW50IGlkeDsKKwlib29sIHJldCA9IHRydWU7CisKKwloZWFkID0gJnZjcHUtPmt2bS0+YXJj
aC50cmFja19ub3RpZmllcl9oZWFkOworCisJaWYgKGhsaXN0X2VtcHR5KCZoZWFkLT50cmFja19u
b3RpZmllcl9saXN0KSkKKwkJcmV0dXJuIHJldDsKKworCWlkeCA9IHNyY3VfcmVhZF9sb2NrKCZo
ZWFkLT50cmFja19zcmN1KTsKKwlobGlzdF9mb3JfZWFjaF9lbnRyeV9yY3UobiwgJmhlYWQtPnRy
YWNrX25vdGlmaWVyX2xpc3QsIG5vZGUpCisJCWlmIChuLT50cmFja19wcmVyZWFkKQorCQkJaWYg
KCFuLT50cmFja19wcmVyZWFkKHZjcHUsIGdwYSwgZ3ZhLCBieXRlcywgbikpCisJCQkJcmV0ID0g
ZmFsc2U7CisJc3JjdV9yZWFkX3VubG9jaygmaGVhZC0+dHJhY2tfc3JjdSwgaWR4KTsKKwlyZXR1
cm4gcmV0OworfQorCisvKgorICogTm90aWZ5IHRoZSBub2RlIHRoYXQgYSB3cml0ZSBhY2Nlc3Mg
aXMgYWJvdXQgdG8gaGFwcGVuLiBSZXR1cm5pbmcgZmFsc2UKKyAqIGRvZXNuJ3Qgc3RvcCB0aGUg
b3RoZXIgbm9kZXMgZnJvbSBiZWluZyBjYWxsZWQsIGJ1dCBpdCB3aWxsIHN0b3AKKyAqIHRoZSBl
bXVsYXRpb24uCisgKgorICogVGhlIG5vZGUgc2hvdWxkIGZpZ3VyZSBvdXQgaWYgdGhlIHdyaXR0
ZW4gcGFnZSBpcyB0aGUgb25lIHRoYXQgdGhlIG5vZGUKKyAqIGlzIGludGVyZXN0ZWQgaW4gYnkg
aXRzZWxmLgorICovCitib29sIGt2bV9wYWdlX3RyYWNrX3ByZXdyaXRlKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSwgZ3BhX3QgZ3BhLCBndmFfdCBndmEsCisJCQkgICAgIGNvbnN0IHU4ICpuZXcsIGlu
dCBieXRlcykKK3sKKwlzdHJ1Y3Qga3ZtX3BhZ2VfdHJhY2tfbm90aWZpZXJfaGVhZCAqaGVhZDsK
KwlzdHJ1Y3Qga3ZtX3BhZ2VfdHJhY2tfbm90aWZpZXJfbm9kZSAqbjsKKwlpbnQgaWR4OworCWJv
b2wgcmV0ID0gdHJ1ZTsKKworCWhlYWQgPSAmdmNwdS0+a3ZtLT5hcmNoLnRyYWNrX25vdGlmaWVy
X2hlYWQ7CisKKwlpZiAoaGxpc3RfZW1wdHkoJmhlYWQtPnRyYWNrX25vdGlmaWVyX2xpc3QpKQor
CQlyZXR1cm4gcmV0OworCisJaWR4ID0gc3JjdV9yZWFkX2xvY2soJmhlYWQtPnRyYWNrX3NyY3Up
OworCWhsaXN0X2Zvcl9lYWNoX2VudHJ5X3JjdShuLCAmaGVhZC0+dHJhY2tfbm90aWZpZXJfbGlz
dCwgbm9kZSkKKwkJaWYgKG4tPnRyYWNrX3ByZXdyaXRlKQorCQkJaWYgKCFuLT50cmFja19wcmV3
cml0ZSh2Y3B1LCBncGEsIGd2YSwgbmV3LCBieXRlcywgbikpCisJCQkJcmV0ID0gZmFsc2U7CisJ
c3JjdV9yZWFkX3VubG9jaygmaGVhZC0+dHJhY2tfc3JjdSwgaWR4KTsKKwlyZXR1cm4gcmV0Owor
fQorCiAvKgogICogTm90aWZ5IHRoZSBub2RlIHRoYXQgd3JpdGUgYWNjZXNzIGlzIGludGVyY2Vw
dGVkIGFuZCB3cml0ZSBlbXVsYXRpb24gaXMKICAqIGZpbmlzaGVkIGF0IHRoaXMgdGltZS4KICAq
Ci0gKiBUaGUgbm9kZSBzaG91bGQgZmlndXJlIG91dCBpZiB0aGUgd3JpdHRlbiBwYWdlIGlzIHRo
ZSBvbmUgdGhhdCBub2RlIGlzCi0gKiBpbnRlcmVzdGVkIGluIGJ5IGl0c2VsZi4KKyAqIFRoZSBu
b2RlIHNob3VsZCBmaWd1cmUgb3V0IGlmIHRoZSB3cml0dGVuIHBhZ2UgaXMgdGhlIG9uZSB0aGF0
IHRoZSBub2RlCisgKiBpcyBpbnRlcmVzdGVkIGluIGJ5IGl0c2VsZi4KICAqLwogdm9pZCBrdm1f
cGFnZV90cmFja193cml0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdwYV90IGdwYSwgZ3ZhX3Qg
Z3ZhLAogCQkJICBjb25zdCB1OCAqbmV3LCBpbnQgYnl0ZXMpCkBAIC0yNTMsMTIgKzMyNiw0MSBA
QCB2b2lkIGt2bV9wYWdlX3RyYWNrX3dyaXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3BhX3Qg
Z3BhLCBndmFfdCBndmEsCiAJc3JjdV9yZWFkX3VubG9jaygmaGVhZC0+dHJhY2tfc3JjdSwgaWR4
KTsKIH0KIAorLyoKKyAqIE5vdGlmeSB0aGUgbm9kZSB0aGF0IGFuIGluc3RydWN0aW9uIGlzIGFi
b3V0IHRvIGJlIGV4ZWN1dGVkLgorICogUmV0dXJuaW5nIGZhbHNlIGRvZXNuJ3Qgc3RvcCB0aGUg
b3RoZXIgbm9kZXMgZnJvbSBiZWluZyBjYWxsZWQsCisgKiBidXQgaXQgd2lsbCBzdG9wIHRoZSBl
bXVsYXRpb24gd2l0aCBYODZFTVVMX1JFVFJZX0lOU1RSLgorICoKKyAqIFRoZSBub2RlIHNob3Vs
ZCBmaWd1cmUgb3V0IGlmIHRoZSBwYWdlIGlzIHRoZSBvbmUgdGhhdCB0aGUgbm9kZQorICogaXMg
aW50ZXJlc3RlZCBpbiBieSBpdHNlbGYuCisgKi8KK2Jvb2wga3ZtX3BhZ2VfdHJhY2tfcHJlZXhl
YyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdwYV90IGdwYSwgZ3ZhX3QgZ3ZhKQoreworCXN0cnVj
dCBrdm1fcGFnZV90cmFja19ub3RpZmllcl9oZWFkICpoZWFkOworCXN0cnVjdCBrdm1fcGFnZV90
cmFja19ub3RpZmllcl9ub2RlICpuOworCWludCBpZHg7CisJYm9vbCByZXQgPSB0cnVlOworCisJ
aGVhZCA9ICZ2Y3B1LT5rdm0tPmFyY2gudHJhY2tfbm90aWZpZXJfaGVhZDsKKworCWlmIChobGlz
dF9lbXB0eSgmaGVhZC0+dHJhY2tfbm90aWZpZXJfbGlzdCkpCisJCXJldHVybiByZXQ7CisKKwlp
ZHggPSBzcmN1X3JlYWRfbG9jaygmaGVhZC0+dHJhY2tfc3JjdSk7CisJaGxpc3RfZm9yX2VhY2hf
ZW50cnlfcmN1KG4sICZoZWFkLT50cmFja19ub3RpZmllcl9saXN0LCBub2RlKQorCQlpZiAobi0+
dHJhY2tfcHJlZXhlYykKKwkJCWlmICghbi0+dHJhY2tfcHJlZXhlYyh2Y3B1LCBncGEsIGd2YSwg
bikpCisJCQkJcmV0ID0gZmFsc2U7CisJc3JjdV9yZWFkX3VubG9jaygmaGVhZC0+dHJhY2tfc3Jj
dSwgaWR4KTsKKwlyZXR1cm4gcmV0OworfQorCiAvKgogICogTm90aWZ5IHRoZSBub2RlIHRoYXQg
bWVtb3J5IHNsb3QgaXMgYmVpbmcgcmVtb3ZlZCBvciBtb3ZlZCBzbyB0aGF0IGl0IGNhbgotICog
ZHJvcCB3cml0ZS1wcm90ZWN0aW9uIGZvciB0aGUgcGFnZXMgaW4gdGhlIG1lbW9yeSBzbG90Lgor
ICogZHJvcCBhY3RpdmUgcHJvdGVjdGlvbiBmb3IgdGhlIHBhZ2VzIGluIHRoZSBtZW1vcnkgc2xv
dC4KICAqCi0gKiBUaGUgbm9kZSBzaG91bGQgZmlndXJlIG91dCBpdCBoYXMgYW55IHdyaXRlLXBy
b3RlY3RlZCBwYWdlcyBpbiB0aGlzIHNsb3QKLSAqIGJ5IGl0c2VsZi4KKyAqIFRoZSBub2RlIHNo
b3VsZCBmaWd1cmUgb3V0IGlmIHRoZSBwYWdlIGlzIHRoZSBvbmUgdGhhdCB0aGUgbm9kZQorICog
aXMgaW50ZXJlc3RlZCBpbiBieSBpdHNlbGYuCiAgKi8KIHZvaWQga3ZtX3BhZ2VfdHJhY2tfZmx1
c2hfc2xvdChzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QpCiB7
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxp
emF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92
aXJ0dWFsaXphdGlvbg==
