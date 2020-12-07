Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2472D1ABC
	for <lists.virtualization@lfdr.de>; Mon,  7 Dec 2020 21:46:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 77417879C1;
	Mon,  7 Dec 2020 20:46:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rvI3PRfOQr69; Mon,  7 Dec 2020 20:46:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3C1A58790A;
	Mon,  7 Dec 2020 20:46:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F6D0C013B;
	Mon,  7 Dec 2020 20:46:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4E8DC013B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9B6A98789C
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bSnYeWPiegRh
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B2B1187899
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:13 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 F1A1730462E0; Mon,  7 Dec 2020 22:46:11 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id D30C03072785;
 Mon,  7 Dec 2020 22:46:11 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v11 01/81] KVM: UAPI: add error codes used by the VM
 introspection code
Date: Mon,  7 Dec 2020 22:45:02 +0200
Message-Id: <20201207204622.15258-2-alazar@bitdefender.com>
In-Reply-To: <20201207204622.15258-1-alazar@bitdefender.com>
References: <20201207204622.15258-1-alazar@bitdefender.com>
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

VGhlc2UgbmV3IGVycm9yIGNvZGVzIGhlbHAgdGhlIGludHJvc3BlY3Rpb24gdG9vbCB0byBpZGVu
dGlmeSB0aGUgY2F1c2UKb2YgdGhlIGludHJvc3BlY3Rpb24gY29tbWFuZCBmYWlsdXJlIGFuZCB0
byByZWNvdmVyIGZyb20gc29tZSBlcnJvcgpjYXNlcyBvciB0byBnaXZlIG1vcmUgaW5mb3JtYXRp
b24gdG8gdGhlIHVzZXIuCgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBi
aXRkZWZlbmRlci5jb20+Ci0tLQogaW5jbHVkZS91YXBpL2xpbnV4L2t2bV9wYXJhLmggfCA0ICsr
KysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRl
L3VhcGkvbGludXgva3ZtX3BhcmEuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9rdm1fcGFyYS5oCmlu
ZGV4IDhiODY2MDk4NDliOS4uM2NlMzg4MjQ5NjgyIDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkv
bGludXgva3ZtX3BhcmEuaAorKysgYi9pbmNsdWRlL3VhcGkvbGludXgva3ZtX3BhcmEuaApAQCAt
MTcsNiArMTcsMTAgQEAKICNkZWZpbmUgS1ZNX0UyQklHCQlFMkJJRwogI2RlZmluZSBLVk1fRVBF
Uk0JCUVQRVJNCiAjZGVmaW5lIEtWTV9FT1BOT1RTVVBQCQk5NQorI2RlZmluZSBLVk1fRUFHQUlO
CQkxMQorI2RlZmluZSBLVk1fRU5PRU5UCQlFTk9FTlQKKyNkZWZpbmUgS1ZNX0VOT01FTQkJRU5P
TUVNCisjZGVmaW5lIEtWTV9FQlVTWQkJRUJVU1kKIAogI2RlZmluZSBLVk1fSENfVkFQSUNfUE9M
TF9JUlEJCTEKICNkZWZpbmUgS1ZNX0hDX01NVV9PUAkJCTIKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZp
cnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
