Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A3660198DE0
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 10:03:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2EBCC85BCD;
	Tue, 31 Mar 2020 08:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b1F6YdAHEQVr; Tue, 31 Mar 2020 08:03:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AEE0685F4D;
	Tue, 31 Mar 2020 08:03:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C656C07FF;
	Tue, 31 Mar 2020 08:03:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D515C07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 08:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 09CBC85F4D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 08:03:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NWL9_eKdtdEw
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 08:03:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E96DE85BCD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 08:03:24 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E9E1F529C35A03EC5865;
 Tue, 31 Mar 2020 16:03:16 +0800 (CST)
Received: from localhost (10.173.223.234) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Tue, 31 Mar 2020
 16:03:07 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <mst@redhat.com>, <jasowang@redhat.com>, <tiwei.bie@intel.com>,
 <lingshan.zhu@intel.com>, <yuehaibing@huawei.com>, <xiao.w.wang@intel.com>
Subject: [PATCH -next] virtio: vdpa: remove unused variables 'ifcvf' and
 'ifcvf_lm'
Date: Tue, 31 Mar 2020 16:02:59 +0800
Message-ID: <20200331080259.33056-1-yuehaibing@huawei.com>
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

ZHJpdmVycy92aXJ0aW8vdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmM6MzQ6MjQ6CiB3YXJuaW5nOiB2
YXJpYWJsZSDigJhpZmN2ZuKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZh
cmlhYmxlXQpkcml2ZXJzL3ZpcnRpby92ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2UuYzozMDQ6MzE6CiB3
YXJuaW5nOiB2YXJpYWJsZSDigJhpZmN2Zl9sbeKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNl
ZC1idXQtc2V0LXZhcmlhYmxlXQoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3
ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+
Ci0tLQogZHJpdmVycy92aXJ0aW8vdmRwYS9pZmN2Zi9pZmN2Zl9iYXNlLmMgfCAyIC0tCiBkcml2
ZXJzL3ZpcnRpby92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYyB8IDIgLS0KIDIgZmlsZXMgY2hhbmdl
ZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92ZHBhL2lmY3Zm
L2lmY3ZmX2Jhc2UuYyBiL2RyaXZlcnMvdmlydGlvL3ZkcGEvaWZjdmYvaWZjdmZfYmFzZS5jCmlu
ZGV4IGI2MWIwNmVhMjZkMy4uZTI0MzcxZDY0NGI1IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpcnRp
by92ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2UuYworKysgYi9kcml2ZXJzL3ZpcnRpby92ZHBhL2lmY3Zm
L2lmY3ZmX2Jhc2UuYwpAQCAtMzAxLDEyICszMDEsMTAgQEAgaW50IGlmY3ZmX3NldF92cV9zdGF0
ZShzdHJ1Y3QgaWZjdmZfaHcgKmh3LCB1MTYgcWlkLCB1NjQgbnVtKQogCiBzdGF0aWMgaW50IGlm
Y3ZmX2h3X2VuYWJsZShzdHJ1Y3QgaWZjdmZfaHcgKmh3KQogewotCXN0cnVjdCBpZmN2Zl9sbV9j
ZmcgX19pb21lbSAqaWZjdmZfbG07CiAJc3RydWN0IHZpcnRpb19wY2lfY29tbW9uX2NmZyBfX2lv
bWVtICpjZmc7CiAJc3RydWN0IGlmY3ZmX2FkYXB0ZXIgKmlmY3ZmOwogCXUzMiBpOwogCi0JaWZj
dmZfbG0gPSAoc3RydWN0IGlmY3ZmX2xtX2NmZyBfX2lvbWVtICopaHctPmxtX2NmZzsKIAlpZmN2
ZiA9IHZmX3RvX2FkYXB0ZXIoaHcpOwogCWNmZyA9IGh3LT5jb21tb25fY2ZnOwogCWlmY19pb3dy
aXRlMTYoSUZDVkZfTVNJX0NPTkZJR19PRkYsICZjZmctPm1zaXhfY29uZmlnKTsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdmlydGlvL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jIGIvZHJpdmVycy92aXJ0
aW8vdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMKaW5kZXggOGQ1NGRjNWIwOGQyLi4yOGQ5ZTVkZTU2
NzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlydGlvL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jCisr
KyBiL2RyaXZlcnMvdmlydGlvL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jCkBAIC0zMSwxMSArMzEs
OSBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgaWZjdmZfaW50cl9oYW5kbGVyKGludCBpcnEsIHZvaWQg
KmFyZykKIHN0YXRpYyBpbnQgaWZjdmZfc3RhcnRfZGF0YXBhdGgodm9pZCAqcHJpdmF0ZSkKIHsK
IAlzdHJ1Y3QgaWZjdmZfaHcgKnZmID0gaWZjdmZfcHJpdmF0ZV90b192Zihwcml2YXRlKTsKLQlz
dHJ1Y3QgaWZjdmZfYWRhcHRlciAqaWZjdmY7CiAJdTggc3RhdHVzOwogCWludCByZXQ7CiAKLQlp
ZmN2ZiA9IHZmX3RvX2FkYXB0ZXIodmYpOwogCXZmLT5ucl92cmluZyA9IElGQ1ZGX01BWF9RVUVV
RV9QQUlSUyAqIDI7CiAJcmV0ID0gaWZjdmZfc3RhcnRfaHcodmYpOwogCWlmIChyZXQgPCAwKSB7
Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
