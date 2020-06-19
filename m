Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7D1200304
	for <lists.virtualization@lfdr.de>; Fri, 19 Jun 2020 09:54:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DE4FC88A05;
	Fri, 19 Jun 2020 07:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fC+EfsGSRkKs; Fri, 19 Jun 2020 07:54:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2DDF48506F;
	Fri, 19 Jun 2020 07:54:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 016ACC016E;
	Fri, 19 Jun 2020 07:54:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0DD4CC016E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Jun 2020 07:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EA67B87199
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Jun 2020 07:54:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dfmLLAiZ6y2a
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Jun 2020 07:54:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 316AF87171
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Jun 2020 07:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592553270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bryp9+XYVmgJRh4PMhNskE1wuXqIjMfjYcFoobgkJo4=;
 b=dOm7jvz0s4gxSWMPdcn6uyRgZEnBIkLKe6uzT6tiHE3QrkrQRRS5xlDRfQ/1FtGHgz4XL/
 85I9C5WbEGjtw0EsOSxtmsnAqIoNA56xwIyLFOwxBRkQmYxUf6A3Mim1ZpGlb6RldI5kLK
 /89sKd0DA/DwrmhRiZEOFMklSf+5QF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-jVicbQ_XMoyMczAOJrkecQ-1; Fri, 19 Jun 2020 03:54:27 -0400
X-MC-Unique: jVicbQ_XMoyMczAOJrkecQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B191B873074;
 Fri, 19 Jun 2020 07:54:26 +0000 (UTC)
Received: from [10.72.13.200] (ovpn-13-200.pek2.redhat.com [10.72.13.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6BD45C1BB;
 Fri, 19 Jun 2020 07:54:20 +0000 (UTC)
Subject: Re: [PATCH] virtio-mem: Fix build error due to improper use 'select'
To: Weilong Chen <chenweilong@huawei.com>, mst@redhat.com,
 virtualization@lists.linux-foundation.org, lizefan@huawei.com
References: <20200619080333.194753-1-chenweilong@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <953448d3-9e7c-3a96-b28b-edaf8b775e4d@redhat.com>
Date: Fri, 19 Jun 2020 15:54:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200619080333.194753-1-chenweilong@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: linux-kernel@vger.kernel.org
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

Ck9uIDIwMjAvNi8xOSDkuIvljYg0OjAzLCBXZWlsb25nIENoZW4gd3JvdGU6Cj4gQXMgbm90ZWQg
aW46Cj4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvRG9jdW1lbnRhdGlvbi9rYnVpbGQva2Nv
bmZpZy1sYW5ndWFnZS50eHQKPiAic2VsZWN0IHNob3VsZCBiZSB1c2VkIHdpdGggY2FyZS4gc2Vs
ZWN0IHdpbGwgZm9yY2UgYSBzeW1ib2wgdG8gYQo+IHZhbHVlIHdpdGhvdXQgdmlzaXRpbmcgdGhl
IGRlcGVuZGVuY2llcy4iCj4gQ29uZmlnIFZJUlRJT19NRU0gc2hvdWxkIG5vdCBzZWxlY3QgQ09O
VElHX0FMTE9DIGRpcmVjdGx5Lgo+IE90aGVyd2lzZSBpdCB3aWxsIGNhdXNlIGFuIGVycm9yOgo+
IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjA4MjQ1Cj4KPiBT
aWduZWQtb2ZmLWJ5OiBXZWlsb25nIENoZW4gPGNoZW53ZWlsb25nQGh1YXdlaS5jb20+Cj4gLS0t
Cj4gICBkcml2ZXJzL3ZpcnRpby9LY29uZmlnIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0
aW8vS2NvbmZpZyBiL2RyaXZlcnMvdmlydGlvL0tjb25maWcKPiBpbmRleCA1ODA5ZTVmNWIxNTcu
LjVjOTJlNGE1MDg4MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpcnRpby9LY29uZmlnCj4gKysr
IGIvZHJpdmVycy92aXJ0aW8vS2NvbmZpZwo+IEBAIC04NSw3ICs4NSw3IEBAIGNvbmZpZyBWSVJU
SU9fTUVNCj4gICAJZGVwZW5kcyBvbiBWSVJUSU8KPiAgIAlkZXBlbmRzIG9uIE1FTU9SWV9IT1RQ
TFVHX1NQQVJTRQo+ICAgCWRlcGVuZHMgb24gTUVNT1JZX0hPVFJFTU9WRQo+IC0Jc2VsZWN0IENP
TlRJR19BTExPQwo+ICsJZGVwZW5kcyBvbiBDT05USUdfQUxMT0MKPiAgIAloZWxwCj4gICAJIFRo
aXMgZHJpdmVyIHByb3ZpZGVzIGFjY2VzcyB0byB2aXJ0aW8tbWVtIHBhcmF2aXJ0dWFsaXplZCBt
ZW1vcnkKPiAgIAkgZGV2aWNlcywgYWxsb3dpbmcgdG8gaG90cGx1ZyBhbmQgaG90dW5wbHVnIG1l
bW9yeS4KCgpBY2tlZC1ieTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
