Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFCF2D0A39
	for <lists.virtualization@lfdr.de>; Mon,  7 Dec 2020 06:34:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 628DB86F86;
	Mon,  7 Dec 2020 05:34:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NMZb8zHGso54; Mon,  7 Dec 2020 05:34:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CAF5D86F06;
	Mon,  7 Dec 2020 05:34:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9FF97C013B;
	Mon,  7 Dec 2020 05:34:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 497F1C013B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 05:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2CC1F87087
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 05:33:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bi67QrpdYGLA
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 05:33:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6C96F86F77
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 05:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607319236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XACq9GWCmmo6NXYAQTYpk91pnPXTw+WCfYd579095OU=;
 b=Lq3K5i2VjO4wbn0w1SvDof0+yARq9uwzyOIo0/MW13kimzmFEPzASvUIC2FEGTy3cRWvMF
 kIz+jzZEVreyMmTEXz9cV62U6YtnYbXDQvMWR4q5y8bVVWJSIfWB7DfMeRh5WnE3HLRhY2
 yXmNzg2owEbxakAWEBzQs0KivkJd1Lo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-AGD0Oix3O_6b2Zn17OlPFg-1; Mon, 07 Dec 2020 00:33:53 -0500
X-MC-Unique: AGD0Oix3O_6b2Zn17OlPFg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 885B6803638;
 Mon,  7 Dec 2020 05:33:52 +0000 (UTC)
Received: from [10.72.13.171] (ovpn-13-171.pek2.redhat.com [10.72.13.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5042610016F5;
 Mon,  7 Dec 2020 05:33:43 +0000 (UTC)
Subject: Re: [PATCH v3 19/19] vdpa: split vdpasim to core and net modules
To: Stefano Garzarella <sgarzare@redhat.com>,
 virtualization@lists.linux-foundation.org
References: <20201203170511.216407-1-sgarzare@redhat.com>
 <20201203170511.216407-20-sgarzare@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <767b99ba-4062-ccb9-7eba-f00bb371eaaf@redhat.com>
Date: Mon, 7 Dec 2020 13:33:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201203170511.216407-20-sgarzare@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 Shahaf Shuler <shahafs@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <elic@nvidia.com>, Oren Duer <oren@nvidia.com>
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

Ck9uIDIwMjAvMTIvNCDkuIrljYgxOjA1LCBTdGVmYW5vIEdhcnphcmVsbGEgd3JvdGU6Cj4gRnJv
bTogTWF4IEd1cnRvdm95PG1ndXJ0b3ZveUBudmlkaWEuY29tPgo+Cj4gSW50cm9kdWNlIG5ldyB2
ZHBhX3NpbV9uZXQgYW5kIHZkcGFfc2ltIChjb3JlKSBkcml2ZXJzLiBUaGlzIGlzIGEKPiBwcmVw
YXJhdGlvbiBmb3IgYWRkaW5nIGEgdmRwYSBzaW11bGF0b3IgbW9kdWxlIGZvciBibG9jayBkZXZp
Y2VzLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWF4IEd1cnRvdm95PG1ndXJ0b3ZveUBudmlkaWEuY29t
Pgo+IFtzZ2FyemFyZTogdmFyaW91cyBjbGVhbnVwcy9maXhlc10KPiBTaWduZWQtb2ZmLWJ5OiBT
dGVmYW5vIEdhcnphcmVsbGE8c2dhcnphcmVAcmVkaGF0LmNvbT4KPiAtLS0KPiB2MjoKPiAtIEZp
eGVkICJ3YXJuaW5nOiB2YXJpYWJsZSAnZGV2JyBpcyB1c2VkIHVuaW5pdGlhbGl6ZWQiIHJlcG9y
dGVkIGJ5Cj4gICAgJ2tlcm5lbCB0ZXN0IHJvYm90JyBhbmQgRGFuIENhcnBlbnRlcgo+IC0gcmVi
YXNlZCBvbiB0b3Agb2Ygb3RoZXIgY2hhbmdlcyAoZGV2X2F0dHIsIGdldF9jb25maWcoKSwgbm90
aWZ5KCksIGV0Yy4pCj4gLSBsZWZ0IGJhdGNoX21hcHBpbmcgbW9kdWxlIHBhcmFtZXRlciBpbiB0
aGUgY29yZSBbSmFzb25dCj4KPiB2MToKPiAtIFJlbW92ZWQgdW51c2VkIGhlYWRlcnMKPiAtIFJl
bW92ZWQgZW1wdHkgbW9kdWxlX2luaXQoKSBtb2R1bGVfZXhpdCgpCj4gLSBNb3ZlZCB2ZHBhc2lt
X2lzX2xpdHRsZV9lbmRpYW4oKSBpbiB2ZHBhX3NpbS5oCj4gLSBNb3ZlZCB2ZHBhc2ltMTZfdG9f
Y3B1L2NwdV90b192ZHBhc2ltMTYoKSBpbiB2ZHBhX3NpbS5oCj4gLSBBZGRlZCB2ZHBhc2ltKl90
b19jcHUvY3B1X3RvX3ZkcGFzaW0qKCkgYWxzbyBmb3IgMzIgYW5kIDY0Cj4gLSBSZXBsYWNlZCAn
c2VsZWN0IFZEUEFfU0lNJyB3aXRoICdkZXBlbmRzIG9uIFZEUEFfU0lNJyBzaW5jZSBzZWxlY3Rl
ZAo+ICAgIG9wdGlvbiBjYW4gbm90IGRlcGVuZCBvbiBvdGhlciBbSmFzb25dCj4gLS0tCj4gICBk
cml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uaCAgICAgfCAxMDUgKysrKysrKysrKysrKwo+
ICAgZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMgICAgIHwgMjI0ICstLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+ICAgZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltX25ldC5j
IHwgMTcxICsrKysrKysrKysrKysrKysrKysrCj4gICBkcml2ZXJzL3ZkcGEvS2NvbmZpZyAgICAg
ICAgICAgICAgICAgfCAgMTMgKy0KPiAgIGRyaXZlcnMvdmRwYS92ZHBhX3NpbS9NYWtlZmlsZSAg
ICAgICB8ICAgMSArCj4gICA1IGZpbGVzIGNoYW5nZWQsIDI5MiBpbnNlcnRpb25zKCspLCAyMjIg
ZGVsZXRpb25zKC0pCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92ZHBhL3ZkcGFfc2lt
L3ZkcGFfc2ltLmgKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZkcGEvdmRwYV9zaW0v
dmRwYV9zaW1fbmV0LmMKCgpBY2tlZC1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNv
bT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vdmlydHVhbGl6YXRpb24=
