Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D5A204AC9
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 09:15:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 06EBA88E5B;
	Tue, 23 Jun 2020 07:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7QfEDTAdtqo1; Tue, 23 Jun 2020 07:15:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9E7AE894B5;
	Tue, 23 Jun 2020 07:15:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 781A1C016F;
	Tue, 23 Jun 2020 07:15:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4227CC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 07:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2E76D87542
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 07:15:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nTevK4pjjNcC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 07:15:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1D6F28753C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 07:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592896550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HjkVUr/S/a3Xewkk0G7CYjpjGpF5YBjTPi+qkO5aYLE=;
 b=aK7ng8p+Nxs06rkLu5gfTAJySqfP/6uiCcAvz5uvTKAQ5P9RjDFFEQzQGXKgyJ9dMjcQfI
 DKlcf/JmJbYpwQR9jiGmNrUxDalqhjiOSKYzPGICsSxbhNLftDB6d6uPUvpvgszOdU0WC9
 szqqNVRlZE5kkZY7wZJcDY6maFM4Ze0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-0YPiTuEgM8O-Zx2HigyzCw-1; Tue, 23 Jun 2020 03:15:48 -0400
X-MC-Unique: 0YPiTuEgM8O-Zx2HigyzCw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 621081005512;
 Tue, 23 Jun 2020 07:15:47 +0000 (UTC)
Received: from [10.72.12.144] (ovpn-12-144.pek2.redhat.com [10.72.12.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E80E260F80;
 Tue, 23 Jun 2020 07:15:41 +0000 (UTC)
Subject: Re: [PATCH RFC v8 02/11] vhost: use batched get_vq_desc version
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20200611113404.17810-1-mst@redhat.com>
 <20200611113404.17810-3-mst@redhat.com>
 <0332b0cf-cf00-9216-042c-e870efa33626@redhat.com>
 <20200622115946-mutt-send-email-mst@kernel.org>
 <c56cc86d-a420-79ca-8420-e99db91980fa@redhat.com>
 <CAJaqyWc3C_Td_SpV97CuemkQH9vH+EL3sGgeWGE82E5gYxZNCA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6715f515-3db6-1006-09dd-19464e3ff676@redhat.com>
Date: Tue, 23 Jun 2020 15:15:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAJaqyWc3C_Td_SpV97CuemkQH9vH+EL3sGgeWGE82E5gYxZNCA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, kvm list <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
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

Ck9uIDIwMjAvNi8yMyDkuIvljYgzOjAwLCBFdWdlbmlvIFBlcmV6IE1hcnRpbiB3cm90ZToKPiBP
biBUdWUsIEp1biAyMywgMjAyMCBhdCA0OjUxIEFNIEphc29uIFdhbmcgPGphc293YW5nQHJlZGhh
dC5jb20+IHdyb3RlOgo+Pgo+PiBPbiAyMDIwLzYvMjMg5LiK5Y2IMTI6MDAsIE1pY2hhZWwgUy4g
VHNpcmtpbiB3cm90ZToKPj4+IE9uIFdlZCwgSnVuIDE3LCAyMDIwIGF0IDExOjE5OjI2QU0gKzA4
MDAsIEphc29uIFdhbmcgd3JvdGU6Cj4+Pj4gT24gMjAyMC82LzExIOS4i+WNiDc6MzQsIE1pY2hh
ZWwgUy4gVHNpcmtpbiB3cm90ZToKPj4+Pj4gICAgIHN0YXRpYyB2b2lkIHZob3N0X3ZxX2ZyZWVf
aW92ZWNzKHN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxKQo+Pj4+PiAgICAgewo+Pj4+PiAgICAg
IGtmcmVlKHZxLT5kZXNjcyk7Cj4+Pj4+IEBAIC0zOTQsNiArNDAwLDkgQEAgc3RhdGljIGxvbmcg
dmhvc3RfZGV2X2FsbG9jX2lvdmVjcyhzdHJ1Y3Qgdmhvc3RfZGV2ICpkZXYpCj4+Pj4+ICAgICAg
Zm9yIChpID0gMDsgaSA8IGRldi0+bnZxczsgKytpKSB7Cj4+Pj4+ICAgICAgICAgICAgICB2cSA9
IGRldi0+dnFzW2ldOwo+Pj4+PiAgICAgICAgICAgICAgdnEtPm1heF9kZXNjcyA9IGRldi0+aW92
X2xpbWl0Owo+Pj4+PiArICAgICAgICAgICBpZiAodmhvc3RfdnFfbnVtX2JhdGNoX2Rlc2NzKHZx
KSA8IDApIHsKPj4+Pj4gKyAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+Pj4g
KyAgICAgICAgICAgfQo+Pj4+IFRoaXMgY2hlY2sgYnJlYWtzIHZkcGEgd2hpY2ggc2V0IGlvdl9s
aW1pdCB0byB6ZXJvLiBDb25zaWRlciBpb3ZfbGltaXQgaXMKPj4+PiBtZWFuaW5nbGVzcyB0byB2
RFBBLCBJIHdvbmRlciB3ZSBjYW4gc2tpcCB0aGUgdGVzdCB3aGVuIGRldmljZSBkb2Vzbid0IHVz
ZQo+Pj4+IHdvcmtlci4KPj4+Pgo+Pj4+IFRoYW5rcwo+Pj4gSXQgZG9lc24ndCBuZWVkIGlvdmVj
cyBhdCBhbGwsIHJpZ2h0Pwo+Pj4KPj4+IC0tIE1TVAo+Pgo+PiBZZXMsIHNvIHdlIG1heSBjaG9v
c2UgdG8gYnlwYXNzIHRoZSBpb3ZlY3MgYXMgd2VsbC4KPj4KPj4gVGhhbmtzCj4+Cj4gSSB0aGlu
ayB0aGF0IHRoZSBrbWFsbG9jX2FycmF5IHJldHVybnMgWkVST19TSVpFX1BUUiBmb3IgYWxsIG9m
IHRoZW0KPiBpbiB0aGF0IGNhc2UsIHNvIEkgZGlkbid0IGJvdGhlciB0byBza2lwIHRoZSBrbWFs
bG9jX2FycmF5IHBhcnRzLgo+IFdvdWxkIHlvdSBwcmVmZXIgdG8gc2tpcCB0aGVtIGFsbCBhbmQg
bGV0IHRoZW0gTlVMTD8gT3IgaGF2ZSBJCj4gbWlzdW5kZXJzdG9vZCB3aGF0IHlvdSBtZWFuPwoK
CkknbSBvayB3aXRoIGVpdGhlciBhcHByb2FjaCwgYnV0IG15IHVuZGVyc3RhbmRpbmcgaXMgdGhh
dCBNaWNoYWVsIHdhbnRzIAp0byBza2lwIHRoZW0gYWxsLgoKVGhhbmtzCgoKPgo+IFRoYW5rcyEK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
