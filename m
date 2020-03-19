Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A416318AE2F
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 09:15:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 392AE88287;
	Thu, 19 Mar 2020 08:15:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MjINTjnqCQaX; Thu, 19 Mar 2020 08:15:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A5D5688281;
	Thu, 19 Mar 2020 08:15:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 837CCC07FF;
	Thu, 19 Mar 2020 08:15:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C901DC07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 08:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B6890204BC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 08:15:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b-EEsrpU1uPO
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 08:15:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by silver.osuosl.org (Postfix) with ESMTPS id E09FB203C9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 08:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584605751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TgtDtG3cRVj31mITgFClFTokcEIBD9CXpdML9H7Wb8k=;
 b=OQZKXqXxdyRhU92rEGhd7sJG3gAi4j5gU6xdxv8iZ4VD99LArR56QY+N/pCIwGQBAxx4Z6
 1iTx6grokSq+CHArLU/s2fLFzfO5gWvroP+U3t5RoS6zvvMIHlOdo4tC4Z/h1AflHFP8nH
 GJzY3y1BvqHfAEoVWCg+kMqcG7pa3HI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-1bCvthWzPxO0ZFGWraD_bQ-1; Thu, 19 Mar 2020 04:15:50 -0400
X-MC-Unique: 1bCvthWzPxO0ZFGWraD_bQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49FA9189D6C3;
 Thu, 19 Mar 2020 08:15:47 +0000 (UTC)
