Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A0D155E05
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:26:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BE24D86943;
	Fri,  7 Feb 2020 18:26:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MZsMmqN-OXO4; Fri,  7 Feb 2020 18:26:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A094C86A34;
	Fri,  7 Feb 2020 18:26:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 858BEC1D81;
	Fri,  7 Feb 2020 18:26:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12AA9C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EB90186980
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bjqDXCzYfBpH
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D272A86943
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 C1FA4305D34D; Fri,  7 Feb 2020 20:16:40 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id AC853305207C;
 Fri,  7 Feb 2020 20:16:40 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 47/78] KVM: introspection: add a jobs list to every
 introspected vCPU
Date: Fri,  7 Feb 2020 20:16:05 +0200
Message-Id: <20200207181636.1065-48-alazar@bitdefender.com>
In-Reply-To: <20200207181636.1065-1-alazar@bitdefender.com>
References: <20200207181636.1065-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <ncitu@bitdefender.com>,
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

RXZlcnkgdkNQVSBoYXMgYSBsb2NrLXByb3RlY3RlZCBsaXN0IGluIHdoaWNoIChtb3N0bHkpIHRo
ZSByZWNlaXZpbmcKd29ya2VyIHBsYWNlcyB0aGUgam9icyB0aGF0IGhhcyB0byBiZSBkb25lIGJ5
IHRoZSB2Q1BVIG9uY2UgaXQgaXMga2lja2VkCihLVk1fUkVRX0lOVFJPU1BFQ1RJT04pIG91dCBv
ZiBndWVzdC4KCkEgam9iIGlzIGRlZmluZWQgYnkgYSAiZG8iIGZ1bmN0aW9uLCBhICJmcmVlIiBm
dW5jdGlvbiBhbmQgYSBwb2ludGVyCihjb250ZXh0KS4KCkNvLWRldmVsb3BlZC1ieTogTmljdciZ
b3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IE5pY3XImW9y
IEPDrsibdSA8bmNpdHVAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBM
YXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogaW5jbHVkZS9saW51eC9rdm1pX2hv
c3QuaCAgICAgICAgIHwgMTAgKysrKysKIHZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5jICAg
ICB8IDY4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIHZpcnQva3ZtL2ludHJvc3Bl
Y3Rpb24va3ZtaV9pbnQuaCB8ICAxICsKIDMgZmlsZXMgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2t2bWlfaG9zdC5o
IGIvaW5jbHVkZS9saW51eC9rdm1pX2hvc3QuaAppbmRleCBjYTJkYjgwNDNhNTMuLjFkODBkMjMz
ZmJkNSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9rdm1pX2hvc3QuaAorKysgYi9pbmNsdWRl
L2xpbnV4L2t2bWlfaG9zdC5oCkBAIC0xMSw4ICsxMSwxOCBAQCBzdHJ1Y3Qga3ZtX3ZjcHU7CiAK
ICNkZWZpbmUgS1ZNSV9OVU1fQ09NTUFORFMgS1ZNSV9OVU1fTUVTU0FHRVMKIAorc3RydWN0IGt2
bWlfam9iIHsKKwlzdHJ1Y3QgbGlzdF9oZWFkIGxpbms7CisJdm9pZCAqY3R4OworCXZvaWQgKCpm
Y3QpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdm9pZCAqY3R4KTsKKwl2b2lkICgqZnJlZV9mY3Qp
KHZvaWQgKmN0eCk7Cit9OworCiBzdHJ1Y3Qga3ZtX3ZjcHVfaW50cm9zcGVjdGlvbiB7CiAJc3Ry
dWN0IGt2bV92Y3B1X2FyY2hfaW50cm9zcGVjdGlvbiBhcmNoOworCisJc3RydWN0IGxpc3RfaGVh
ZCBqb2JfbGlzdDsKKwlzcGlubG9ja190IGpvYl9sb2NrOwogfTsKIAogc3RydWN0IGt2bV9pbnRy
b3NwZWN0aW9uIHsKZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5jIGIv
dmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMKaW5kZXggNjU1MTcwZmZiNTc0Li41MTQ5Zjhl
MDYxMzEgMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5jCisrKyBiL3Zp
cnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5jCkBAIC0xMCw2ICsxMCw3IEBACiAjaW5jbHVkZSA8
bGludXgva3RocmVhZC5oPgogCiBzdGF0aWMgc3RydWN0IGttZW1fY2FjaGUgKm1zZ19jYWNoZTsK
K3N0YXRpYyBzdHJ1Y3Qga21lbV9jYWNoZSAqam9iX2NhY2hlOwogCiB2b2lkICprdm1pX21zZ19h
bGxvYyh2b2lkKQogewpAQCAtMzMsMTQgKzM0LDE5IEBAIHN0YXRpYyB2b2lkIGt2bWlfY2FjaGVf
ZGVzdHJveSh2b2lkKQogewogCWttZW1fY2FjaGVfZGVzdHJveShtc2dfY2FjaGUpOwogCW1zZ19j
YWNoZSA9IE5VTEw7CisJa21lbV9jYWNoZV9kZXN0cm95KGpvYl9jYWNoZSk7CisJam9iX2NhY2hl
ID0gTlVMTDsKIH0KIAogc3RhdGljIGludCBrdm1pX2NhY2hlX2NyZWF0ZSh2b2lkKQogewogCW1z
Z19jYWNoZSA9IGttZW1fY2FjaGVfY3JlYXRlKCJrdm1pX21zZyIsIEtWTUlfTVNHX1NJWkVfQUxM
T0MsCiAJCQkJICAgICAgNDA5NiwgU0xBQl9BQ0NPVU5ULCBOVUxMKTsKKwlqb2JfY2FjaGUgPSBr
bWVtX2NhY2hlX2NyZWF0ZSgia3ZtaV9qb2IiLAorCQkJCSAgICAgIHNpemVvZihzdHJ1Y3Qga3Zt
aV9qb2IpLAorCQkJCSAgICAgIDAsIFNMQUJfQUNDT1VOVCwgTlVMTCk7CiAKLQlpZiAoIW1zZ19j
YWNoZSkgeworCWlmICghbXNnX2NhY2hlIHx8ICFqb2JfY2FjaGUpIHsKIAkJa3ZtaV9jYWNoZV9k
ZXN0cm95KCk7CiAKIAkJcmV0dXJuIC0xOwpAQCAtNTksNiArNjUsNDggQEAgdm9pZCBrdm1pX3Vu
aW5pdCh2b2lkKQogCWt2bWlfY2FjaGVfZGVzdHJveSgpOwogfQogCitzdGF0aWMgaW50IF9fa3Zt
aV9hZGRfam9iKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKKwkJCSAgdm9pZCAoKmZjdCkoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LCB2b2lkICpjdHgpLAorCQkJICB2b2lkICpjdHgsIHZvaWQgKCpmcmVl
X2ZjdCkodm9pZCAqY3R4KSkKK3sKKwlzdHJ1Y3Qga3ZtX3ZjcHVfaW50cm9zcGVjdGlvbiAqdmNw
dWkgPSBWQ1BVSSh2Y3B1KTsKKwlzdHJ1Y3Qga3ZtaV9qb2IgKmpvYjsKKworCWpvYiA9IGttZW1f
Y2FjaGVfemFsbG9jKGpvYl9jYWNoZSwgR0ZQX0tFUk5FTCk7CisJaWYgKHVubGlrZWx5KCFqb2Ip
KQorCQlyZXR1cm4gLUVOT01FTTsKKworCUlOSVRfTElTVF9IRUFEKCZqb2ItPmxpbmspOworCWpv
Yi0+ZmN0ID0gZmN0OworCWpvYi0+Y3R4ID0gY3R4OworCWpvYi0+ZnJlZV9mY3QgPSBmcmVlX2Zj
dDsKKworCXNwaW5fbG9jaygmdmNwdWktPmpvYl9sb2NrKTsKKwlsaXN0X2FkZF90YWlsKCZqb2It
PmxpbmssICZ2Y3B1aS0+am9iX2xpc3QpOworCXNwaW5fdW5sb2NrKCZ2Y3B1aS0+am9iX2xvY2sp
OworCisJcmV0dXJuIDA7Cit9CisKK2ludCBrdm1pX2FkZF9qb2Ioc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LAorCQkgdm9pZCAoKmZjdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB2b2lkICpjdHgpLAor
CQkgdm9pZCAqY3R4LCB2b2lkICgqZnJlZV9mY3QpKHZvaWQgKmN0eCkpCit7CisJaW50IGVycjsK
KworCWVyciA9IF9fa3ZtaV9hZGRfam9iKHZjcHUsIGZjdCwgY3R4LCBmcmVlX2ZjdCk7CisKKwly
ZXR1cm4gZXJyOworfQorCitzdGF0aWMgdm9pZCBrdm1pX2ZyZWVfam9iKHN0cnVjdCBrdm1pX2pv
YiAqam9iKQoreworCWlmIChqb2ItPmZyZWVfZmN0KQorCQlqb2ItPmZyZWVfZmN0KGpvYi0+Y3R4
KTsKKworCWttZW1fY2FjaGVfZnJlZShqb2JfY2FjaGUsIGpvYik7Cit9CisKIHN0YXRpYyBib29s
IGFsbG9jX3ZjcHVpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIHsKIAlzdHJ1Y3Qga3ZtX3ZjcHVf
aW50cm9zcGVjdGlvbiAqdmNwdWk7CkBAIC02Nyw2ICsxMTUsOSBAQCBzdGF0aWMgYm9vbCBhbGxv
Y192Y3B1aShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJaWYgKCF2Y3B1aSkKIAkJcmV0dXJuIGZh
bHNlOwogCisJSU5JVF9MSVNUX0hFQUQoJnZjcHVpLT5qb2JfbGlzdCk7CisJc3Bpbl9sb2NrX2lu
aXQoJnZjcHVpLT5qb2JfbG9jayk7CisKIAl2Y3B1LT5rdm1pID0gdmNwdWk7CiAKIAlyZXR1cm4g
dHJ1ZTsKQEAgLTgyLDcgKzEzMywyMCBAQCBzdGF0aWMgaW50IGNyZWF0ZV92Y3B1aShzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpCiAKIHN0YXRpYyB2b2lkIGZyZWVfdmNwdWkoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KQogewotCWtmcmVlKHZjcHUtPmt2bWkpOworCXN0cnVjdCBrdm1fdmNwdV9pbnRyb3Nw
ZWN0aW9uICp2Y3B1aSA9IHZjcHUtPmt2bWk7CisJc3RydWN0IGt2bWlfam9iICpjdXIsICpuZXh0
OworCisJaWYgKCF2Y3B1aSkKKwkJcmV0dXJuOworCisJc3Bpbl9sb2NrKCZ2Y3B1aS0+am9iX2xv
Y2spOworCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShjdXIsIG5leHQsICZ2Y3B1aS0+am9iX2xp
c3QsIGxpbmspIHsKKwkJbGlzdF9kZWwoJmN1ci0+bGluayk7CisJCWt2bWlfZnJlZV9qb2IoY3Vy
KTsKKwl9CisJc3Bpbl91bmxvY2soJnZjcHVpLT5qb2JfbG9jayk7CisKKwlrZnJlZSh2Y3B1aSk7
CiAJdmNwdS0+a3ZtaSA9IE5VTEw7CiB9CiAKZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2ludHJvc3Bl
Y3Rpb24va3ZtaV9pbnQuaCBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaAppbmRl
eCAzYmM1OThiOWI2NmMuLmUwZDgyNTYxNjJmOSAxMDA2NDQKLS0tIGEvdmlydC9rdm0vaW50cm9z
cGVjdGlvbi9rdm1pX2ludC5oCisrKyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQu
aApAQCAtMzYsNiArMzYsNyBAQAogCQkpCiAKICNkZWZpbmUgS1ZNSShrdm0pICgoc3RydWN0IGt2
bV9pbnRyb3NwZWN0aW9uICopKChrdm0pLT5rdm1pKSkKKyNkZWZpbmUgVkNQVUkodmNwdSkgKChz
dHJ1Y3Qga3ZtX3ZjcHVfaW50cm9zcGVjdGlvbiAqKSgodmNwdSktPmt2bWkpKQogCiBzdGF0aWMg
aW5saW5lIGJvb2wgaXNfdm1fZXZlbnRfZW5hYmxlZChzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24g
Kmt2bWksCiAJCQkJCWludCBldmVudCkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9u
QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9u
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
