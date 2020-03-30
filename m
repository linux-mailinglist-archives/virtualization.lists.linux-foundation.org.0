Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B7919787E
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:13:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B90AF8795A;
	Mon, 30 Mar 2020 10:13:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UuySzBmJKaiW; Mon, 30 Mar 2020 10:12:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 71D06878C0;
	Mon, 30 Mar 2020 10:12:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5636DC07FF;
	Mon, 30 Mar 2020 10:12:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB3ADC1D85
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9716723077
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0MgdY2E2AMi1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id 59D6522F22
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:50 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 5C370306E4AD; Mon, 30 Mar 2020 13:12:48 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 3CE7C305B7A0;
 Mon, 30 Mar 2020 13:12:48 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 01/81] sched/swait: add swait_event_killable_exclusive()
Date: Mon, 30 Mar 2020 13:11:48 +0300
Message-Id: <20200330101308.21702-2-alazar@bitdefender.com>
In-Reply-To: <20200330101308.21702-1-alazar@bitdefender.com>
References: <20200330101308.21702-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtualization@lists.linux-foundation.org
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

V2hlbiBhIHZDUFUgaXMgaW50cm9zcGVjdGVkLCBpdCB3YWl0cyBmb3IgaW50cm9zcGVjdGlvbiBj
b21tYW5kcyBvciBldmVudApyZXBsaWVzLiBJZiB0aGUgaW50cm9zcGVjdGlvbiBjaGFubmVsIGlz
IGNsb3NlZCwgdGhlIHJlY2VpdmluZyB0aHJlYWQKd2lsbCB3YWtlLXVwIHRoZSB2Q1BVIHRocmVh
ZHMuIFdpdGggdGhpcyBmdW5jdGlvbiB0aGUgdkNQVSB0aHJlYWQgd2lsbAp3YWtlLXVwIG9uIFNJ
R0tJTEwgdG9vLgoKU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVm
ZW5kZXIuY29tPgotLS0KIGluY2x1ZGUvbGludXgvc3dhaXQuaCB8IDExICsrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvc3dhaXQuaCBiL2luY2x1ZGUvbGludXgvc3dhaXQuaAppbmRleCA3M2UwNmU5OTg2ZDQuLjlj
NTMzODMyMTlmNiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9zd2FpdC5oCisrKyBiL2luY2x1
ZGUvbGludXgvc3dhaXQuaApAQCAtMjk3LDQgKzI5NywxNSBAQCBkbyB7CQkJCQkJCQkJXAogCV9f
cmV0OwkJCQkJCQkJXAogfSkKIAorI2RlZmluZSBfX3N3YWl0X2V2ZW50X2tpbGxhYmxlKHdxLCBj
b25kaXRpb24pCQkJCVwKKwlfX19zd2FpdF9ldmVudCh3cSwgY29uZGl0aW9uLCBUQVNLX0tJTExB
QkxFLCAwLAlzY2hlZHVsZSgpKQorCisjZGVmaW5lIHN3YWl0X2V2ZW50X2tpbGxhYmxlX2V4Y2x1
c2l2ZSh3cSwgY29uZGl0aW9uKQkJCVwKKyh7CQkJCQkJCQkJXAorCWludCBfX3JldCA9IDA7CQkJ
CQkJCVwKKwlpZiAoIShjb25kaXRpb24pKQkJCQkJCVwKKwkJX19yZXQgPSBfX3N3YWl0X2V2ZW50
X2tpbGxhYmxlKHdxLCBjb25kaXRpb24pOwkJXAorCV9fcmV0OwkJCQkJCQkJXAorfSkKKwogI2Vu
ZGlmIC8qIF9MSU5VWF9TV0FJVF9IICovCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
