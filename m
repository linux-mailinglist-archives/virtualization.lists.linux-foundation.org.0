Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E5219787A
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:13:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 47266869F4;
	Mon, 30 Mar 2020 10:13:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ovr-tR16TKrC; Mon, 30 Mar 2020 10:12:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1E82086A00;
	Mon, 30 Mar 2020 10:12:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B96DC07FF;
	Mon, 30 Mar 2020 10:12:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA514C07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B73D223077
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mxhuh79R4cjW
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id 55B2D22D10
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:50 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 9A04E30747BF; Mon, 30 Mar 2020 13:12:48 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 5D53F305B7A1;
 Mon, 30 Mar 2020 13:12:48 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 02/81] export kill_pid_info()
Date: Mon, 30 Mar 2020 13:11:49 +0300
Message-Id: <20200330101308.21702-3-alazar@bitdefender.com>
In-Reply-To: <20200330101308.21702-1-alazar@bitdefender.com>
References: <20200330101308.21702-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>,
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
YWwuYwppbmRleCA5YWQ4ZGVhOTNkYmIuLmFlNjJkMTE1NWJhOCAxMDA2NDQKLS0tIGEva2VybmVs
L3NpZ25hbC5jCisrKyBiL2tlcm5lbC9zaWduYWwuYwpAQCAtMTQ1MSw2ICsxNDUxLDcgQEAgaW50
IGtpbGxfcGlkX2luZm8oaW50IHNpZywgc3RydWN0IGtlcm5lbF9zaWdpbmZvICppbmZvLCBzdHJ1
Y3QgcGlkICpwaWQpCiAJCSAqLwogCX0KIH0KK0VYUE9SVF9TWU1CT0woa2lsbF9waWRfaW5mbyk7
CiAKIHN0YXRpYyBpbnQga2lsbF9wcm9jX2luZm8oaW50IHNpZywgc3RydWN0IGtlcm5lbF9zaWdp
bmZvICppbmZvLCBwaWRfdCBwaWQpCiB7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
