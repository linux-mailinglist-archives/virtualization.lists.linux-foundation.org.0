Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE372C3C4B
	for <lists.virtualization@lfdr.de>; Wed, 25 Nov 2020 10:42:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 37440869FD;
	Wed, 25 Nov 2020 09:42:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kUf5n1X0NcjY; Wed, 25 Nov 2020 09:42:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 306EC86A00;
	Wed, 25 Nov 2020 09:41:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EBC79C1DA0;
	Wed, 25 Nov 2020 09:41:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0094AC1DA5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D9FDA86D6D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RjByOEi-b7q2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C413686D65
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:53 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 5F8FC30462CD; Wed, 25 Nov 2020 11:35:43 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 43FF93072785;
 Wed, 25 Nov 2020 11:35:43 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v10 01/81] KVM: UAPI: add error codes used by the VM
 introspection code
Date: Wed, 25 Nov 2020 11:34:40 +0200
Message-Id: <20201125093600.2766-2-alazar@bitdefender.com>
In-Reply-To: <20201125093600.2766-1-alazar@bitdefender.com>
References: <20201125093600.2766-1-alazar@bitdefender.com>
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
