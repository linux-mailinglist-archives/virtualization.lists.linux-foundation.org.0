Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 181E7155E10
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:26:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D1E3186A01;
	Fri,  7 Feb 2020 18:26:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kTPCHXrxS284; Fri,  7 Feb 2020 18:26:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1BE5D86ACC;
	Fri,  7 Feb 2020 18:26:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 149B1C1D81;
	Fri,  7 Feb 2020 18:26:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42E9CC1D87
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2E09786EA7
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:26:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3MYjfbfjO1dK
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D83FA86E2A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 84183305CA1D; Fri,  7 Feb 2020 20:16:38 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 69D013032046;
 Fri,  7 Feb 2020 20:16:38 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 01/78] sched/swait: add swait_event_killable_exclusive()
Date: Fri,  7 Feb 2020 20:15:19 +0200
Message-Id: <20200207181636.1065-2-alazar@bitdefender.com>
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
