Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AD2193822
	for <lists.virtualization@lfdr.de>; Thu, 26 Mar 2020 06:51:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9EE6D86FEE;
	Thu, 26 Mar 2020 05:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id npxqLPecNwQI; Thu, 26 Mar 2020 05:51:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AA4A586FFF;
	Thu, 26 Mar 2020 05:51:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8402BC0177;
	Thu, 26 Mar 2020 05:51:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14992C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 05:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0C31086FEE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 05:51:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DAF9MHGFjvK7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 05:51:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BA1A5860CD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Mar 2020 05:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585201879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jMJJQtTusqzXruy5fUBgUSvmMkI27a/obMAYeFbHg3s=;
 b=N5Qgg5pmIfG4kFUqTQff+VVK8uThu42XSxWqIfGnv3ngalln0WnFxsxUhbrcKaqvb2q4u6
 sfdXMkD2ozhwk6dzaQrCfhRxueaj0eNR/UCGMPfYZbjUaMVLhYMBytJuUP1ak+oEzn0o0u
 8SEWZTNO+bAL9ktssRo8iCV0b3VCRH0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-ox8Usa4NObSsCMFORatLyA-1; Thu, 26 Mar 2020 01:51:15 -0400
X-MC-Unique: ox8Usa4NObSsCMFORatLyA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B386107ACC4;
 Thu, 26 Mar 2020 05:51:13 +0000 (UTC)
