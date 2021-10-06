Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C3E42448C
	for <lists.virtualization@lfdr.de>; Wed,  6 Oct 2021 19:40:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39B3760EF3;
	Wed,  6 Oct 2021 17:40:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ywwWWVOTLbZn; Wed,  6 Oct 2021 17:40:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 06F8F60EE6;
	Wed,  6 Oct 2021 17:40:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 748D3C0022;
	Wed,  6 Oct 2021 17:40:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1390C000D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9123A407DC
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:40:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id coxfIMHUdNLT
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:40:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85D52407D0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:40:40 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 EFBD7307CAE0; Wed,  6 Oct 2021 20:30:56 +0300 (EEST)
Received: from localhost (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id D67773064495;
 Wed,  6 Oct 2021 20:30:56 +0300 (EEST)
X-Is-Junk-Enabled: fGZTSsP0qEJE2AIKtlSuFiRRwg9xyHmJ
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v12 10/77] KVM: svm: add support for descriptor-table VM-exits
Date: Wed,  6 Oct 2021 20:30:06 +0300
Message-Id: <20211006173113.26445-11-alazar@bitdefender.com>
In-Reply-To: <20211006173113.26445-1-alazar@bitdefender.com>
References: <20211006173113.26445-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wanpeng Li <wanpengli@tencent.com>,
 =?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <nicu.citu@icloud.com>,
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuaWN1LmNpdHVAaWNsb3VkLmNvbT4KClRoaXMgZnVuY3Rp
b24gaXMgbmVlZGVkIGZvciB0aGUgS1ZNSV9WQ1BVX0VWRU5UX0RFU0NSSVBUT1IgZXZlbnQuCgpT
aWduZWQtb2ZmLWJ5OiBOaWN1yJlvciBDw67Im3UgPG5pY3UuY2l0dUBpY2xvdWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQog
YXJjaC94ODYva3ZtL3N2bS9zdm0uYyB8IDEzICsrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAxMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3N2bS9zdm0uYyBi
L2FyY2gveDg2L2t2bS9zdm0vc3ZtLmMKaW5kZXggY2U0NWZlMGQzNWJjLi5lNWNkODgxM2NjYTYg
MTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmMKKysrIGIvYXJjaC94ODYva3ZtL3N2
bS9zdm0uYwpAQCAtMjUyNSw2ICsyNTI1LDExIEBAIHN0YXRpYyBpbnQgZW11bGF0ZV9vbl9pbnRl
cmNlcHRpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCXJldHVybiBrdm1fZW11bGF0ZV9pbnN0
cnVjdGlvbih2Y3B1LCAwKTsKIH0KIAorc3RhdGljIGludCBkZXNjcmlwdG9yX2FjY2Vzc19pbnRl
cmNlcHRpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCXJldHVybiBrdm1fZW11bGF0ZV9p
bnN0cnVjdGlvbih2Y3B1LCAwKTsKK30KKwogc3RhdGljIGludCByc21faW50ZXJjZXB0aW9uKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSkKIHsKIAlyZXR1cm4ga3ZtX2VtdWxhdGVfaW5zdHJ1Y3Rpb25f
ZnJvbV9idWZmZXIodmNwdSwgcnNtX2luc19ieXRlcywgMik7CkBAIC0zMjMxLDYgKzMyMzYsMTQg
QEAgc3RhdGljIGludCAoKmNvbnN0IHN2bV9leGl0X2hhbmRsZXJzW10pKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSkgPSB7CiAJW1NWTV9FWElUX0FWSUNfSU5DT01QTEVURV9JUEldCQk9IGF2aWNfaW5j
b21wbGV0ZV9pcGlfaW50ZXJjZXB0aW9uLAogCVtTVk1fRVhJVF9BVklDX1VOQUNDRUxFUkFURURf
QUNDRVNTXQk9IGF2aWNfdW5hY2NlbGVyYXRlZF9hY2Nlc3NfaW50ZXJjZXB0aW9uLAogCVtTVk1f
RVhJVF9WTUdFWElUXQkJCT0gc2V2X2hhbmRsZV92bWdleGl0LAorCVtTVk1fRVhJVF9JRFRSX1JF
QURdCQkJPSBkZXNjcmlwdG9yX2FjY2Vzc19pbnRlcmNlcHRpb24sCisJW1NWTV9FWElUX0dEVFJf
UkVBRF0JCQk9IGRlc2NyaXB0b3JfYWNjZXNzX2ludGVyY2VwdGlvbiwKKwlbU1ZNX0VYSVRfTERU
Ul9SRUFEXQkJCT0gZGVzY3JpcHRvcl9hY2Nlc3NfaW50ZXJjZXB0aW9uLAorCVtTVk1fRVhJVF9U
Ul9SRUFEXQkJCT0gZGVzY3JpcHRvcl9hY2Nlc3NfaW50ZXJjZXB0aW9uLAorCVtTVk1fRVhJVF9J
RFRSX1dSSVRFXQkJCT0gZGVzY3JpcHRvcl9hY2Nlc3NfaW50ZXJjZXB0aW9uLAorCVtTVk1fRVhJ
VF9HRFRSX1dSSVRFXQkJCT0gZGVzY3JpcHRvcl9hY2Nlc3NfaW50ZXJjZXB0aW9uLAorCVtTVk1f
RVhJVF9MRFRSX1dSSVRFXQkJCT0gZGVzY3JpcHRvcl9hY2Nlc3NfaW50ZXJjZXB0aW9uLAorCVtT
Vk1fRVhJVF9UUl9XUklURV0JCQk9IGRlc2NyaXB0b3JfYWNjZXNzX2ludGVyY2VwdGlvbiwKIH07
CiAKIHN0YXRpYyB2b2lkIGR1bXBfdm1jYihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
