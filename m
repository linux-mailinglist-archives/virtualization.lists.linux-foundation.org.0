Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D9642453D
	for <lists.virtualization@lfdr.de>; Wed,  6 Oct 2021 19:50:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6523960629;
	Wed,  6 Oct 2021 17:50:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RVWGBavOAzna; Wed,  6 Oct 2021 17:50:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E8F6060EFA;
	Wed,  6 Oct 2021 17:50:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0643C002F;
	Wed,  6 Oct 2021 17:50:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3111CC0011
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 008A940637
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:50:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fs7etbNJOSv0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:50:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CBC9405E9
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:50:42 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 D15CF305D341; Wed,  6 Oct 2021 20:31:13 +0300 (EEST)
Received: from localhost (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id B8925300F712;
 Wed,  6 Oct 2021 20:31:13 +0300 (EEST)
X-Is-Junk-Enabled: fGZTSsP0qEJE2AIKtlSuFiRRwg9xyHmJ
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v12 48/77] KVM: introspection: add the crash action handling
 on the event reply
Date: Wed,  6 Oct 2021 20:30:44 +0300
Message-Id: <20211006173113.26445-49-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBhY3Rpb24g
aXMgdXNlZCBpbiBleHRyZW1lIGNhc2VzIHN1Y2ggYXMgYmxvY2tpbmcgdGhlIHNwcmVhZCBvZgpt
YWx3YXJlIGFzIGZhc3QgYXMgcG9zc2libGUuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaSBEb27Im3Ug
PG1kb250dUBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8
YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiB2aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWku
YyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5jIGIvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9r
dm1pLmMKaW5kZXggMzljNDNiOGExMjdkLi45M2ZiMjBjNDNiOWMgMTAwNjQ0Ci0tLSBhL3ZpcnQv
a3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5jCisrKyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3Zt
aS5jCkBAIC03NTIsNiArNzUyLDEwIEBAIHZvaWQga3ZtaV9oYW5kbGVfY29tbW9uX2V2ZW50X2Fj
dGlvbnMoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1MzIgYWN0aW9uKQogCXN0cnVjdCBrdm0gKmt2
bSA9IHZjcHUtPmt2bTsKIAogCXN3aXRjaCAoYWN0aW9uKSB7CisJY2FzZSBLVk1JX0VWRU5UX0FD
VElPTl9DUkFTSDoKKwkJdmNwdS0+cnVuLT5leGl0X3JlYXNvbiA9IEtWTV9FWElUX1NIVVRET1dO
OworCQlicmVhazsKKwogCWRlZmF1bHQ6CiAJCWt2bWlfaGFuZGxlX3Vuc3VwcG9ydGVkX2V2ZW50
X2FjdGlvbihrdm0pOwogCX0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
