Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 465CD155E2F
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:36:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EDD0C2263C;
	Fri,  7 Feb 2020 18:36:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g4TABoYUOtjT; Fri,  7 Feb 2020 18:36:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9FD6C2266C;
	Fri,  7 Feb 2020 18:35:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F276C1D88;
	Fri,  7 Feb 2020 18:35:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83678C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7EA72862DE
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n5CT8CGsRzEX
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0A91B865CF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 A7241305CA1E; Fri,  7 Feb 2020 20:16:38 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 6EDF63086D0A;
 Fri,  7 Feb 2020 20:16:38 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 02/78] export kill_pid_info()
Date: Fri,  7 Feb 2020 20:15:20 +0200
Message-Id: <20200207181636.1065-3-alazar@bitdefender.com>
In-Reply-To: <20200207181636.1065-1-alazar@bitdefender.com>
References: <20200207181636.1065-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>,
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

RnJvbTogTWF0aGlldSBUYXJyYWwgPG1hdGhpZXUudGFycmFsQHByb3Rvbm1haWwuY29tPgoKVGhp
cyBmdW5jdGlvbiBpcyB1c2VkIGJ5IEtWTUkgKEtWTSBpbnRyb3NwZWN0aW9uIHN1Yi1zeXN0ZW0p
IHRvCnVuZ3JhY2VmdWxseSBzaHV0ZG93biB0aGUgZ3Vlc3Qgd2hlbiBhbiBpbnRyb3NwZWN0aW9u
IHRvb2wgcmVxdWVzdHMgaXQuCgpBIHNlY3VyaXR5IGFwcGxpY2F0aW9uIHdpbGwgdXNlIGl0IGFz
IGEgbGFzdCByZXNvcnQgaW4gc3RvcHBpbmcgdGhlCnNwcmVhZCBvZiBhIG1hbHdhcmUgZnJvbSBh
IGd1ZXN0CgpTaWduZWQtb2ZmLWJ5OiBNYXRoaWV1IFRhcnJhbCA8bWF0aGlldS50YXJyYWxAcHJv
dG9ubWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRl
ZmVuZGVyLmNvbT4KLS0tCiBrZXJuZWwvc2lnbmFsLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2tlcm5lbC9zaWduYWwuYyBiL2tlcm5lbC9zaWdu
YWwuYwppbmRleCBiY2Q0NmY1NDdkYjMuLjQ2MTg4MTM0Mzk5MSAxMDA2NDQKLS0tIGEva2VybmVs
L3NpZ25hbC5jCisrKyBiL2tlcm5lbC9zaWduYWwuYwpAQCAtMTQ1MSw2ICsxNDUxLDcgQEAgaW50
IGtpbGxfcGlkX2luZm8oaW50IHNpZywgc3RydWN0IGtlcm5lbF9zaWdpbmZvICppbmZvLCBzdHJ1
Y3QgcGlkICpwaWQpCiAJCSAqLwogCX0KIH0KK0VYUE9SVF9TWU1CT0woa2lsbF9waWRfaW5mbyk7
CiAKIHN0YXRpYyBpbnQga2lsbF9wcm9jX2luZm8oaW50IHNpZywgc3RydWN0IGtlcm5lbF9zaWdp
bmZvICppbmZvLCBwaWRfdCBwaWQpCiB7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
