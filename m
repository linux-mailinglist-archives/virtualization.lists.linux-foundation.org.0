Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 127C91A45FD
	for <lists.virtualization@lfdr.de>; Fri, 10 Apr 2020 13:54:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9845688117;
	Fri, 10 Apr 2020 11:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bs72t1F9-dgS; Fri, 10 Apr 2020 11:54:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 781CC8812B;
	Fri, 10 Apr 2020 11:54:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4AF19C0177;
	Fri, 10 Apr 2020 11:54:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37AC1C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 11:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 220A187C66
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 11:54:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 33aIORkSL6RF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 11:54:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1D5F687AA1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Apr 2020 11:54:39 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id DC627B95CBFA99C9DA08;
 Fri, 10 Apr 2020 19:54:36 +0800 (CST)
Received: from localhost (10.173.223.234) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Fri, 10 Apr 2020
 19:54:29 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <mst@redhat.com>, <jasowang@redhat.com>, <yuehaibing@huawei.com>
Subject: [PATCH -next] vdpasim: remove unused variable 'ret'
Date: Fri, 10 Apr 2020 19:54:22 +0800
Message-ID: <20200410115422.42308-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.173.223.234]
X-CFilter-Loop: Reflected
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

ZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmM6OTI6Njogd2FybmluZzoKIHZhcmlhYmxl
IOKAmHJldOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoK
U2lnbmVkLW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgotLS0KIGRy
aXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5jIHwgMTUgKysrKysrKy0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5jIGIvZHJpdmVycy92ZHBhL3ZkcGFfc2lt
L3ZkcGFfc2ltLmMKaW5kZXggNzk1N2QyZDQxZmM0Li4wMWM0NTZmN2MxZjcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvdmRwYS92ZHBhX3NpbS92ZHBhX3NpbS5jCisrKyBiL2RyaXZlcnMvdmRwYS92ZHBh
X3NpbS92ZHBhX3NpbS5jCkBAIC04OSwxNSArODksMTQgQEAgc3RhdGljIHN0cnVjdCB2ZHBhc2lt
ICpkZXZfdG9fc2ltKHN0cnVjdCBkZXZpY2UgKmRldikKIHN0YXRpYyB2b2lkIHZkcGFzaW1fcXVl
dWVfcmVhZHkoc3RydWN0IHZkcGFzaW0gKnZkcGFzaW0sIHVuc2lnbmVkIGludCBpZHgpCiB7CiAJ
c3RydWN0IHZkcGFzaW1fdmlydHF1ZXVlICp2cSA9ICZ2ZHBhc2ltLT52cXNbaWR4XTsKLQlpbnQg
cmV0OwogCi0JcmV0ID0gdnJpbmdoX2luaXRfaW90bGIoJnZxLT52cmluZywgdmRwYXNpbV9mZWF0
dXJlcywKLQkJCQlWRFBBU0lNX1FVRVVFX01BWCwgZmFsc2UsCi0JCQkJKHN0cnVjdCB2cmluZ19k
ZXNjICopKHVpbnRwdHJfdCl2cS0+ZGVzY19hZGRyLAotCQkJCShzdHJ1Y3QgdnJpbmdfYXZhaWwg
KikKLQkJCQkodWludHB0cl90KXZxLT5kcml2ZXJfYWRkciwKLQkJCQkoc3RydWN0IHZyaW5nX3Vz
ZWQgKikKLQkJCQkodWludHB0cl90KXZxLT5kZXZpY2VfYWRkcik7CisJdnJpbmdoX2luaXRfaW90
bGIoJnZxLT52cmluZywgdmRwYXNpbV9mZWF0dXJlcywKKwkJCSAgVkRQQVNJTV9RVUVVRV9NQVgs
IGZhbHNlLAorCQkJICAoc3RydWN0IHZyaW5nX2Rlc2MgKikodWludHB0cl90KXZxLT5kZXNjX2Fk
ZHIsCisJCQkgIChzdHJ1Y3QgdnJpbmdfYXZhaWwgKikKKwkJCSAgKHVpbnRwdHJfdCl2cS0+ZHJp
dmVyX2FkZHIsCisJCQkgIChzdHJ1Y3QgdnJpbmdfdXNlZCAqKQorCQkJICAodWludHB0cl90KXZx
LT5kZXZpY2VfYWRkcik7CiB9CiAKIHN0YXRpYyB2b2lkIHZkcGFzaW1fdnFfcmVzZXQoc3RydWN0
IHZkcGFzaW1fdmlydHF1ZXVlICp2cSkKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApW
aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