Received: from [10.72.12.119] (ovpn-12-119.pek2.redhat.com [10.72.12.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A67B19756;
 Thu, 19 Mar 2020 08:14:40 +0000 (UTC)
Subject: Re: [PATCH V6 8/8] virtio: Intel IFC VF driver for VDPA
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200318080327.21958-1-jasowang@redhat.com>
 <20200318080327.21958-9-jasowang@redhat.com>
 <20200318122255.GG13183@mellanox.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <30359bae-d66a-0311-0028-d7d33b8295f2@redhat.com>
Date: Thu, 19 Mar 2020 16:14:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200318122255.GG13183@mellanox.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Ck9uIDIwMjAvMy8xOCDkuIvljYg4OjIyLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gV2Vk
LCBNYXIgMTgsIDIwMjAgYXQgMDQ6MDM6MjdQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4g
RnJvbTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPgo+PiArCj4+ICtzdGF0
aWMgaW50IGlmY3ZmX3ZkcGFfYXR0YWNoKHN0cnVjdCBpZmN2Zl9hZGFwdGVyICphZGFwdGVyKQo+
PiArewo+PiArCWludCByZXQ7Cj4+ICsKPj4gKwlhZGFwdGVyLT52ZHBhX2RldiAgPSB2ZHBhX2Fs
bG9jX2RldmljZShhZGFwdGVyLT5kZXYsIGFkYXB0ZXItPmRldiwKPj4gKwkJCQkJICAgICAgICZp
ZmNfdmRwYV9vcHMpOwo+PiArCWlmIChJU19FUlIoYWRhcHRlci0+dmRwYV9kZXYpKSB7Cj4+ICsJ
CUlGQ1ZGX0VSUihhZGFwdGVyLT5kZXYsICJGYWlsZWQgdG8gaW5pdCBpZmN2ZiBvbiB2ZHBhIGJ1
cyIpOwo+PiArCQlwdXRfZGV2aWNlKCZhZGFwdGVyLT52ZHBhX2Rldi0+ZGV2KTsKPj4gKwkJcmV0
dXJuIC1FTk9ERVY7Cj4+ICsJfQo+IFRoZSBwb2ludCBvZiBoYXZpbmcgYW4gYWxsb2MgY2FsbCBp
cyBzbyB0aGF0IHRoZSBkcml2ZXJzCj4gaWZjdmZfYWRhcHRvciBtZW1vcnkgY291bGQgYmUgcGxh
Y2VkIGluIHRoZSBzYW1lIHN0cnVjdCAtIGVnIHVzZQo+IGNvbnRhaW5lcl9vZiB0byBmbGlwIGJl
dHdlZW4gdGhlbSwgYW5kIGhhdmUgYSBrcmVmIGZvciBib3RoIG1lbW9yaWVzLgo+Cj4gSXQgc2Vl
bSByZWFsbHkgd2VpcmQgdG8gaGF2ZSBhbiBhbGxvYyBmb2xsb3dlZCBpbW1lZGlhdGVseSBieQo+
IHJlZ2lzdGVyLgoKCkkgYWRtaXQgdGhlIGlmY3ZmX2FkYXB0ZXIgaXMgbm90IGNvcnJlY3RseSBy
ZWYtY291bnRlZC4gV2hhdCB5b3Ugc3VnZ2VzdCAKc2hvdWxkIHdvcmsuIEJ1dCBpdCBsb29rcyB0
byBtZSB0aGUgZm9sbG93aW5nIGlzIG1vcmUgY2xlYW5lciBzaW5jZSB0aGUgCm1lbWJlcnMgb2Yg
aWZjdmZfYWRhcHRlciBhcmUgYWxsIHJlbGF0ZWQgdG8gUENJIGRldmljZSBub3QgdkRQQSBpdHNl
bGYuCgotIGtlZXAgdGhlIGN1cnJlbnQgbGF5b3V0IG9mIGlmY3ZmX2FkYXB0ZXIKLSBtZXJnZSB2
ZHBhX2FsbG9jX2RldmljZSgpIGFuZCB2ZHBhX3JlZ2lzdGVyX2RldmljZSgpCi0gdXNlIGRldnJl
cyB0byBiaW5kIGlmY3ZmX2FkYXB0ZXIgcmVmY250L2xpZmN5Y2xlIHRvIHRoZSB1bmRlciBQQ0kg
ZGV2aWNlCgpJZiB3ZSBnbyBmb3IgdGhlIGNvbnRhaW5lcl9vZiBtZXRob2QsIHdlIHByb2JhYmx5
IG5lZWQKCi0gYWNjZXB0IGEgc2l6ZSBvZiBwYXJlbnQgcGFyZW50IHN0cnVjdHVyZSBpbiB2ZHBh
X2FsbG9jX2RldmljZSgpIGFuZCAKbWFuZGF0ZSB2ZHBhX2RldmljZSB0byBiZSB0aGUgZmlyc3Qg
bWVtYmVyIG9mIGlmY3ZmX2FkYXB0ZXIKLSB3ZSBuZWVkIHByb3ZpZGUgYSB3YXkgdG8gZnJlZSBy
ZXNvdXJjZXMgb2YgcGFyZW50IHN0cnVjdHVyZSB3aGVuIHdlIApkZXN0cm95IHZEUEEgZGV2aWNl
CgpXaGF0J3MgeW91ciB0aG91Z2h0PwoKCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnRpby92
aXJ0aW9fdmRwYS5jIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX3ZkcGEuYwo+PiBpbmRleCBjMzBl
YjU1MDMwYmUuLmRlNjRiODhlZTdlNCAxMDA2NDQKPj4gKysrIGIvZHJpdmVycy92aXJ0aW8vdmly
dGlvX3ZkcGEuYwo+PiBAQCAtMzYyLDYgKzM2Miw3IEBAIHN0YXRpYyBpbnQgdmlydGlvX3ZkcGFf
cHJvYmUoc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhKQo+PiAgIAkJZ290byBlcnI7Cj4+ICAgCj4+
ICAgCXZkcGFfc2V0X2RydmRhdGEodmRwYSwgdmRfZGV2KTsKPj4gKwlkZXZfaW5mbyh2ZF9kZXYt
PnZkZXYuZGV2LnBhcmVudCwgImRldmljZSBhdHRhY2hlZCB0byBWRFBBIGJ1c1xuIik7Cj4+ICAg
Cj4+ICAgCXJldHVybiAwOwo+IFRoaXMgaHVuayBzZWVtcyBvdXQgb2YgcGxhY2UKPgo+IEphc29u
CgoKUmlnaHQsIHdpbGwgZml4LgoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6
YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
