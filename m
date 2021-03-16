Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B90633CF45
	for <lists.virtualization@lfdr.de>; Tue, 16 Mar 2021 09:07:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A61328354D;
	Tue, 16 Mar 2021 08:07:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zw_8mKJ448HT; Tue, 16 Mar 2021 08:07:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 783D083834;
	Tue, 16 Mar 2021 08:07:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F912C0010;
	Tue, 16 Mar 2021 08:07:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E22BC000A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Mar 2021 08:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5411383760
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Mar 2021 08:07:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AI48Tcs-XyaU
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Mar 2021 08:07:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FFEB8354D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Mar 2021 08:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615882048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PN9y6XoBUNKBPG2escDAHz1LZLsNGtzXcJhXkRDovUk=;
 b=Z4NuH9TOB/HeQyhXUcvZSC9nOWF5EPk6XrNg+ZfKGVBK6fDb6WLgGAQDyvb/+8PxAOpVqx
 ME0xdmkiwanPy9McU4FA6TFP8VQK3NI4Wep8sCgZphTXSK+Mm6kAaU7BNzOvPNAWWBKWy1
 gcz9HSAam9adz9m+/nNh/Akc/f2d9iE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-zKz-XwnVOwGyCVtsR-W68g-1; Tue, 16 Mar 2021 04:07:27 -0400
X-MC-Unique: zKz-XwnVOwGyCVtsR-W68g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EABE814315;
 Tue, 16 Mar 2021 08:07:25 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-216.pek2.redhat.com
 [10.72.12.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1249B62A1B;
 Tue, 16 Mar 2021 08:07:16 +0000 (UTC)
Subject: Re: [RFC v2 12/13] vhost: Check for device VRING_USED_F_NO_NOTIFY at
 shadow virtqueue kick
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20210315194842.277740-1-eperezma@redhat.com>
 <20210315194842.277740-13-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <52806611-8435-f80a-63b4-51cfc7a9ead2@redhat.com>
Date: Tue, 16 Mar 2021 16:07:15 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210315194842.277740-13-eperezma@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Guru Prasad <guru.prasad@broadcom.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Michael Lilja <ml@napatech.com>, Jim Harford <jim.harford@broadcom.com>,
 Rob Miller <rob.miller@broadcom.com>
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

CuWcqCAyMDIxLzMvMTYg5LiK5Y2IMzo0OCwgRXVnZW5pbyBQw6lyZXog5YaZ6YGTOgo+IFNpZ25l
ZC1vZmYtYnk6IEV1Z2VuaW8gUMOpcmV6IDxlcGVyZXptYUByZWRoYXQuY29tPgo+IC0tLQo+ICAg
aHcvdmlydGlvL3Zob3N0LXNoYWRvdy12aXJ0cXVldWUuYyB8IDExICsrKysrKysrKystCj4gICAx
IGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAt
LWdpdCBhL2h3L3ZpcnRpby92aG9zdC1zaGFkb3ctdmlydHF1ZXVlLmMgYi9ody92aXJ0aW8vdmhv
c3Qtc2hhZG93LXZpcnRxdWV1ZS5jCj4gaW5kZXggNjhlZDBmMjc0MC4uN2RmOThmYzQzZiAxMDA2
NDQKPiAtLS0gYS9ody92aXJ0aW8vdmhvc3Qtc2hhZG93LXZpcnRxdWV1ZS5jCj4gKysrIGIvaHcv
dmlydGlvL3Zob3N0LXNoYWRvdy12aXJ0cXVldWUuYwo+IEBAIC0xNDUsNiArMTQ1LDE1IEBAIHN0
YXRpYyB2b2lkIHZob3N0X3NoYWRvd192cV9hZGQoVmhvc3RTaGFkb3dWaXJ0cXVldWUgKnN2cSwK
PiAgICAgICBzdnEtPnJpbmdfaWRfbWFwc1txZW11X2hlYWRdID0gZWxlbTsKPiAgIH0KPiAgIAo+
ICtzdGF0aWMgdm9pZCB2aG9zdF9zaGFkb3dfdnFfa2ljayhWaG9zdFNoYWRvd1ZpcnRxdWV1ZSAq
c3ZxKQo+ICt7Cj4gKyAgICAvKiBNYWtlIHN1cmUgd2UgYXJlIHJlYWRpbmcgdXBkYXRlZCBkZXZp
Y2UgZmxhZyAqLwo+ICsgICAgc21wX3JtYigpOwoKCnNtcF9tYigpIGFjdHVhbGx5PyBPciBpdCdz
IGJldHRlciB0byBleHBsYWluIHRoaXMgZm9sbG93aW5nIHJlYWQgbmVlZHMgCnRvIGJlIG9yZGVy
ZCB3aXRoIHdoYXQgcmVhZCBiZWZvcmUuCgpUaGFua3MKCgo+ICsgICAgaWYgKCEoc3ZxLT52cmlu
Zy51c2VkLT5mbGFncyAmIFZSSU5HX1VTRURfRl9OT19OT1RJRlkpKSB7Cj4gKyAgICAgICAgZXZl
bnRfbm90aWZpZXJfc2V0KCZzdnEtPmtpY2tfbm90aWZpZXIpOwo+ICsgICAgfQo+ICt9Cj4gKwo+
ICAgLyogSGFuZGxlIGd1ZXN0LT5kZXZpY2Ugbm90aWZpY2F0aW9ucyAqLwo+ICAgc3RhdGljIHZv
aWQgdmhvc3RfaGFuZGxlX2d1ZXN0X2tpY2soRXZlbnROb3RpZmllciAqbikKPiAgIHsKPiBAQCAt
MTc0LDcgKzE4Myw3IEBAIHN0YXRpYyB2b2lkIHZob3N0X2hhbmRsZV9ndWVzdF9raWNrKEV2ZW50
Tm90aWZpZXIgKm4pCj4gICAgICAgICAgICAgICB9Cj4gICAKPiAgICAgICAgICAgICAgIHZob3N0
X3NoYWRvd192cV9hZGQoc3ZxLCBlbGVtKTsKPiAtICAgICAgICAgICAgZXZlbnRfbm90aWZpZXJf
c2V0KCZzdnEtPmtpY2tfbm90aWZpZXIpOwo+ICsgICAgICAgICAgICB2aG9zdF9zaGFkb3dfdnFf
a2ljayhzdnEpOwo+ICAgICAgICAgICB9Cj4gICAKPiAgICAgICAgICAgdmlydGlvX3F1ZXVlX3Nl
dF9ub3RpZmljYXRpb24oc3ZxLT52cSwgdHJ1ZSk7CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
