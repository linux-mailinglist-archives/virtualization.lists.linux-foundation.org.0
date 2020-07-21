Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 69392228B1D
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:26:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 19E2B86B7D;
	Tue, 21 Jul 2020 21:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qtB6PmHMpAay; Tue, 21 Jul 2020 21:25:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 282B086BA1;
	Tue, 21 Jul 2020 21:25:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F15E2C016F;
	Tue, 21 Jul 2020 21:25:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41C22C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2D8DB880C3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oq05hcVoCiC3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A446487A39
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 6FA5A305D61D; Wed, 22 Jul 2020 00:09:26 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 4DF67304FA12;
 Wed, 22 Jul 2020 00:09:26 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 48/84] KVM: introspection: add a jobs list to every
 introspected vCPU
Date: Wed, 22 Jul 2020 00:08:46 +0300
Message-Id: <20200721210922.7646-49-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <ncitu@bitdefender.com>,
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

RXZlcnkgdkNQVSBoYXMgYSBsb2NrLXByb3RlY3RlZCBsaXN0IGluIHdoaWNoIHRoZSByZWNlaXZp
bmcgdGhyZWFkCnBsYWNlcyB0aGUgam9icyB0aGF0IGhhcyB0byBiZSBkb25lIGJ5IHRoZSB2Q1BV
IHRocmVhZApvbmNlIGl0IGlzIGtpY2tlZCBvdXQgb2YgZ3Vlc3QgKEtWTV9SRVFfSU5UUk9TUEVD
VElPTikuCgpDby1kZXZlbG9wZWQtYnk6IE5pY3XImW9yIEPDrsibdSA8bmNpdHVAYml0ZGVmZW5k
ZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBOaWN1yJlvciBDw67Im3UgPG5jaXR1QGJpdGRlZmVuZGVy
LmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIu
Y29tPgotLS0KIGluY2x1ZGUvbGludXgva3ZtaV9ob3N0LmggICAgICAgICB8IDEwICsrKysrCiB2
aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYyAgICAgfCA3MiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystCiB2aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmggfCAgMSArCiAz
IGZpbGVzIGNoYW5nZWQsIDgxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9rdm1pX2hvc3QuaCBiL2luY2x1ZGUvbGludXgva3ZtaV9ob3N0
LmgKaW5kZXggZjk2YTlhM2NmZGQ0Li5kMzI0MmE5OWY4OTEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUv
bGludXgva3ZtaV9ob3N0LmgKKysrIGIvaW5jbHVkZS9saW51eC9rdm1pX2hvc3QuaApAQCAtNiw4
ICs2LDE4IEBACiAKICNpbmNsdWRlIDxhc20va3ZtaV9ob3N0Lmg+CiAKK3N0cnVjdCBrdm1pX2pv
YiB7CisJc3RydWN0IGxpc3RfaGVhZCBsaW5rOworCXZvaWQgKmN0eDsKKwl2b2lkICgqZmN0KShz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHZvaWQgKmN0eCk7CisJdm9pZCAoKmZyZWVfZmN0KSh2b2lk
ICpjdHgpOworfTsKKwogc3RydWN0IGt2bV92Y3B1X2ludHJvc3BlY3Rpb24gewogCXN0cnVjdCBr
dm1fdmNwdV9hcmNoX2ludHJvc3BlY3Rpb24gYXJjaDsKKworCXN0cnVjdCBsaXN0X2hlYWQgam9i
X2xpc3Q7CisJc3BpbmxvY2tfdCBqb2JfbG9jazsKIH07CiAKIHN0cnVjdCBrdm1faW50cm9zcGVj
dGlvbiB7CmRpZmYgLS1naXQgYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYyBiL3ZpcnQv
a3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5jCmluZGV4IGE1MWU3MzQyZjgzNy4uYjY1OTViY2E5OWY3
IDEwMDY0NAotLS0gYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYworKysgYi92aXJ0L2t2
bS9pbnRyb3NwZWN0aW9uL2t2bWkuYwpAQCAtMTgsNiArMTgsNyBAQCBzdGF0aWMgREVDTEFSRV9C
SVRNQVAoS3ZtaV9rbm93bl92bV9ldmVudHMsIEtWTUlfTlVNX0VWRU5UUyk7CiBzdGF0aWMgREVD
TEFSRV9CSVRNQVAoS3ZtaV9rbm93bl92Y3B1X2V2ZW50cywgS1ZNSV9OVU1fRVZFTlRTKTsKIAog
c3RhdGljIHN0cnVjdCBrbWVtX2NhY2hlICptc2dfY2FjaGU7CitzdGF0aWMgc3RydWN0IGttZW1f
Y2FjaGUgKmpvYl9jYWNoZTsKIAogdm9pZCAqa3ZtaV9tc2dfYWxsb2Modm9pZCkKIHsKQEAgLTM0
LDE0ICszNSwxOSBAQCBzdGF0aWMgdm9pZCBrdm1pX2NhY2hlX2Rlc3Ryb3kodm9pZCkKIHsKIAlr
bWVtX2NhY2hlX2Rlc3Ryb3kobXNnX2NhY2hlKTsKIAltc2dfY2FjaGUgPSBOVUxMOworCWttZW1f
Y2FjaGVfZGVzdHJveShqb2JfY2FjaGUpOworCWpvYl9jYWNoZSA9IE5VTEw7CiB9CiAKIHN0YXRp
YyBpbnQga3ZtaV9jYWNoZV9jcmVhdGUodm9pZCkKIHsKIAltc2dfY2FjaGUgPSBrbWVtX2NhY2hl
X2NyZWF0ZSgia3ZtaV9tc2ciLCBLVk1JX01TR19TSVpFX0FMTE9DLAogCQkJCSAgICAgIDQwOTYs
IFNMQUJfQUNDT1VOVCwgTlVMTCk7CisJam9iX2NhY2hlID0ga21lbV9jYWNoZV9jcmVhdGUoImt2
bWlfam9iIiwKKwkJCQkgICAgICBzaXplb2Yoc3RydWN0IGt2bWlfam9iKSwKKwkJCQkgICAgICAw
LCBTTEFCX0FDQ09VTlQsIE5VTEwpOwogCi0JaWYgKCFtc2dfY2FjaGUpIHsKKwlpZiAoIW1zZ19j
YWNoZSB8fCAham9iX2NhY2hlKSB7CiAJCWt2bWlfY2FjaGVfZGVzdHJveSgpOwogCiAJCXJldHVy
biAtMTsKQEAgLTEwNyw2ICsxMTMsNDggQEAgdm9pZCBrdm1pX3VuaW5pdCh2b2lkKQogCWt2bWlf
Y2FjaGVfZGVzdHJveSgpOwogfQogCitzdGF0aWMgaW50IF9fa3ZtaV9hZGRfam9iKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwKKwkJCSAgdm9pZCAoKmZjdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB2
b2lkICpjdHgpLAorCQkJICB2b2lkICpjdHgsIHZvaWQgKCpmcmVlX2ZjdCkodm9pZCAqY3R4KSkK
K3sKKwlzdHJ1Y3Qga3ZtX3ZjcHVfaW50cm9zcGVjdGlvbiAqdmNwdWkgPSBWQ1BVSSh2Y3B1KTsK
KwlzdHJ1Y3Qga3ZtaV9qb2IgKmpvYjsKKworCWpvYiA9IGttZW1fY2FjaGVfemFsbG9jKGpvYl9j
YWNoZSwgR0ZQX0tFUk5FTCk7CisJaWYgKHVubGlrZWx5KCFqb2IpKQorCQlyZXR1cm4gLUVOT01F
TTsKKworCUlOSVRfTElTVF9IRUFEKCZqb2ItPmxpbmspOworCWpvYi0+ZmN0ID0gZmN0OworCWpv
Yi0+Y3R4ID0gY3R4OworCWpvYi0+ZnJlZV9mY3QgPSBmcmVlX2ZjdDsKKworCXNwaW5fbG9jaygm
dmNwdWktPmpvYl9sb2NrKTsKKwlsaXN0X2FkZF90YWlsKCZqb2ItPmxpbmssICZ2Y3B1aS0+am9i
X2xpc3QpOworCXNwaW5fdW5sb2NrKCZ2Y3B1aS0+am9iX2xvY2spOworCisJcmV0dXJuIDA7Cit9
CisKK2ludCBrdm1pX2FkZF9qb2Ioc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAorCQkgdm9pZCAoKmZj
dCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB2b2lkICpjdHgpLAorCQkgdm9pZCAqY3R4LCB2b2lk
ICgqZnJlZV9mY3QpKHZvaWQgKmN0eCkpCit7CisJaW50IGVycjsKKworCWVyciA9IF9fa3ZtaV9h
ZGRfam9iKHZjcHUsIGZjdCwgY3R4LCBmcmVlX2ZjdCk7CisKKwlyZXR1cm4gZXJyOworfQorCitz
dGF0aWMgdm9pZCBrdm1pX2ZyZWVfam9iKHN0cnVjdCBrdm1pX2pvYiAqam9iKQoreworCWlmIChq
b2ItPmZyZWVfZmN0KQorCQlqb2ItPmZyZWVfZmN0KGpvYi0+Y3R4KTsKKworCWttZW1fY2FjaGVf
ZnJlZShqb2JfY2FjaGUsIGpvYik7Cit9CisKIHN0YXRpYyBib29sIGFsbG9jX3ZjcHVpKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSkKIHsKIAlzdHJ1Y3Qga3ZtX3ZjcHVfaW50cm9zcGVjdGlvbiAqdmNw
dWk7CkBAIC0xMTUsNiArMTYzLDkgQEAgc3RhdGljIGJvb2wgYWxsb2NfdmNwdWkoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1KQogCWlmICghdmNwdWkpCiAJCXJldHVybiBmYWxzZTsKIAorCUlOSVRfTElT
VF9IRUFEKCZ2Y3B1aS0+am9iX2xpc3QpOworCXNwaW5fbG9ja19pbml0KCZ2Y3B1aS0+am9iX2xv
Y2spOworCiAJdmNwdS0+a3ZtaSA9IHZjcHVpOwogCiAJcmV0dXJuIHRydWU7CkBAIC0xMjgsOSAr
MTc5LDI2IEBAIHN0YXRpYyBpbnQgY3JlYXRlX3ZjcHVpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkK
IAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIHZvaWQgZnJlZV92Y3B1X2pvYnMoc3RydWN0IGt2bV92
Y3B1X2ludHJvc3BlY3Rpb24gKnZjcHVpKQoreworCXN0cnVjdCBrdm1pX2pvYiAqY3VyLCAqbmV4
dDsKKworCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShjdXIsIG5leHQsICZ2Y3B1aS0+am9iX2xp
c3QsIGxpbmspIHsKKwkJbGlzdF9kZWwoJmN1ci0+bGluayk7CisJCWt2bWlfZnJlZV9qb2IoY3Vy
KTsKKwl9Cit9CisKIHN0YXRpYyB2b2lkIGZyZWVfdmNwdWkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KQogewotCWtmcmVlKHZjcHUtPmt2bWkpOworCXN0cnVjdCBrdm1fdmNwdV9pbnRyb3NwZWN0aW9u
ICp2Y3B1aSA9IFZDUFVJKHZjcHUpOworCisJaWYgKCF2Y3B1aSkKKwkJcmV0dXJuOworCisJZnJl
ZV92Y3B1X2pvYnModmNwdWkpOworCisJa2ZyZWUodmNwdWkpOwogCXZjcHUtPmt2bWkgPSBOVUxM
OwogfQogCmRpZmYgLS1naXQgYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmggYi92
aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmgKaW5kZXggNDBlODY0N2E2ZmQ0Li5jZWVk
NTA3MjJkYzEgMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaAor
KysgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmgKQEAgLTE5LDYgKzE5LDcgQEAK
IAlrdm1faW5mbygiJXBVIEVSUk9SOiAiIGZtdCwgJmt2bWktPnV1aWQsICMjIF9fVkFfQVJHU19f
KQogCiAjZGVmaW5lIEtWTUkoa3ZtKSAoKGt2bSktPmt2bWkpCisjZGVmaW5lIFZDUFVJKHZjcHUp
ICgodmNwdSktPmt2bWkpCiAKIC8qIGt2bWlfbXNnLmMgKi8KIGJvb2wga3ZtaV9zb2NrX2dldChz
dHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksIGludCBmZCk7Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
