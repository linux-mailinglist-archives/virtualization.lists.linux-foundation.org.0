Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D8D2D1B77
	for <lists.virtualization@lfdr.de>; Mon,  7 Dec 2020 21:57:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B4B3E87973;
	Mon,  7 Dec 2020 20:57:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w1h1mfVdaRAR; Mon,  7 Dec 2020 20:57:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F07F187199;
	Mon,  7 Dec 2020 20:57:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3748C013B;
	Mon,  7 Dec 2020 20:57:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BDB7EC0FA7
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A04DE8714D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:57:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ayHfEWgtLKH
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:56:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7D0B387126
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:56:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 70C99305D475; Mon,  7 Dec 2020 22:46:21 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 429CA3072784;
 Mon,  7 Dec 2020 22:46:21 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v11 54/81] KVM: introspection: add KVMI_VCPU_SET_REGISTERS
Date: Mon,  7 Dec 2020 22:45:55 +0200
Message-Id: <20201207204622.15258-55-alazar@bitdefender.com>
In-Reply-To: <20201207204622.15258-1-alazar@bitdefender.com>
References: <20201207204622.15258-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Mircea=20C=C3=AErjaliu?= <mcirjaliu@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
 =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKRHVyaW5nIGFuIGlu
dHJvc3BlY3Rpb24gZXZlbnQsIHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wgbWlnaHQgbmVlZCB0bwpj
aGFuZ2UgdGhlIHZDUFUgc3RhdGUsIGZvciBleGFtcGxlLCB0byBza2lwIHRoZSBjdXJyZW50IGlu
c3RydWN0aW9uLgoKVGhpcyBjb21tYW5kIGlzIGFsbG93ZWQgb25seSBkdXJpbmcgdkNQVSBldmVu
dHMgYW5kIHRoZSByZWdpc3RlcnMgd2lsbApiZSBzZXQgd2hlbiB0aGUgcmVwbHkgaGFzIGJlZW4g
cmVjZWl2ZWQuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaSBEb27Im3UgPG1kb250dUBiaXRkZWZlbmRl
ci5jb20+CkNvLWRldmVsb3BlZC1ieTogTWlyY2VhIEPDrnJqYWxpdSA8bWNpcmphbGl1QGJpdGRl
ZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogTWlyY2VhIEPDrnJqYWxpdSA8bWNpcmphbGl1QGJp
dGRlZmVuZGVyLmNvbT4KQ28tZGV2ZWxvcGVkLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBi
aXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJp
dGRlZmVuZGVyLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0ICAgICAg
ICAgICAgICAgfCAyOSArKysrKysrCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1pX2hvc3QuaCAg
ICAgICAgICAgICAgfCAgMiArCiBhcmNoL3g4Ni9rdm0va3ZtaS5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAyMiArKysrKwogYXJjaC94ODYva3ZtL2t2bWkuaCAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDIgKwogYXJjaC94ODYva3ZtL2t2bWlfbXNnLmMgICAgICAgICAgICAgICAg
ICAgICAgIHwgMjEgKysrKysKIGluY2x1ZGUvdWFwaS9saW51eC9rdm1pLmggICAgICAgICAgICAg
ICAgICAgICB8ICAxICsKIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVz
dC5jICB8IDgzICsrKysrKysrKysrKysrKysrKysKIHZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3Zt
aV9pbnQuaCAgICAgICAgICAgICB8ICAxICsKIHZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9t
c2cuYyAgICAgICAgICAgICB8ICA2ICstCiA5IGZpbGVzIGNoYW5nZWQsIDE2NSBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0v
a3ZtaS5yc3QgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0CmluZGV4IGRiYWVkYmVl
OWRlZS4uMTc4ODMyMzA0NDU4IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2
bWkucnN0CisrKyBiL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKQEAgLTYwMSw2ICs2
MDEsMzUgQEAgcmVnaXN0ZXJzLCB0aGUgc3BlY2lhbCByZWdpc3RlcnMgYW5kIHRoZSByZXF1ZXN0
ZWQgc2V0IG9mIE1TUnMuCiAqIC1LVk1fRUFHQUlOIC0gdGhlIHNlbGVjdGVkIHZDUFUgY2FuJ3Qg
YmUgaW50cm9zcGVjdGVkIHlldAogKiAtS1ZNX0VOT01FTSAtIHRoZXJlIGlzIG5vdCBlbm91Z2gg
bWVtb3J5IHRvIGFsbG9jYXRlIHRoZSByZXBseQogCisxMi4gS1ZNSV9WQ1BVX1NFVF9SRUdJU1RF
UlMKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorCis6QXJjaGl0ZWN0dXJlczogeDg2Cis6
VmVyc2lvbnM6ID49IDEKKzpQYXJhbWV0ZXJzOgorCis6OgorCisJc3RydWN0IGt2bWlfdmNwdV9o
ZHI7CisJc3RydWN0IGt2bV9yZWdzOworCis6UmV0dXJuczoKKworOjoKKworCXN0cnVjdCBrdm1p
X2Vycm9yX2NvZGUKKworU2V0cyB0aGUgZ2VuZXJhbCBwdXJwb3NlIHJlZ2lzdGVycyBmb3IgdGhl
IGdpdmVuIHZDUFUuIFRoZSBjaGFuZ2VzIGJlY29tZQordmlzaWJsZSB0byBvdGhlciB0aHJlYWRz
IGFjY2Vzc2luZyB0aGUgS1ZNIHZDUFUgc3RydWN0dXJlIGFmdGVyIHRoZSBldmVudAorY3VycmVu
dGx5IGJlaW5nIGhhbmRsZWQgaXMgcmVwbGllZCB0by4KKworOkVycm9yczoKKworKiAtS1ZNX0VJ
TlZBTCAtIHRoZSBzZWxlY3RlZCB2Q1BVIGlzIGludmFsaWQKKyogLUtWTV9FSU5WQUwgLSB0aGUg
cGFkZGluZyBpcyBub3QgemVybworKiAtS1ZNX0VBR0FJTiAtIHRoZSBzZWxlY3RlZCB2Q1BVIGNh
bid0IGJlIGludHJvc3BlY3RlZCB5ZXQKKyogLUtWTV9FT1BOT1RTVVBQIC0gdGhlIGNvbW1hbmQg
aGFzbid0IGJlZW4gcmVjZWl2ZWQgZHVyaW5nIGFuIGludHJvc3BlY3Rpb24gZXZlbnQKKwogRXZl
bnRzCiA9PT09PT0KIApkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtaV9ob3N0
LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1pX2hvc3QuaAppbmRleCAwNWFkZTNhMTZiMjQu
LmNjOTQ1MTUxY2IzNiAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtaV9ob3N0
LmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtaV9ob3N0LmgKQEAgLTUsNiArNSw4IEBA
CiAjaW5jbHVkZSA8YXNtL2t2bWkuaD4KIAogc3RydWN0IGt2bV92Y3B1X2FyY2hfaW50cm9zcGVj
dGlvbiB7CisJc3RydWN0IGt2bV9yZWdzIGRlbGF5ZWRfcmVnczsKKwlib29sIGhhdmVfZGVsYXll
ZF9yZWdzOwogfTsKIAogc3RydWN0IGt2bV9hcmNoX2ludHJvc3BlY3Rpb24gewpkaWZmIC0tZ2l0
IGEvYXJjaC94ODYva3ZtL2t2bWkuYyBiL2FyY2gveDg2L2t2bS9rdm1pLmMKaW5kZXggZmE5YjIw
Mjc3ZGFkLi4zOTYzOGFmNzc1N2UgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9rdm1pLmMKKysr
IGIvYXJjaC94ODYva3ZtL2t2bWkuYwpAQCAtMTE4LDMgKzExOCwyNSBAQCBpbnQga3ZtaV9hcmNo
X2NtZF92Y3B1X2dldF9yZWdpc3RlcnMoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCiAJcmV0dXJu
IGVyciA/IC1LVk1fRUlOVkFMIDogMDsKIH0KKwordm9pZCBrdm1pX2FyY2hfY21kX3ZjcHVfc2V0
X3JlZ2lzdGVycyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCisJCQkJICAgICAgY29uc3Qgc3RydWN0
IGt2bV9yZWdzICpyZWdzKQoreworCXN0cnVjdCBrdm1fdmNwdV9pbnRyb3NwZWN0aW9uICp2Y3B1
aSA9IFZDUFVJKHZjcHUpOworCXN0cnVjdCBrdm1fcmVncyAqZGVzdCA9ICZ2Y3B1aS0+YXJjaC5k
ZWxheWVkX3JlZ3M7CisKKwltZW1jcHkoZGVzdCwgcmVncywgc2l6ZW9mKCpkZXN0KSk7CisKKwl2
Y3B1aS0+YXJjaC5oYXZlX2RlbGF5ZWRfcmVncyA9IHRydWU7Cit9CisKK3ZvaWQga3ZtaV9hcmNo
X3Bvc3RfcmVwbHkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCXN0cnVjdCBrdm1fdmNwdV9p
bnRyb3NwZWN0aW9uICp2Y3B1aSA9IFZDUFVJKHZjcHUpOworCisJaWYgKCF2Y3B1aS0+YXJjaC5o
YXZlX2RlbGF5ZWRfcmVncykKKwkJcmV0dXJuOworCisJa3ZtX2FyY2hfdmNwdV9zZXRfcmVncyh2
Y3B1LCAmdmNwdWktPmFyY2guZGVsYXllZF9yZWdzLCBmYWxzZSk7CisJdmNwdWktPmFyY2guaGF2
ZV9kZWxheWVkX3JlZ3MgPSBmYWxzZTsKK30KZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9rdm1p
LmggYi9hcmNoL3g4Ni9rdm0va3ZtaS5oCmluZGV4IDdhYWI0YWFhYmNkYS4uNGVlYjBjOTAwMDgz
IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0va3ZtaS5oCisrKyBiL2FyY2gveDg2L2t2bS9rdm1p
LmgKQEAgLTUsNSArNSw3IEBACiBpbnQga3ZtaV9hcmNoX2NtZF92Y3B1X2dldF9yZWdpc3RlcnMo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCQkJCWNvbnN0IHN0cnVjdCBrdm1pX3ZjcHVfZ2V0X3Jl
Z2lzdGVycyAqcmVxLAogCQkJCXN0cnVjdCBrdm1pX3ZjcHVfZ2V0X3JlZ2lzdGVyc19yZXBseSAq
cnBsKTsKK3ZvaWQga3ZtaV9hcmNoX2NtZF92Y3B1X3NldF9yZWdpc3RlcnMoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LAorCQkJCSAgICAgIGNvbnN0IHN0cnVjdCBrdm1fcmVncyAqcmVncyk7CiAKICNl
bmRpZgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL2t2bWlfbXNnLmMgYi9hcmNoL3g4Ni9rdm0v
a3ZtaV9tc2cuYwppbmRleCA0Mjg4YTkxOTM3ZjYuLjhmZjNhYTkzNmNjZCAxMDA2NDQKLS0tIGEv
YXJjaC94ODYva3ZtL2t2bWlfbXNnLmMKKysrIGIvYXJjaC94ODYva3ZtL2t2bWlfbXNnLmMKQEAg
LTkwLDkgKzkwLDMwIEBAIHN0YXRpYyBpbnQgaGFuZGxlX3ZjcHVfZ2V0X3JlZ2lzdGVycyhjb25z
dCBzdHJ1Y3Qga3ZtaV92Y3B1X21zZ19qb2IgKmpvYiwKIAlyZXR1cm4gZXJyOwogfQogCitzdGF0
aWMgaW50IGhhbmRsZV92Y3B1X3NldF9yZWdpc3RlcnMoY29uc3Qgc3RydWN0IGt2bWlfdmNwdV9t
c2dfam9iICpqb2IsCisJCQkJICAgICBjb25zdCBzdHJ1Y3Qga3ZtaV9tc2dfaGRyICptc2csCisJ
CQkJICAgICBjb25zdCB2b2lkICpyZXEpCit7CisJY29uc3Qgc3RydWN0IGt2bV9yZWdzICpyZWdz
ID0gcmVxOworCXNpemVfdCBjbWRfc2l6ZTsKKwlpbnQgZWMgPSAwOworCisJY21kX3NpemUgPSBz
aXplb2Yoc3RydWN0IGt2bWlfdmNwdV9oZHIpICsgc2l6ZW9mKCpyZWdzKTsKKworCWlmIChjbWRf
c2l6ZSA+IG1zZy0+c2l6ZSkKKwkJZWMgPSAtS1ZNX0VJTlZBTDsKKwllbHNlIGlmICghVkNQVUko
am9iLT52Y3B1KS0+d2FpdGluZ19mb3JfcmVwbHkpCisJCWVjID0gLUtWTV9FT1BOT1RTVVBQOwor
CWVsc2UKKwkJa3ZtaV9hcmNoX2NtZF92Y3B1X3NldF9yZWdpc3RlcnMoam9iLT52Y3B1LCByZWdz
KTsKKworCXJldHVybiBrdm1pX21zZ192Y3B1X3JlcGx5KGpvYiwgbXNnLCBlYywgTlVMTCwgMCk7
Cit9CisKIHN0YXRpYyBrdm1pX3ZjcHVfbXNnX2pvYl9mY3QgY29uc3QgbXNnX3ZjcHVbXSA9IHsK
IAlbS1ZNSV9WQ1BVX0dFVF9JTkZPXSAgICAgID0gaGFuZGxlX3ZjcHVfZ2V0X2luZm8sCiAJW0tW
TUlfVkNQVV9HRVRfUkVHSVNURVJTXSA9IGhhbmRsZV92Y3B1X2dldF9yZWdpc3RlcnMsCisJW0tW
TUlfVkNQVV9TRVRfUkVHSVNURVJTXSA9IGhhbmRsZV92Y3B1X3NldF9yZWdpc3RlcnMsCiB9Owog
CiBrdm1pX3ZjcHVfbXNnX2pvYl9mY3Qga3ZtaV9hcmNoX3ZjcHVfbXNnX2hhbmRsZXIodTE2IGlk
KQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaCBiL2luY2x1ZGUvdWFwaS9s
aW51eC9rdm1pLmgKaW5kZXggODU0OGVhZDQ1MWMxLi40Yjc1NmQzODhhZDMgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvdWFwaS9saW51eC9rdm1pLmgKKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWku
aApAQCAtMzgsNiArMzgsNyBAQCBlbnVtIHsKIAlLVk1JX1ZDUFVfR0VUX0lORk8gICAgICAgPSBL
Vk1JX1ZDUFVfTUVTU0FHRV9JRCgxKSwKIAlLVk1JX1ZDUFVfQ09OVFJPTF9FVkVOVFMgPSBLVk1J
X1ZDUFVfTUVTU0FHRV9JRCgyKSwKIAlLVk1JX1ZDUFVfR0VUX1JFR0lTVEVSUyAgPSBLVk1JX1ZD
UFVfTUVTU0FHRV9JRCgzKSwKKwlLVk1JX1ZDUFVfU0VUX1JFR0lTVEVSUyAgPSBLVk1JX1ZDUFVf
TUVTU0FHRV9JRCg0KSwKIAogCUtWTUlfTkVYVF9WQ1BVX01FU1NBR0UKIH07CmRpZmYgLS1naXQg
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jIGIvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYwppbmRleCBmOTFhNzBhZDEw
MTMuLjMxMWEwNTBjMjZjMSAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3Zt
L3g4Nl82NC9rdm1pX3Rlc3QuYworKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2
XzY0L2t2bWlfdGVzdC5jCkBAIC02MzgsNiArNjM4LDE2IEBAIHN0YXRpYyBpbnQgZG9fdmNwdV9j
b21tYW5kKHN0cnVjdCBrdm1fdm0gKnZtLCBpbnQgY21kX2lkLAogCXJldHVybiByOwogfQogCitz
dGF0aWMgaW50IF9fZG9fdmNwdTBfY29tbWFuZChpbnQgY21kX2lkLCBzdHJ1Y3Qga3ZtaV9tc2df
aGRyICpyZXEsCisJCQkgICAgICBzaXplX3QgcmVxX3NpemUsIHZvaWQgKnJwbCwgc2l6ZV90IHJw
bF9zaXplKQoreworCXN0cnVjdCBrdm1pX3ZjcHVfaGRyICp2Y3B1X2hkciA9IChzdHJ1Y3Qga3Zt
aV92Y3B1X2hkciAqKShyZXEgKyAxKTsKKworCXZjcHVfaGRyLT52Y3B1ID0gMDsKKworCXJldHVy
biBkb19jb21tYW5kKGNtZF9pZCwgcmVxLCByZXFfc2l6ZSwgcnBsLCBycGxfc2l6ZSk7Cit9CisK
IHN0YXRpYyBpbnQgZG9fdmNwdTBfY29tbWFuZChzdHJ1Y3Qga3ZtX3ZtICp2bSwgaW50IGNtZF9p
ZCwKIAkJCSAgICBzdHJ1Y3Qga3ZtaV9tc2dfaGRyICpyZXEsIHNpemVfdCByZXFfc2l6ZSwKIAkJ
CSAgICB2b2lkICpycGwsIHNpemVfdCBycGxfc2l6ZSkKQEAgLTg2Niw2ICs4NzYsNzggQEAgc3Rh
dGljIHZvaWQgdGVzdF9jbWRfdmNwdV9nZXRfcmVnaXN0ZXJzKHN0cnVjdCBrdm1fdm0gKnZtKQog
CXRlc3RfaW52YWxpZF92Y3B1X2dldF9yZWdpc3RlcnModm0pOwogfQogCitzdGF0aWMgaW50IF9f
Y21kX3ZjcHVfc2V0X3JlZ2lzdGVycyhzdHJ1Y3Qga3ZtX3ZtICp2bSwKKwkJCQkgICAgc3RydWN0
IGt2bV9yZWdzICpyZWdzKQoreworCXN0cnVjdCB7CisJCXN0cnVjdCBrdm1pX21zZ19oZHIgaGRy
OworCQlzdHJ1Y3Qga3ZtaV92Y3B1X2hkciB2Y3B1X2hkcjsKKwkJc3RydWN0IGt2bV9yZWdzIHJl
Z3M7CisJfSByZXEgPSB7fTsKKworCW1lbWNweSgmcmVxLnJlZ3MsIHJlZ3MsIHNpemVvZihyZXEu
cmVncykpOworCisJcmV0dXJuIF9fZG9fdmNwdTBfY29tbWFuZChLVk1JX1ZDUFVfU0VUX1JFR0lT
VEVSUywKKwkJCQkgICZyZXEuaGRyLCBzaXplb2YocmVxKSwgTlVMTCwgMCk7Cit9CisKK3N0YXRp
YyB2b2lkIHRlc3RfaW52YWxpZF9jbWRfdmNwdV9zZXRfcmVnaXN0ZXJzKHN0cnVjdCBrdm1fdm0g
KnZtKQoreworCXN0cnVjdCB2Y3B1X3dvcmtlcl9kYXRhIGRhdGEgPSB7LnZtID0gdm0sIC52Y3B1
X2lkID0gVkNQVV9JRH07CisJcHRocmVhZF90IHZjcHVfdGhyZWFkOworCXN0cnVjdCBrdm1fcmVn
cyByZWdzOworCWludCByOworCisJdmNwdV90aHJlYWQgPSBzdGFydF92Y3B1X3dvcmtlcigmZGF0
YSk7CisKKwlyID0gX19jbWRfdmNwdV9zZXRfcmVnaXN0ZXJzKHZtLCAmcmVncyk7CisKKwl3YWl0
X3ZjcHVfd29ya2VyKHZjcHVfdGhyZWFkKTsKKworCVRFU1RfQVNTRVJUKHIgPT0gLUtWTV9FT1BO
T1RTVVBQLAorCQkiS1ZNSV9WQ1BVX1NFVF9SRUdJU1RFUlMgZGlkbid0IGZhaWxlZCB3aXRoIEtW
TV9FT1BOT1RTVVBQLCBlcnJvciAlZCglcylcbiIsCisJCS1yLCBrdm1fc3RyZXJyb3IoLXIpKTsK
K30KKworc3RhdGljIHZvaWQgX19zZXRfcmVnaXN0ZXJzKHN0cnVjdCBrdm1fdm0gKnZtLAorCQkJ
ICAgIHN0cnVjdCBrdm1fcmVncyAqcmVncykKK3sKKwlpbnQgcjsKKworCXIgPSBfX2NtZF92Y3B1
X3NldF9yZWdpc3RlcnModm0sIHJlZ3MpOworCVRFU1RfQVNTRVJUKHIgPT0gMCwKKwkJIktWTUlf
VkNQVV9TRVRfUkVHSVNURVJTIGZhaWxlZCwgZXJyb3IgJWQoJXMpXG4iLAorCQktciwga3ZtX3N0
cmVycm9yKC1yKSk7Cit9CisKK3N0YXRpYyB2b2lkIHRlc3RfY21kX3ZjcHVfc2V0X3JlZ2lzdGVy
cyhzdHJ1Y3Qga3ZtX3ZtICp2bSkKK3sKKwlzdHJ1Y3QgdmNwdV93b3JrZXJfZGF0YSBkYXRhID0g
ey52bSA9IHZtLCAudmNwdV9pZCA9IFZDUFVfSUR9OworCV9fdTE2IGV2ZW50X2lkID0gS1ZNSV9W
Q1BVX0VWRU5UX1BBVVNFOworCXN0cnVjdCBrdm1pX21zZ19oZHIgaGRyOworCXB0aHJlYWRfdCB2
Y3B1X3RocmVhZDsKKwlzdHJ1Y3QgdmNwdV9ldmVudCBldjsKKwlzdHJ1Y3QgdmNwdV9yZXBseSBy
cGwgPSB7fTsKKwlzdHJ1Y3Qga3ZtX3JlZ3MgcmVncyA9IHt9OworCisJY21kX3ZjcHVfZ2V0X3Jl
Z2lzdGVycyh2bSwgJnJlZ3MpOworCisJdGVzdF9pbnZhbGlkX2NtZF92Y3B1X3NldF9yZWdpc3Rl
cnModm0pOworCisJcGF1c2VfdmNwdSgpOworCisJdmNwdV90aHJlYWQgPSBzdGFydF92Y3B1X3dv
cmtlcigmZGF0YSk7CisKKwlyZWNlaXZlX3ZjcHVfZXZlbnQoJmhkciwgJmV2LCBzaXplb2YoZXYp
LCBldmVudF9pZCk7CisKKwlfX3NldF9yZWdpc3RlcnModm0sICZldi5jb21tb24uYXJjaC5yZWdz
KTsKKworCXJlcGx5X3RvX2V2ZW50KCZoZHIsICZldiwgS1ZNSV9FVkVOVF9BQ1RJT05fQ09OVElO
VUUsCisJCQkmcnBsLCBzaXplb2YocnBsKSk7CisKKwl3YWl0X3ZjcHVfd29ya2VyKHZjcHVfdGhy
ZWFkKTsKK30KKwogc3RhdGljIHZvaWQgdGVzdF9pbnRyb3NwZWN0aW9uKHN0cnVjdCBrdm1fdm0g
KnZtKQogewogCXNyYW5kb20odGltZSgwKSk7CkBAIC04ODQsNiArOTY2LDcgQEAgc3RhdGljIHZv
aWQgdGVzdF9pbnRyb3NwZWN0aW9uKHN0cnVjdCBrdm1fdm0gKnZtKQogCXRlc3RfcGF1c2Uodm0p
OwogCXRlc3RfY21kX3ZjcHVfY29udHJvbF9ldmVudHModm0pOwogCXRlc3RfY21kX3ZjcHVfZ2V0
X3JlZ2lzdGVycyh2bSk7CisJdGVzdF9jbWRfdmNwdV9zZXRfcmVnaXN0ZXJzKHZtKTsKIAogCXVu
aG9va19pbnRyb3NwZWN0aW9uKHZtKTsKIH0KZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2ludHJvc3Bl
Y3Rpb24va3ZtaV9pbnQuaCBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaAppbmRl
eCA4MDU5MDI5Y2FkZjQuLjAxODc2NGNhMWI3MSAxMDA2NDQKLS0tIGEvdmlydC9rdm0vaW50cm9z
cGVjdGlvbi9rdm1pX2ludC5oCisrKyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQu
aApAQCAtNzAsNSArNzAsNiBAQCB2b2lkIGt2bWlfYXJjaF9pbml0X3ZjcHVfZXZlbnRzX21hc2so
dW5zaWduZWQgbG9uZyAqc3VwcG9ydGVkKTsKIGt2bWlfdmNwdV9tc2dfam9iX2ZjdCBrdm1pX2Fy
Y2hfdmNwdV9tc2dfaGFuZGxlcih1MTYgaWQpOwogdm9pZCBrdm1pX2FyY2hfc2V0dXBfdmNwdV9l
dmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkJc3RydWN0IGt2bWlfdmNwdV9ldmVudCAq
ZXYpOwordm9pZCBrdm1pX2FyY2hfcG9zdF9yZXBseShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwog
CiAjZW5kaWYKZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYyBi
L3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYwppbmRleCA5ODYxNzkxN2YzMTkuLmVh
OGQ4MjRiNjk4YyAxMDA2NDQKLS0tIGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX21zZy5j
CisrKyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYwpAQCAtNzIyLDEwICs3MjIs
MTIgQEAgaW50IGt2bWlfc2VuZF92Y3B1X2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTMy
IGV2X2lkLAogb3V0OgogCXZjcHVpLT53YWl0aW5nX2Zvcl9yZXBseSA9IGZhbHNlOwogCi0JaWYg
KGVycikKKwlpZiAoZXJyKSB7CiAJCWt2bWlfc29ja19zaHV0ZG93bihrdm1pKTsKLQllbHNlCisJ
fSBlbHNlIHsKKwkJa3ZtaV9hcmNoX3Bvc3RfcmVwbHkodmNwdSk7CiAJCSphY3Rpb24gPSB2Y3B1
aS0+cmVwbHkuYWN0aW9uOworCX0KIAogCXJldHVybiBlcnI7CiB9Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
