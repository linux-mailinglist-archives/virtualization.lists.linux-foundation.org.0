Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 789F5197873
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:12:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3004A869AB;
	Mon, 30 Mar 2020 10:12:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1T5JNGfUQ42g; Mon, 30 Mar 2020 10:12:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 96D41869B9;
	Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69E08C07FF;
	Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC4DCC1D89
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DBB8087D57
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FEtUuORZXSBv
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9A16587B9B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:50 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 B78B930747C0; Mon, 30 Mar 2020 13:12:48 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 9B739305B7A0;
 Mon, 30 Mar 2020 13:12:48 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 03/81] KVM: add new error codes for VM introspection
Date: Mon, 30 Mar 2020 13:11:50 +0300
Message-Id: <20200330101308.21702-4-alazar@bitdefender.com>
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

VGhlc2UgbmV3IGVycm9yIGNvZGVzIGNhbiBnaXZlIHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wgbW9y
ZSBpbmZvcm1hdGlvbgphYm91dCB3aHkgYSBpbnRyb3NwZWN0aW9uIGNvbW1hbmQgZmFpbGVkLCBo
ZWxwaW5nIGl0IHRvIGhhbmRsZSBzb21lCmVycm9yIGNhc2VzLgoKU2lnbmVkLW9mZi1ieTogQWRh
bGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGluY2x1ZGUvdWFwaS9s
aW51eC9rdm1fcGFyYS5oIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L2t2bV9wYXJhLmggYi9pbmNsdWRlL3Vh
cGkvbGludXgva3ZtX3BhcmEuaAppbmRleCA4Yjg2NjA5ODQ5YjkuLjNjZTM4ODI0OTY4MiAxMDA2
NDQKLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L2t2bV9wYXJhLmgKKysrIGIvaW5jbHVkZS91YXBp
L2xpbnV4L2t2bV9wYXJhLmgKQEAgLTE3LDYgKzE3LDEwIEBACiAjZGVmaW5lIEtWTV9FMkJJRwkJ
RTJCSUcKICNkZWZpbmUgS1ZNX0VQRVJNCQlFUEVSTQogI2RlZmluZSBLVk1fRU9QTk9UU1VQUAkJ
OTUKKyNkZWZpbmUgS1ZNX0VBR0FJTgkJMTEKKyNkZWZpbmUgS1ZNX0VOT0VOVAkJRU5PRU5UCisj
ZGVmaW5lIEtWTV9FTk9NRU0JCUVOT01FTQorI2RlZmluZSBLVk1fRUJVU1kJCUVCVVNZCiAKICNk
ZWZpbmUgS1ZNX0hDX1ZBUElDX1BPTExfSVJRCQkxCiAjZGVmaW5lIEtWTV9IQ19NTVVfT1AJCQky
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxp
emF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92
aXJ0dWFsaXphdGlvbg==