Received: from [10.72.13.193] (ovpn-13-193.pek2.redhat.com [10.72.13.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7BFC100EBA4;
 Thu, 26 Mar 2020 05:50:54 +0000 (UTC)
Subject: Re: [PATCH V8 9/9] virtio: Intel IFC VF driver for VDPA
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200325082711.1107-1-jasowang@redhat.com>
 <20200325082711.1107-10-jasowang@redhat.com>
 <20200325123410.GX13183@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ed04692d-236c-2eee-4429-6ef4d5d165fe@redhat.com>
Date: Thu, 26 Mar 2020 13:50:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200325123410.GX13183@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: kvm@vger.kernel.org, mst@redhat.com, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, shahafs@mellanox.com, parav@mellanox.com,
 vmireyno@marvell.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 maxime.coquelin@redhat.com, netdev@vger.kernel.org, lingshan.zhu@intel.com
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvMy8yNSDkuIvljYg4OjM0LCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gV2Vk
LCBNYXIgMjUsIDIwMjAgYXQgMDQ6Mjc6MTFQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4g
K3N0YXRpYyBpbnQgaWZjdmZfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGNvbnN0IHN0cnVj
dCBwY2lfZGV2aWNlX2lkICppZCkKPj4gK3sKPj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRl
di0+ZGV2Owo+PiArCXN0cnVjdCBpZmN2Zl9hZGFwdGVyICphZGFwdGVyOwo+PiArCXN0cnVjdCBp
ZmN2Zl9odyAqdmY7Cj4+ICsJaW50IHJldCwgaTsKPj4gKwo+PiArCXJldCA9IHBjaV9lbmFibGVf
ZGV2aWNlKHBkZXYpOwo+PiArCWlmIChyZXQpIHsKPj4gKwkJSUZDVkZfRVJSKCZwZGV2LT5kZXYs
ICJGYWlsZWQgdG8gZW5hYmxlIGRldmljZVxuIik7Cj4+ICsJCWdvdG8gZXJyX2VuYWJsZTsKPj4g
Kwl9Cj4+ICsKPj4gKwlyZXQgPSBwY2lfcmVxdWVzdF9yZWdpb25zKHBkZXYsIElGQ1ZGX0RSSVZF
Ul9OQU1FKTsKPj4gKwlpZiAocmV0KSB7Cj4+ICsJCUlGQ1ZGX0VSUigmcGRldi0+ZGV2LCAiRmFp
bGVkIHRvIHJlcXVlc3QgTU1JTyByZWdpb25cbiIpOwo+PiArCQlnb3RvIGVycl9yZWdpb25zOwo+
PiArCX0KPj4gKwo+PiArCXJldCA9IHBjaV9hbGxvY19pcnFfdmVjdG9ycyhwZGV2LCBJRkNWRl9N
QVhfSU5UUiwKPj4gKwkJCQkgICAgSUZDVkZfTUFYX0lOVFIsIFBDSV9JUlFfTVNJWCk7Cj4+ICsJ
aWYgKHJldCA8IDApIHsKPj4gKwkJSUZDVkZfRVJSKCZwZGV2LT5kZXYsICJGYWlsZWQgdG8gYWxs
b2MgaXJxIHZlY3RvcnNcbiIpOwo+PiArCQlnb3RvIGVycl92ZWN0b3JzOwo+PiArCX0KPj4gKwo+
PiArCWFkYXB0ZXIgPSB2ZHBhX2FsbG9jX2RldmljZShpZmN2Zl9hZGFwdGVyLCB2ZHBhLCBkZXYs
ICZpZmNfdmRwYV9vcHMpOwo+PiArCWlmIChhZGFwdGVyID09IE5VTEwpIHsKPj4gKwkJSUZDVkZf
RVJSKCZwZGV2LT5kZXYsICJGYWlsZWQgdG8gYWxsb2NhdGUgdkRQQSBzdHJ1Y3R1cmUiKTsKPj4g
KwkJcmV0ID0gLUVOT01FTTsKPj4gKwkJZ290byBlcnJfYWxsb2M7Cj4+ICsJfQo+PiArCj4+ICsJ
YWRhcHRlci0+ZGV2ID0gZGV2Owo+PiArCXBjaV9zZXRfbWFzdGVyKHBkZXYpOwo+PiArCXBjaV9z
ZXRfZHJ2ZGF0YShwZGV2LCBhZGFwdGVyKTsKPj4gKwo+PiArCXJldCA9IGlmY3ZmX3JlcXVlc3Rf
aXJxKGFkYXB0ZXIpOwo+PiArCWlmIChyZXQpIHsKPj4gKwkJSUZDVkZfRVJSKCZwZGV2LT5kZXYs
ICJGYWlsZWQgdG8gcmVxdWVzdCBNU0ktWCBpcnFcbiIpOwo+PiArCQlnb3RvIGVycl9tc2l4Owo+
PiArCX0KPj4gKwo+PiArCXZmID0gJmFkYXB0ZXItPnZmOwo+PiArCWZvciAoaSA9IDA7IGkgPCBJ
RkNWRl9QQ0lfTUFYX1JFU09VUkNFOyBpKyspIHsKPj4gKwkJdmYtPm1lbV9yZXNvdXJjZVtpXS5w
aHlzX2FkZHIgPSBwY2lfcmVzb3VyY2Vfc3RhcnQocGRldiwgaSk7Cj4+ICsJCXZmLT5tZW1fcmVz
b3VyY2VbaV0ubGVuID0gcGNpX3Jlc291cmNlX2xlbihwZGV2LCBpKTsKPj4gKwkJaWYgKCF2Zi0+
bWVtX3Jlc291cmNlW2ldLmxlbikKPj4gKwkJCWNvbnRpbnVlOwo+PiArCj4+ICsJCXZmLT5tZW1f
cmVzb3VyY2VbaV0uYWRkciA9IHBjaV9pb21hcF9yYW5nZShwZGV2LCBpLCAwLAo+PiArCQkJCXZm
LT5tZW1fcmVzb3VyY2VbaV0ubGVuKTsKPj4gKwkJaWYgKCF2Zi0+bWVtX3Jlc291cmNlW2ldLmFk
ZHIpIHsKPj4gKwkJCUlGQ1ZGX0VSUigmcGRldi0+ZGV2LAo+PiArCQkJCSAgIkZhaWxlZCB0byBt
YXAgSU8gcmVzb3VyY2UgJWRcbiIsIGkpOwo+PiArCQkJcmV0ID0gLUVJTlZBTDsKPj4gKwkJCWdv
dG8gZXJyX21zaXg7Cj4+ICsJCX0KPj4gKwl9Cj4+ICsKPj4gKwlpZiAoaWZjdmZfaW5pdF9odyh2
ZiwgcGRldikgPCAwKSB7Cj4+ICsJCXJldCA9IC1FSU5WQUw7Cj4+ICsJCWdvdG8gZXJyX21zaXg7
Cj4+ICsJfQo+PiArCj4+ICsJcmV0ID0gZG1hX3NldF9tYXNrX2FuZF9jb2hlcmVudCgmcGRldi0+
ZGV2LCBETUFfQklUX01BU0soNjQpKTsKPj4gKwlpZiAocmV0KQo+PiArCQlyZXQgPSBkbWFfc2V0
X21hc2tfYW5kX2NvaGVyZW50KCZwZGV2LT5kZXYsIERNQV9CSVRfTUFTSygzMikpOwo+PiArCj4+
ICsJaWYgKHJldCkgewo+PiArCQlJRkNWRl9FUlIoYWRhcHRlci0+ZGV2LCAiTm8gdXNhYmxlIERN
QSBjb25maXVncmF0aW9uXG4iKTsKPj4gKwkJcmV0ID0gLUVJTlZBTDsKPj4gKwkJZ290byBlcnJf
bXNpeDsKPj4gKwl9Cj4+ICsKPj4gKwlhZGFwdGVyLT52ZHBhLmRtYV9kZXYgPSBkZXY7Cj4+ICsJ
cmV0ID0gdmRwYV9yZWdpc3Rlcl9kZXZpY2UoJmFkYXB0ZXItPnZkcGEpOwo+PiArCWlmIChyZXQp
IHsKPj4gKwkJSUZDVkZfRVJSKGFkYXB0ZXItPmRldiwgIkZhaWxlZCB0byByZWdpc3RlciBpZmN2
ZiB0byB2ZHBhIGJ1cyIpOwo+PiArCQlnb3RvIGVycl9tc2l4Owo+PiArCX0KPj4gKwo+PiArCXJl
dHVybiAwOwo+PiArCj4+ICtlcnJfbXNpeDoKPj4gKwlwdXRfZGV2aWNlKCZhZGFwdGVyLT52ZHBh
LmRldik7Cj4+ICsJcmV0dXJuIHJldDsKPj4gK2Vycl9hbGxvYzoKPj4gKwlwY2lfZnJlZV9pcnFf
dmVjdG9ycyhwZGV2KTsKPj4gK2Vycl92ZWN0b3JzOgo+PiArCXBjaV9yZWxlYXNlX3JlZ2lvbnMo
cGRldik7Cj4+ICtlcnJfcmVnaW9uczoKPj4gKwlwY2lfZGlzYWJsZV9kZXZpY2UocGRldik7Cj4+
ICtlcnJfZW5hYmxlOgo+PiArCXJldHVybiByZXQ7Cj4+ICt9Cj4gSSBwZXJzb25hbGx5IGRvbid0
IGxpa2Ugc2VlaW5nIGdvdG8gdW53aW5kcyB3aXRoIG11bHRpcGxlIHJldHVybnMsIGFuZAo+IGhl
cmUgSSB0aGluayBpdCBpcyBhY3R1YWxseSBhIHRpbnkgYnVnLgo+Cj4gQWxsIHRvdWNoZXMgdG8g
dGhlIFBDSSBkZXZpY2UgbXVzdCBzdG9wIGJlZm9yZSB0aGUgZHJpdmVyIGNvcmUKPiByZW1vdmUo
KSByZXR1cm5zIC0gc28gdGhlc2UgcGNpIGZ1bmN0aW9uIGNhbm5vdCBiZSBpbiB0aGUga3JlZiBw
dXQKPiByZWxlYXNlIGZ1bmN0aW9uIGFueWhvdy4KCgpJJ20gbm90IHN1cmUgSSBnZXQgaGVyZS4g
SUZDVkYgaGVsZCByZWZjbnQgb2YgaXRzIFBDSSBwYXJlbnQsIHNvIGl0IApsb29rcyB0byBtZSBp
dCdzIHNhZmUgdG8gZnJlZSBQQ0kgcmVzb3VyY2VzIGluIHZEUEEgZnJlZSBjYWxsYmFjaz8KCgo+
Cj4gU3VnZ2VzdCB0byB1c2UgdGhlIGRldm0gdmVyc2lvbnMgb2YgdGhlIGFib3ZlIGluc3RlYWQs
IGFuZCB0aGVuIHlvdQo+IGNhbiByZW9yZGVyIHRoaW5ncyBzbyB0aGUgYWxsb2NhdGlvbiBpcyBk
b25lIGZpcnN0Lgo+Cj4gSmFzb24KCgpVc2luZyBkZXZtIGxvb2tzIG5pY2UsIGJ1dCBpZiBpdCdz
IHBvc3NpYmxlIEkgcHJlZmVyIHRvIHR3ZWFrIG9uIHRvcC4KClRoYW5rcwoKCj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
