Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5937D42449B
	for <lists.virtualization@lfdr.de>; Wed,  6 Oct 2021 19:40:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7731240886;
	Wed,  6 Oct 2021 17:40:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KQK-ZF0CzFfe; Wed,  6 Oct 2021 17:40:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7FFBD407E5;
	Wed,  6 Oct 2021 17:40:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50AFAC000D;
	Wed,  6 Oct 2021 17:40:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 446C5C000D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6C1340898
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pnQW-qLlxDaa
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:40:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92A48407DC
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:40:42 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 07A1D30828BC; Wed,  6 Oct 2021 20:31:24 +0300 (EEST)
Received: from localhost (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id E42903064495;
 Wed,  6 Oct 2021 20:31:23 +0300 (EEST)
X-Is-Junk-Enabled: fGZTSsP0qEJE2AIKtlSuFiRRwg9xyHmJ
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v12 72/77] KVM: introspection: extend KVMI_GET_VERSION with
 struct kvmi_features
Date: Wed,  6 Oct 2021 20:31:08 +0300
Message-Id: <20211006173113.26445-73-alazar@bitdefender.com>
In-Reply-To: <20211006173113.26445-1-alazar@bitdefender.com>
References: <20211006173113.26445-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wanpeng Li <wanpengli@tencent.com>,
 Sean Christopherson <seanjc@google.com>, Joerg Roedel <joro@8bytes.org>,
 virtualization@lists.linux-foundation.org,
 =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>
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

