Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 891E2155E37
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:36:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 39A2B865CF;
	Fri,  7 Feb 2020 18:36:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SuM5EJCcZPTZ; Fri,  7 Feb 2020 18:36:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ED4CE86E82;
	Fri,  7 Feb 2020 18:36:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D289DC1D87;
	Fri,  7 Feb 2020 18:36:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2E39C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C0C4287F8E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0lzGFdAuf9iI
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9531E87F92
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 DE4BC305D3DE; Fri,  7 Feb 2020 20:16:39 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id C970F3052079;
 Fri,  7 Feb 2020 20:16:39 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 27/78] KVM: x86: extend kvm_mmu_gva_to_gpa_system()
 with the 'access' parameter
Date: Fri,  7 Feb 2020 20:15:45 +0200
Message-Id: <20200207181636.1065-28-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBpcyBuZWVk
ZWQgZm9yIHRoZSBpbnRyb3NwZWN0aW9uIHN1YnN5dGVtIHRvIGVtdWxhdGUgYSBndWVzdCBwYWdl
CnRhYmxlIHdhbGsgb24gU1BUIHZpb2xhdGlvbnMgZHVlIHRvIEEvRCBiaXQgdXBkYXRlcy4KClNp
Z25lZC1vZmYtYnk6IE1paGFpIERvbsibdSA8bWRvbnR1QGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVk
LW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGFy
Y2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCAyICstCiBhcmNoL3g4Ni9rdm0veDg2LmMg
ICAgICAgICAgICAgIHwgNiArKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9o
b3N0LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCmluZGV4IDY5MjdhNjA0NGUy
Ni4uZDIxNmVkMWE3YzdkIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9z
dC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKQEAgLTE0ODcsNyArMTQ4
Nyw3IEBAIGdwYV90IGt2bV9tbXVfZ3ZhX3RvX2dwYV9mZXRjaChzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIGd2YV90IGd2YSwKIGdwYV90IGt2bV9tbXVfZ3ZhX3RvX2dwYV93cml0ZShzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsIGd2YV90IGd2YSwKIAkJCSAgICAgICBzdHJ1Y3QgeDg2X2V4Y2VwdGlvbiAq
ZXhjZXB0aW9uKTsKIGdwYV90IGt2bV9tbXVfZ3ZhX3RvX2dwYV9zeXN0ZW0oc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCBndmFfdCBndmEsCi0JCQkJc3RydWN0IHg4Nl9leGNlcHRpb24gKmV4Y2VwdGlv
bik7CisJCQkJdTMyIGFjY2Vzcywgc3RydWN0IHg4Nl9leGNlcHRpb24gKmV4Y2VwdGlvbik7CiAK
IHZvaWQga3ZtX3ZjcHVfZGVhY3RpdmF0ZV9hcGljdihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwog
CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0veDg2LmMgYi9hcmNoL3g4Ni9rdm0veDg2LmMKaW5k
ZXggYzYwNzE0OGRjZjYzLi41ZTYzMjczNjMyMDcgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS94
ODYuYworKysgYi9hcmNoL3g4Ni9rdm0veDg2LmMKQEAgLTUzMjUsOSArNTMyNSw5IEBAIGdwYV90
IGt2bV9tbXVfZ3ZhX3RvX2dwYV93cml0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGd2YV90IGd2
YSwKIAogLyogdXNlcyB0aGlzIHRvIGFjY2VzcyBhbnkgZ3Vlc3QncyBtYXBwZWQgbWVtb3J5IHdp
dGhvdXQgY2hlY2tpbmcgQ1BMICovCiBncGFfdCBrdm1fbW11X2d2YV90b19ncGFfc3lzdGVtKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3ZhX3QgZ3ZhLAotCQkJCXN0cnVjdCB4ODZfZXhjZXB0aW9u
ICpleGNlcHRpb24pCisJCQkJdTMyIGFjY2Vzcywgc3RydWN0IHg4Nl9leGNlcHRpb24gKmV4Y2Vw
dGlvbikKIHsKLQlyZXR1cm4gdmNwdS0+YXJjaC53YWxrX21tdS0+Z3ZhX3RvX2dwYSh2Y3B1LCBn
dmEsIDAsIGV4Y2VwdGlvbik7CisJcmV0dXJuIHZjcHUtPmFyY2gud2Fsa19tbXUtPmd2YV90b19n
cGEodmNwdSwgZ3ZhLCBhY2Nlc3MsIGV4Y2VwdGlvbik7CiB9CiAKIHN0YXRpYyBpbnQga3ZtX3Jl
YWRfZ3Vlc3RfdmlydF9oZWxwZXIoZ3ZhX3QgYWRkciwgdm9pZCAqdmFsLCB1bnNpZ25lZCBpbnQg
Ynl0ZXMsCkBAIC05MDA1LDcgKzkwMDUsNyBAQCBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF90cmFu
c2xhdGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCXZjcHVfbG9hZCh2Y3B1KTsKIAogCWlkeCA9
IHNyY3VfcmVhZF9sb2NrKCZ2Y3B1LT5rdm0tPnNyY3UpOwotCWdwYSA9IGt2bV9tbXVfZ3ZhX3Rv
X2dwYV9zeXN0ZW0odmNwdSwgdmFkZHIsIE5VTEwpOworCWdwYSA9IGt2bV9tbXVfZ3ZhX3RvX2dw
YV9zeXN0ZW0odmNwdSwgdmFkZHIsIDAsIE5VTEwpOwogCXNyY3VfcmVhZF91bmxvY2soJnZjcHUt
Pmt2bS0+c3JjdSwgaWR4KTsKIAl0ci0+cGh5c2ljYWxfYWRkcmVzcyA9IGdwYTsKIAl0ci0+dmFs
aWQgPSBncGEgIT0gVU5NQVBQRURfR1ZBOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRp
b25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRp
b24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
