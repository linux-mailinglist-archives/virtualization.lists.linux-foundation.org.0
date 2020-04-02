Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBC119BA6E
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 04:46:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1B4C887E3F;
	Thu,  2 Apr 2020 02:46:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nLEtDw1Gqsk0; Thu,  2 Apr 2020 02:46:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8006587E46;
	Thu,  2 Apr 2020 02:46:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 660EDC089F;
	Thu,  2 Apr 2020 02:46:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C1F3C089F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 02:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0EA5920446
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 02:46:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ztg8cWIB2dfN
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 02:46:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by silver.osuosl.org (Postfix) with ESMTPS id E692F2042A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 02:46:49 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C9C1B6186E5F6EA8223A;
 Thu,  2 Apr 2020 10:46:44 +0800 (CST)
Received: from localhost (10.173.223.234) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Thu, 2 Apr 2020
 10:46:34 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <mst@redhat.com>, <jasowang@redhat.com>, <lingshan.zhu@intel.com>,
 <xiao.w.wang@intel.com>, <tiwei.bie@intel.com>, <yuehaibing@huawei.com>
Subject: [PATCH v2 -next] vdpa: remove unused variables 'ifcvf' and 'ifcvf_lm'
Date: Thu, 2 Apr 2020 10:46:26 +0800
Message-ID: <20200402024626.32944-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20200331080259.33056-1-yuehaibing@huawei.com>
References: <20200331080259.33056-1-yuehaibing@huawei.com>
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

ZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYzozNDoyNDoKIHdhcm5pbmc6IHZhcmlhYmxl
IOKAmGlmY3Zm4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVd
CmRyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9iYXNlLmM6MzA0OjMxOgogd2FybmluZzogdmFyaWFi
bGUg4oCYaWZjdmZfbG3igJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJp
YWJsZV0KClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVk
LW9mZi1ieTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgpBY2tlZC1ieTogSmFz
b24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KLS0tCnYyOiByZXdvcmsgYmFzZWQgb24gY29t
bWl0IGE0YmU0MGNiY2VkYiAoInZkcGE6IG1vdmUgdG8gZHJpdmVycy92ZHBhIikKLS0tCiBkcml2
ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfYmFzZS5jIHwgMiAtLQogZHJpdmVycy92ZHBhL2lmY3ZmL2lm
Y3ZmX21haW4uYyB8IDIgLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfYmFzZS5jIGIvZHJpdmVycy92ZHBhL2lm
Y3ZmL2lmY3ZmX2Jhc2UuYwppbmRleCBiNjFiMDZlYTI2ZDMuLmUyNDM3MWQ2NDRiNSAxMDA2NDQK
LS0tIGEvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2UuYworKysgYi9kcml2ZXJzL3ZkcGEv
aWZjdmYvaWZjdmZfYmFzZS5jCkBAIC0zMDEsMTIgKzMwMSwxMCBAQCBpbnQgaWZjdmZfc2V0X3Zx
X3N0YXRlKHN0cnVjdCBpZmN2Zl9odyAqaHcsIHUxNiBxaWQsIHU2NCBudW0pCiAKIHN0YXRpYyBp
bnQgaWZjdmZfaHdfZW5hYmxlKHN0cnVjdCBpZmN2Zl9odyAqaHcpCiB7Ci0Jc3RydWN0IGlmY3Zm
X2xtX2NmZyBfX2lvbWVtICppZmN2Zl9sbTsKIAlzdHJ1Y3QgdmlydGlvX3BjaV9jb21tb25fY2Zn
IF9faW9tZW0gKmNmZzsKIAlzdHJ1Y3QgaWZjdmZfYWRhcHRlciAqaWZjdmY7CiAJdTMyIGk7CiAK
LQlpZmN2Zl9sbSA9IChzdHJ1Y3QgaWZjdmZfbG1fY2ZnIF9faW9tZW0gKilody0+bG1fY2ZnOwog
CWlmY3ZmID0gdmZfdG9fYWRhcHRlcihodyk7CiAJY2ZnID0gaHctPmNvbW1vbl9jZmc7CiAJaWZj
X2lvd3JpdGUxNihJRkNWRl9NU0lfQ09ORklHX09GRiwgJmNmZy0+bXNpeF9jb25maWcpOwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYyBiL2RyaXZlcnMvdmRwYS9p
ZmN2Zi9pZmN2Zl9tYWluLmMKaW5kZXggOGQ1NGRjNWIwOGQyLi4yOGQ5ZTVkZTU2NzUgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMKKysrIGIvZHJpdmVycy92ZHBh
L2lmY3ZmL2lmY3ZmX21haW4uYwpAQCAtMzEsMTEgKzMxLDkgQEAgc3RhdGljIGlycXJldHVybl90
IGlmY3ZmX2ludHJfaGFuZGxlcihpbnQgaXJxLCB2b2lkICphcmcpCiBzdGF0aWMgaW50IGlmY3Zm
X3N0YXJ0X2RhdGFwYXRoKHZvaWQgKnByaXZhdGUpCiB7CiAJc3RydWN0IGlmY3ZmX2h3ICp2ZiA9
IGlmY3ZmX3ByaXZhdGVfdG9fdmYocHJpdmF0ZSk7Ci0Jc3RydWN0IGlmY3ZmX2FkYXB0ZXIgKmlm
Y3ZmOwogCXU4IHN0YXR1czsKIAlpbnQgcmV0OwogCi0JaWZjdmYgPSB2Zl90b19hZGFwdGVyKHZm
KTsKIAl2Zi0+bnJfdnJpbmcgPSBJRkNWRl9NQVhfUVVFVUVfUEFJUlMgKiAyOwogCXJldCA9IGlm
Y3ZmX3N0YXJ0X2h3KHZmKTsKIAlpZiAocmV0IDwgMCkgewotLSAKMi4xNy4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFp
bGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBz
Oi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0
aW9u