VGhpcyBpcyB1c2VkIGJ5IHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wgdG8gY2hlY2sgdGhlIGhhcmR3
YXJlIHN1cHBvcnQKZm9yIHRoZSBzaW5nbGUgc3RlcCBmZWF0dXJlLgoKU2lnbmVkLW9mZi1ieTog
QWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIERvY3VtZW50YXRp
b24vdmlydC9rdm0va3ZtaS5yc3QgICAgICAgICAgICAgICAgfCAxNSArKysrKysrKysrKysrLS0K
IGFyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20va3ZtaS5oICAgICAgICAgICAgICAgfCAgNSArKysr
KwogYXJjaC94ODYva3ZtL2t2bWkuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsr
KysrCiBpbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oICAgICAgICAgICAgICAgICAgICAgIHwgIDEg
KwogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYyB8ICA2ICsr
KysrKwogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oICAgICAgICAgICAgICB8ICAx
ICsKIHZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYyAgICAgICAgICAgICAgfCAgMiAr
KwogNyBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QgYi9Eb2N1bWVudGF0aW9u
L3ZpcnQva3ZtL2t2bWkucnN0CmluZGV4IGIxMmFmZmIwZDY0Zi4uNTRjYjNmYmUxODRlIDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0CisrKyBiL0RvY3VtZW50YXRp
b24vdmlydC9rdm0va3ZtaS5yc3QKQEAgLTI0MywxMCArMjQzLDIxIEBAIFRoZSB2Q1BVIGNvbW1h
bmRzIHN0YXJ0IHdpdGg6OgogCXN0cnVjdCBrdm1pX2dldF92ZXJzaW9uX3JlcGx5IHsKIAkJX191
MzIgdmVyc2lvbjsKIAkJX191MzIgbWF4X21zZ19zaXplOworCQlzdHJ1Y3Qga3ZtaV9mZWF0dXJl
cyBmZWF0dXJlczsKIAl9OwogCi1SZXR1cm5zIHRoZSBpbnRyb3NwZWN0aW9uIEFQSSB2ZXJzaW9u
IGFuZCB0aGUgbGFyZ2VzdCBhY2NlcHRlZCBtZXNzYWdlCi1zaXplICh1c2VmdWwgZm9yIHZhcmlh
YmxlIGxlbmd0aCBtZXNzYWdlcykuCitGb3IgeDg2CisKKzo6CisKKwlzdHJ1Y3Qga3ZtaV9mZWF0
dXJlcyB7CisJCV9fdTggc2luZ2xlc3RlcDsKKwkJX191OCBwYWRkaW5nWzddOworCX07CisKK1Jl
dHVybnMgdGhlIGludHJvc3BlY3Rpb24gQVBJIHZlcnNpb24sIHRoZSBsYXJnZXN0IGFjY2VwdGVk
IG1lc3NhZ2Ugc2l6ZQorKHVzZWZ1bCBmb3IgdmFyaWFibGUgbGVuZ3RoIG1lc3NhZ2VzKSBhbmQg
c29tZSBvZiB0aGUgaGFyZHdhcmUgc3VwcG9ydGVkCitmZWF0dXJlcy4KIAogVGhpcyBjb21tYW5k
IGlzIGFsd2F5cyBhbGxvd2VkIGFuZCBzdWNjZXNzZnVsLgogCmRpZmYgLS1naXQgYS9hcmNoL3g4
Ni9pbmNsdWRlL3VhcGkvYXNtL2t2bWkuaCBiL2FyY2gveDg2L2luY2x1ZGUvdWFwaS9hc20va3Zt
aS5oCmluZGV4IDZlZjE0NGRkYjRiYi4uYzVhMmNiMWI1NGYxIDEwMDY0NAotLS0gYS9hcmNoL3g4
Ni9pbmNsdWRlL3VhcGkvYXNtL2t2bWkuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL3VhcGkvYXNt
L2t2bWkuaApAQCAtMTU5LDQgKzE1OSw5IEBAIHN0cnVjdCBrdm1pX3ZjcHVfZXZlbnRfbXNyX3Jl
cGx5IHsKIAlfX3U2NCBuZXdfdmFsOwogfTsKIAorc3RydWN0IGt2bWlfZmVhdHVyZXMgeworCV9f
dTggc2luZ2xlc3RlcDsKKwlfX3U4IHBhZGRpbmdbN107Cit9OworCiAjZW5kaWYgLyogX1VBUElf
QVNNX1g4Nl9LVk1JX0ggKi8KZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9rdm1pLmMgYi9hcmNo
L3g4Ni9rdm0va3ZtaS5jCmluZGV4IDY0MzJjNDA4MTdkMi4uZWVlODc0ODkwZTI5IDEwMDY0NAot
LS0gYS9hcmNoL3g4Ni9rdm0va3ZtaS5jCisrKyBiL2FyY2gveDg2L2t2bS9rdm1pLmMKQEAgLTEw
ODQsMyArMTA4NCw4IEBAIHN0YXRpYyB2b2lkIGt2bWlfdHJhY2tfZmx1c2hfc2xvdChzdHJ1Y3Qg
a3ZtICprdm0sIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QsCiAKIAlrdm1pX3B1dChrdm0p
OwogfQorCit2b2lkIGt2bWlfYXJjaF9mZWF0dXJlcyhzdHJ1Y3Qga3ZtaV9mZWF0dXJlcyAqZmVh
dCkKK3sKKwlmZWF0LT5zaW5nbGVzdGVwID0gISFrdm1feDg2X29wcy5jb250cm9sX3NpbmdsZXN0
ZXA7Cit9CmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oIGIvaW5jbHVkZS91
YXBpL2xpbnV4L2t2bWkuaAppbmRleCBiYjYyNjVlNDUzOWEuLmI1OTQ0NjM3OTVjNiAxMDA2NDQK
LS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaAorKysgYi9pbmNsdWRlL3VhcGkvbGludXgv
a3ZtaS5oCkBAIC0xMDIsNiArMTAyLDcgQEAgc3RydWN0IGt2bWlfZXJyb3JfY29kZSB7CiBzdHJ1
Y3Qga3ZtaV9nZXRfdmVyc2lvbl9yZXBseSB7CiAJX191MzIgdmVyc2lvbjsKIAlfX3UzMiBtYXhf
bXNnX3NpemU7CisJc3RydWN0IGt2bWlfZmVhdHVyZXMgZmVhdHVyZXM7CiB9OwogCiBzdHJ1Y3Qg
a3ZtaV92bV9jaGVja19jb21tYW5kIHsKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0v
eDg2XzY0L2t2bWlfdGVzdC5jCmluZGV4IDljZjA5OWIzOGJkZi4uZjc3MzVlM2VhOWU4IDEwMDY0
NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jCisr
KyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMKQEAgLTU5
LDYgKzU5LDggQEAgc3RydWN0IHZjcHVfd29ya2VyX2RhdGEgewogCWJvb2wgcmVzdGFydF9vbl9z
aHV0ZG93bjsKIH07CiAKK3N0YXRpYyBzdHJ1Y3Qga3ZtaV9mZWF0dXJlcyBmZWF0dXJlczsKKwog
dHlwZWRlZiB2b2lkICgqZmN0X3BmX2V2ZW50KShzdHJ1Y3Qga3ZtX3ZtICp2bSwgc3RydWN0IGt2
bWlfbXNnX2hkciAqaGRyLAogCQkJCXN0cnVjdCBwZl9ldiAqZXYsCiAJCQkJc3RydWN0IHZjcHVf
cmVwbHkgKnJwbCk7CkBAIC00NDMsNiArNDQ1LDEwIEBAIHN0YXRpYyB2b2lkIHRlc3RfY21kX2dl
dF92ZXJzaW9uKHZvaWQpCiAKIAlwcl9kZWJ1ZygiS1ZNSSB2ZXJzaW9uOiAldVxuIiwgcnBsLnZl
cnNpb24pOwogCXByX2RlYnVnKCJNYXggbWVzc2FnZSBzaXplOiAldVxuIiwgcnBsLm1heF9tc2df
c2l6ZSk7CisKKwlmZWF0dXJlcyA9IHJwbC5mZWF0dXJlczsKKworCXByX2RlYnVnKCJzaW5nbGVz
dGVwIHN1cHBvcnQ6ICV1XG4iLCBmZWF0dXJlcy5zaW5nbGVzdGVwKTsKIH0KIAogc3RhdGljIHZv
aWQgY21kX3ZtX2NoZWNrX2NvbW1hbmQoX191MTYgaWQsIGludCBleHBlY3RlZF9lcnIpCmRpZmYg
LS1naXQgYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmggYi92aXJ0L2t2bS9pbnRy
b3NwZWN0aW9uL2t2bWlfaW50LmgKaW5kZXggYmY2NTQ1ZTY2NDI1Li5hNTFlN2U0ZWQ1MTEgMTAw
NjQ0Ci0tLSBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaAorKysgYi92aXJ0L2t2
bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmgKQEAgLTEyMSw1ICsxMjEsNiBAQCB2b2lkIGt2bWlf
YXJjaF91cGRhdGVfcGFnZV90cmFja2luZyhzdHJ1Y3Qga3ZtICprdm0sCiAJCQkJICAgIHN0cnVj
dCBrdm1pX21lbV9hY2Nlc3MgKm0pOwogdm9pZCBrdm1pX2FyY2hfaG9vayhzdHJ1Y3Qga3ZtICpr
dm0pOwogdm9pZCBrdm1pX2FyY2hfdW5ob29rKHN0cnVjdCBrdm0gKmt2bSk7Cit2b2lkIGt2bWlf
YXJjaF9mZWF0dXJlcyhzdHJ1Y3Qga3ZtaV9mZWF0dXJlcyAqZmVhdCk7CiAKICNlbmRpZgpkaWZm
IC0tZ2l0IGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX21zZy5jIGIvdmlydC9rdm0vaW50
cm9zcGVjdGlvbi9rdm1pX21zZy5jCmluZGV4IDc0NWQxMDk4MWI2Zi4uZTJhZWY3NmJmZDE2IDEw
MDY0NAotLS0gYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfbXNnLmMKKysrIGIvdmlydC9r
dm0vaW50cm9zcGVjdGlvbi9rdm1pX21zZy5jCkBAIC0xMzQsNiArMTM0LDggQEAgc3RhdGljIGlu
dCBoYW5kbGVfZ2V0X3ZlcnNpb24oc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pLAogCXJw
bC52ZXJzaW9uID0ga3ZtaV92ZXJzaW9uKCk7CiAJcnBsLm1heF9tc2dfc2l6ZSA9IEtWTUlfTUFY
X01TR19TSVpFOwogCisJa3ZtaV9hcmNoX2ZlYXR1cmVzKCZycGwuZmVhdHVyZXMpOworCiAJcmV0
dXJuIGt2bWlfbXNnX3ZtX3JlcGx5KGt2bWksIG1zZywgMCwgJnJwbCwgc2l6ZW9mKHJwbCkpOwog
fQogCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1
YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by92aXJ0dWFsaXphdGlvbg==
