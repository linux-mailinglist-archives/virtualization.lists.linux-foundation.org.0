Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FA7228B2C
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:26:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 57E45882B3;
	Tue, 21 Jul 2020 21:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d3Cuphx03M1H; Tue, 21 Jul 2020 21:26:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DD1C1882ED;
	Tue, 21 Jul 2020 21:26:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFB42C016F;
	Tue, 21 Jul 2020 21:26:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86143C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5C49187A56
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1O-6qPZFS0SF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 03C428835C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:57 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 14180307C93D; Wed, 22 Jul 2020 00:09:19 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id EB1D5303EF1F;
 Wed, 22 Jul 2020 00:09:18 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 01/84] signal: export kill_pid_info()
Date: Wed, 22 Jul 2020 00:07:59 +0300
Message-Id: <20200721210922.7646-2-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
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
cyBmdW5jdGlvbiBpcyB1c2VkIGJ5IFZNIGludHJvc3BlY3Rpb24gY29kZSB0byB1bmdyYWNlZnVs
bHkgc2h1dGRvd24KYSBndWVzdCBhdCB0aGUgcmVxdWVzdCBvZiB0aGUgaW50cm9zcGVjdGlvbiB0
b29sLgoKQSBzZWN1cml0eSBhcHBsaWNhdGlvbiB3aWxsIHVzZSB0aGlzIGFzIHRoZSBsYXN0IHJl
c29ydCB0byBzdG9wIHRoZQpzcHJlYWQgb2YgYSBtYWx3YXJlIGZyb20gYSBndWVzdC4KClNpZ25l
ZC1vZmYtYnk6IE1hdGhpZXUgVGFycmFsIDxtYXRoaWV1LnRhcnJhbEBwcm90b25tYWlsLmNvbT4K
U2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgot
LS0KIGtlcm5lbC9zaWduYWwuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
CgpkaWZmIC0tZ2l0IGEva2VybmVsL3NpZ25hbC5jIGIva2VybmVsL3NpZ25hbC5jCmluZGV4IDVj
YTQ4Y2M1ZGE3Ni4uYzNhZjgxZDdiNjJhIDEwMDY0NAotLS0gYS9rZXJuZWwvc2lnbmFsLmMKKysr
IGIva2VybmVsL3NpZ25hbC5jCkBAIC0xNDU2LDYgKzE0NTYsNyBAQCBpbnQga2lsbF9waWRfaW5m
byhpbnQgc2lnLCBzdHJ1Y3Qga2VybmVsX3NpZ2luZm8gKmluZm8sIHN0cnVjdCBwaWQgKnBpZCkK
IAkJICovCiAJfQogfQorRVhQT1JUX1NZTUJPTChraWxsX3BpZF9pbmZvKTsKIAogc3RhdGljIGlu
dCBraWxsX3Byb2NfaW5mbyhpbnQgc2lnLCBzdHJ1Y3Qga2VybmVsX3NpZ2luZm8gKmluZm8sIHBp
ZF90IHBpZCkKIHsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
