Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4F119C538
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 17:00:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C8D61880E2;
	Thu,  2 Apr 2020 15:00:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rgZ2CgL0C8iu; Thu,  2 Apr 2020 15:00:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DCC7188072;
	Thu,  2 Apr 2020 15:00:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7C2AC07FF;
	Thu,  2 Apr 2020 15:00:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B18EFC07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 15:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A9EC587C42
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 15:00:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RiozPY7km2Gu
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 15:00:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C9900879FD
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585839598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1cCmqKOlQ5uNMhi/s9okkTSfSwLDfmuDXSmQS/oyntI=;
 b=G3naR6ascmfCKPiXbO0TNaQudrFFy5J3aoNaKtNLIQn9mmvjsfUP3bpFnvaaxNX9w3NEPn
 e/WtRqdtBHCvnMBzbyKf8/C7nfRYmibomACPpBLjMMLZ8GeFj9EHaIfI9aZbOfOp5MCoXU
 +K6AnKGjODHE6SJ/OREnnkpx5kql0Ko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-sp5wDE-tO5aRyuQXauUcsg-1; Thu, 02 Apr 2020 10:59:56 -0400
X-MC-Unique: sp5wDE-tO5aRyuQXauUcsg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BEEB18A6EC8;
 Thu,  2 Apr 2020 14:59:55 +0000 (UTC)
Received: from [10.72.12.172] (ovpn-12-172.pek2.redhat.com [10.72.12.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4F8F1001925;
 Thu,  2 Apr 2020 14:59:50 +0000 (UTC)
Subject: Re: [PATCH] vhost: drop vring dependency on iotlb
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200402141207.32628-1-mst@redhat.com>
 <afe230b9-708f-02a1-c3af-51e9d4fdd212@redhat.com>
 <20200402103551-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4ba378d7-ce02-a085-dbd7-0c1cbe2d5bab@redhat.com>
Date: Thu, 2 Apr 2020 22:59:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200402103551-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvNC8yIOS4i+WNiDEwOjM2LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VGh1LCBBcHIgMDIsIDIwMjAgYXQgMTA6Mjg6MjhQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gT24gMjAyMC80LzIg5LiL5Y2IMTA6MTIsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+
IHZyaW5naCBjYW4gbm93IGJlIGJ1aWx0IHdpdGhvdXQgSU9UTEIuCj4+PiBTZWxlY3QgSU9UTEIg
ZGlyZWN0bHkgd2hlcmUgaXQncyB1c2VkLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwg
Uy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4+PiAtLS0KPj4+Cj4+PiBUaGlzIGlzIG9uIHRv
cCBvZiBteSBwcmV2aW91cyBwYXRjaCAoaW4gdmhvc3QgdHJlZSBub3cpLgo+Pj4KPj4+ICAgIGRy
aXZlcnMvdmRwYS9LY29uZmlnICB8IDEgKwo+Pj4gICAgZHJpdmVycy92aG9zdC9LY29uZmlnIHwg
MSAtCj4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS9LY29uZmlnIGIvZHJpdmVycy92ZHBh
L0tjb25maWcKPj4+IGluZGV4IDdkYjE0NjAxMDRiNy4uMDhiNjE1ZjJkYTM5IDEwMDY0NAo+Pj4g
LS0tIGEvZHJpdmVycy92ZHBhL0tjb25maWcKPj4+ICsrKyBiL2RyaXZlcnMvdmRwYS9LY29uZmln
Cj4+PiBAQCAtMTcsNiArMTcsNyBAQCBjb25maWcgVkRQQV9TSU0KPj4+ICAgIAlkZXBlbmRzIG9u
IFJVTlRJTUVfVEVTVElOR19NRU5VCj4+PiAgICAJc2VsZWN0IFZEUEEKPj4+ICAgIAlzZWxlY3Qg
VkhPU1RfUklORwo+Pj4gKwlzZWxlY3QgVkhPU1RfSU9UTEIKPj4+ICAgIAlkZWZhdWx0IG4KPj4+
ICAgIAloZWxwCj4+PiAgICAJICB2RFBBIG5ldHdvcmtpbmcgZGV2aWNlIHNpbXVsYXRvciB3aGlj
aCBsb29wIFRYIHRyYWZmaWMgYmFjawo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvS2Nv
bmZpZyBiL2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+Pj4gaW5kZXggMjFmZWVhMGQ2OWM5Li5iZGQy
NzBmZWRlMjYgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL3Zob3N0L0tjb25maWcKPj4+ICsrKyBi
L2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+Pj4gQEAgLTYsNyArNiw2IEBAIGNvbmZpZyBWSE9TVF9J
T1RMQgo+Pj4gICAgY29uZmlnIFZIT1NUX1JJTkcKPj4+ICAgIAl0cmlzdGF0ZQo+Pj4gLQlzZWxl
Y3QgVkhPU1RfSU9UTEIKPj4+ICAgIAloZWxwCj4+PiAgICAJICBUaGlzIG9wdGlvbiBpcyBzZWxl
Y3RlZCBieSBhbnkgZHJpdmVyIHdoaWNoIG5lZWRzIHRvIGFjY2Vzcwo+Pj4gICAgCSAgdGhlIGhv
c3Qgc2lkZSBvZiBhIHZpcnRpbyByaW5nLgo+Pgo+PiBEbyB3ZSBuZWVkIHRvIG1lbnRpb24gZHJp
dmVyIG5lZWQgdG8gc2VsZWN0IFZIT1NUX0lPVExCIGJ5IGl0c2VsZiBoZXJlPwo+Pgo+PiBUaGFu
a3MKPj4KPiBPSyBidXQgSSBndWVzcyBpdCdzIGJlc3QgdG8gZG8gaXQgbmVhciB3aGVyZSBWSE9T
VF9JT1RMQiBpcyBkZWZpbmVkLgo+IExpa2UgdGhpcz8KPgo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdmhvc3QvS2NvbmZpZyBiL2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+IGluZGV4IGJkZDI3MGZl
ZGUyNi4uY2U1MTEyNmY1MWU3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+
ICsrKyBiL2RyaXZlcnMvdmhvc3QvS2NvbmZpZwo+IEBAIC0zLDYgKzMsOCBAQCBjb25maWcgVkhP
U1RfSU9UTEIKPiAgIAl0cmlzdGF0ZQo+ICAgCWhlbHAKPiAgIAkgIEdlbmVyaWMgSU9UTEIgaW1w
bGVtZW50YXRpb24gZm9yIHZob3N0IGFuZCB2cmluZ2guCj4gKwkgIFRoaXMgb3B0aW9uIGlzIHNl
bGVjdGVkIGJ5IGFueSBkcml2ZXIgd2hpY2ggbmVlZHMgdG8gc3VwcG9ydAo+ICsJICBhbiBJT01N
VSBpbiBzb2Z0d2FyZS4KPiAgIAo+ICAgY29uZmlnIFZIT1NUX1JJTkcKPiAgIAl0cmlzdGF0ZQo+
CgpZZXMsIHByb2JhYmx5LgoKVGhhbmtzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0
aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
