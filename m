Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C98BBD6D9
	for <lists.virtualization@lfdr.de>; Wed, 25 Sep 2019 05:49:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CB8EFBB3;
	Wed, 25 Sep 2019 03:49:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id ED2E5B1F
	for <virtualization@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 03:49:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8519E102
	for <virtualization@lists.linux-foundation.org>;
	Wed, 25 Sep 2019 03:49:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C3E718C891A;
	Wed, 25 Sep 2019 03:49:25 +0000 (UTC)
Received: from [10.72.12.148] (ovpn-12-148.pek2.redhat.com [10.72.12.148])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 559C2600C8;
	Wed, 25 Sep 2019 03:49:19 +0000 (UTC)
Subject: Re: [PATCH] virtio_mmio: remove redundant dev_err message
To: Ding Xiang <dingxiang@cmss.chinamobile.com>, mst@redhat.com
References: <1569309666-1437-1-git-send-email-dingxiang@cmss.chinamobile.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ccce7b48-d8a8-bbf8-7192-cefa77f51993@redhat.com>
Date: Wed, 25 Sep 2019 11:49:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569309666-1437-1-git-send-email-dingxiang@cmss.chinamobile.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.70]);
	Wed, 25 Sep 2019 03:49:29 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvOS8yNCDkuIvljYgzOjIxLCBEaW5nIFhpYW5nIHdyb3RlOgo+IHBsYXRmb3JtX2dl
dF9pcnEgYWxyZWFkeSBjb250YWlucyBlcnJvciBtZXNzYWdlLAoKCklzIHRoaXMgbWVzc2FnZSBj
b250YWluZWQgaW4gYWxsIHBvc3NpYmxlIGVycm9yIHBhdGg/IElmIG5vdCwgaXQncyAKcHJvYmFi
bHkgYmV0dGVyIHRvIGtlZXAgaXQgYXMgaXMuCgpUaGFua3MKCgo+IHNvIHJlbW92ZQo+IHRoZSBy
ZWR1bmRhbnQgZGV2X2VyciBtZXNzYWdlCj4KPiBTaWduZWQtb2ZmLWJ5OiBEaW5nIFhpYW5nIDxk
aW5neGlhbmdAY21zcy5jaGluYW1vYmlsZS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL3ZpcnRpby92
aXJ0aW9fbW1pby5jIHwgNCArLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX21t
aW8uYyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19tbWlvLmMKPiBpbmRleCBlMDllZGI1Li5jNGI5
ZjI1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19tbWlvLmMKPiArKysgYi9k
cml2ZXJzL3ZpcnRpby92aXJ0aW9fbW1pby5jCj4gQEAgLTQ2NiwxMCArNDY2LDggQEAgc3RhdGlj
IGludCB2bV9maW5kX3ZxcyhzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldiwgdW5zaWduZWQgbnZx
cywKPiAgIAlpbnQgaXJxID0gcGxhdGZvcm1fZ2V0X2lycSh2bV9kZXYtPnBkZXYsIDApOwo+ICAg
CWludCBpLCBlcnIsIHF1ZXVlX2lkeCA9IDA7Cj4gICAKPiAtCWlmIChpcnEgPCAwKSB7Cj4gLQkJ
ZGV2X2VycigmdmRldi0+ZGV2LCAiQ2Fubm90IGdldCBJUlEgcmVzb3VyY2VcbiIpOwo+ICsJaWYg
KGlycSA8IDApCj4gICAJCXJldHVybiBpcnE7Cj4gLQl9Cj4gICAKPiAgIAllcnIgPSByZXF1ZXN0
X2lycShpcnEsIHZtX2ludGVycnVwdCwgSVJRRl9TSEFSRUQsCj4gICAJCQlkZXZfbmFtZSgmdmRl
di0+ZGV2KSwgdm1fZGV2KTsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
