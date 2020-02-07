Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A096155E3D
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:36:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0646086987;
	Fri,  7 Feb 2020 18:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dE1XeRzmlVm6; Fri,  7 Feb 2020 18:36:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 683C186A15;
	Fri,  7 Feb 2020 18:36:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60378C1D89;
	Fri,  7 Feb 2020 18:36:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F2A5C1D87
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id ECF2E226FC
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zYv8BIRjYdYK
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id 3C59A20358
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 BE60B305D48E; Fri,  7 Feb 2020 20:16:38 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id A8BF53052069;
 Fri,  7 Feb 2020 20:16:38 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 06/78] KVM: doc: fix the hypercall numbering
Date: Fri,  7 Feb 2020 20:15:24 +0200
Message-Id: <20200207181636.1065-7-alazar@bitdefender.com>
In-Reply-To: <20200207181636.1065-1-alazar@bitdefender.com>
References: <20200207181636.1065-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
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

U2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgot
LS0KIERvY3VtZW50YXRpb24vdmlydC9rdm0vaHlwZXJjYWxscy50eHQgfCA0ICsrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9oeXBlcmNhbGxzLnR4dCBiL0RvY3VtZW50YXRpb24vdmly
dC9rdm0vaHlwZXJjYWxscy50eHQKaW5kZXggNWY2ZDI5MWJkMDA0Li5hZmYyNzJiZWRlMDggMTAw
NjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0vaHlwZXJjYWxscy50eHQKKysrIGIvRG9j
dW1lbnRhdGlvbi92aXJ0L2t2bS9oeXBlcmNhbGxzLnR4dApAQCAtMTIyLDcgKzEyMiw3IEBAIGNv
bXB1dGUgdGhlIENMT0NLX1JFQUxUSU1FIGZvciBpdHMgY2xvY2ssIGF0IHRoZSBzYW1lIGluc3Rh
bnQuCiBSZXR1cm5zIEtWTV9FT1BOT1RTVVBQIGlmIHRoZSBob3N0IGRvZXMgbm90IHVzZSBUU0Mg
Y2xvY2tzb3VyY2UsCiBvciBpZiBjbG9jayB0eXBlIGlzIGRpZmZlcmVudCB0aGFuIEtWTV9DTE9D
S19QQUlSSU5HX1dBTExDTE9DSy4KIAotNi4gS1ZNX0hDX1NFTkRfSVBJCis3LiBLVk1fSENfU0VO
RF9JUEkKIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogQXJjaGl0ZWN0dXJlOiB4ODYKIFN0YXR1
czogYWN0aXZlCkBAIC0xNDIsNyArMTQyLDcgQEAgY29ycmVzcG9uZHMgdG8gdGhlIEFQSUMgSUQg
YTIrMSwgYW5kIHNvIG9uLgogCiBSZXR1cm5zIHRoZSBudW1iZXIgb2YgQ1BVcyB0byB3aGljaCB0
aGUgSVBJcyB3ZXJlIGRlbGl2ZXJlZCBzdWNjZXNzZnVsbHkuCiAKLTcuIEtWTV9IQ19TQ0hFRF9Z
SUVMRAorOC4gS1ZNX0hDX1NDSEVEX1lJRUxECiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIEFy
Y2hpdGVjdHVyZTogeDg2CiBTdGF0dXM6IGFjdGl2ZQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
